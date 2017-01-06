<?php

class Con_tipo_cont_recaudo extends Controller
{
   
    var $vismenu;
    var $tipo_co;
    var $Vmin; //minima fecha de emision de un registro
    var $fecha_emi;
    var $periodoactual;
    var $fechaactual;

    function Con_tipo_cont_recaudo() {
      parent::Controller();
      $this->load->helper('form');
      $this->load->helper('url');
      $this->load->library('mylib_base');
      $this->load->model('Model_tipo_cont_recaudo','',TRUE);
      $this->load->model('Model_insert_sucursal','',TRUE);
      $this->load->library('form_validation');
      $this->load->model('Model_insert','',TRUE);
      $this->load->model('Model_consulta_contratista','',TRUE);



      }


        function index(){
                
                $this->vismenu = $this->load->view('vis_menu','',TRUE);

                if(!isset($_POST['valorpk']) or $_POST['valorpk']==''){
                    $data['valorpk']  = $this->uri->segment(3);
                }else{
                    $data['valorpk']  = $_POST['valorpk'];
                    }

                if(!isset($_POST['valorid']) or $_POST['valorid']==''){
                    $data['valorid']  =$this->uri->segment(4);
                }else{
                    $data['valorid']  =$_POST['valorid'];
                    }

                //Obtengo los datos de la contratista a evaluar
                $data['query_tipo_cont']        = $this->Model_insert_sucursal->consulta_contratista_value($data['valorpk']);
                $fila                           = $data['query_tipo_cont']->row();
                //Obtengo el tipo de contratista a evaluar
                $this->tipo_co                  = $fila->ctp_contratistas_tipo_fk;
                $data['query']                  = $this->Model_tipo_cont_recaudo->consulta_por_tipo_cont($this->tipo_co);

                //Evaluacion de cantidad de solvencias emitidas en un ano
                $fecha_periodo                  = "%Y ";
                $fecha_actual                   = "%Y-%m-%d";
                $tiempo                         = time();

                $this->periodoactual            = mdate($fecha_periodo, $tiempo);
                $this->fechaactual              = mdate($fecha_actual,$tiempo);

                $data['fila_c']                 = $this->Model_consulta_contratista->consulta_contratista_general($data['valorpk']);
                $data['query_tipo_cont']        = $this->Model_insert_sucursal->consulta_contratista_value($data['valorpk']);
                $fila                           = $data['query_tipo_cont']->row();

               
               // $data['query_tipo_cont']        = $this->Model_insert_sucursal->consulta_contratista_value($data['valorpk']);
               // $fila                           = $data['query_tipo_cont']->row();
//
//                //Consulta de las solvencias emitidas a la contratista en el periodo actual
//                $data['consulta_solvencia']     = $this->Model_tipo_cont_recaudo->consulta_solvencia($data['valorpk'],$this->periodoactual); //consulto solvencia de la contratista segun periodo
//
                //obtengo todas las solvencia de la contratistas de la mas reciente para abajo
                $res_sol = $this->db->query('select * from contratistas_solvencias where con_contratistas_fk = ? order by sol_fecha_emision desc',$data['valorpk']);

                if($res_sol->num_rows() > 0){
                    //Tiene solvencias emitidas
                    $arr_sol = $res_sol->result_array();
                    $fecha_mas_reciente = $arr_sol[0]['sol_fecha_emision'];
                    $periodo_mas_reciente = $arr_sol[0]['sol_periodo'];
                    $res_per_mas_reciente = $this->db->query("select * from contratistas_solvencias where con_contratistas_fk = ? and sol_periodo = '$periodo_mas_reciente' order by sol_fecha_emision desc",$data['valorpk']);
                    if($res_per_mas_reciente->num_rows() < 3){

                          //   echo 'Generar solvencia con $periodo_mas_reciente';
                         //validar que si tiene una solvencia y no se ah vencido
                                 $solvencia_venc = $this->db->query("select * from contratistas_solvencias where con_contratistas_fk =  ".$data['valorpk']." and sol_fecha_vencimiento >= '".$this->fechaactual."'");

                                 if($solvencia_venc->num_rows() > 0){
                                   redirect('/con_reportes/rep_solvencia/'.$data['valorpk']);
                                  }else{
                                      $this->load->view('seguimiento/vis_tipo_cont_recaudo',$data); 
                                  }

                        
                    }else{
                       foreach($arr_sol as $farr_sol){
                           if(isset($farr_sol['sol_fecha_emision']))
                             $fecha_mas_vieja   =  $farr_sol['sol_fecha_emision'];
                           $periodo_mas_viejo = $farr_sol['sol_periodo'];
                       }
                      //  echo $fecha_mas_vieja;
                       $fmv_dia_mes = mdate('%d-%m',strtotime($fecha_mas_vieja));
                       $fa_dia_mes = mdate('%d-%m',now());
                       if($fmv_dia_mes >= $fa_dia_mes){


                         $this->load->view('seguimiento/vis_error',$data);
                     

                       }else{
                           //$this->periodoactual
                           echo 'Generar Sol con Periodo Actual';
                    // $this->load->view('seguimiento/vis_tipo_cont_recaudo',$data);
                       }
                    }
                }else{
                    $this->load->view('seguimiento/vis_tipo_cont_recaudo',$data);
                   // echo 'Generar primera solvencia';
                }


//                //Obtengo los datos de la contratista a evaluar
//                //$data['fila_c']                 = $this->Model_consulta_contratista->consulta_contratista_general($data['valorpk']);
//                $data['query_tipo_cont']        = $this->Model_insert_sucursal->consulta_contratista_value($data['valorpk']);
//                $fila                           = $data['query_tipo_cont']->row();
//
//                //Consulta de las solvencias emitidas a la contratista en el periodo actual
//                $data['consulta_solvencia']     = $this->Model_tipo_cont_recaudo->consulta_solvencia($data['valorpk'],$this->periodoactual); //consulto solvencia de la contratista segun periodo
//
//                //print_r($data['consulta_solvencia'] );
//                $emisionmenor = $this->db->query('select * from contratistas_solvencias where con_contratistas_fk = '.$data['valorpk']);
//                $a = array();
//                foreach ($emisionmenor ->result() as $row){
//                  $a[$row->sol_contratistas_solvencias_pk] = $row->sol_fecha_emision;
//                }
//                $count =  count($a);
//                if ($count <= 0){
//                  //  return false;
//                }else{
//                  $this->Vmin = min($a); //Obtengo el valor más bajo de la fecha de emision
//                }
//                if($data['consulta_solvencia']->num_rows() < 3 and strtotime($this->fechaactual,0) > strtotime(date('Y-m-d',strtotime($this->Vmin." + 1 year")),0)){//and $this->fechaactual < date('Y-m-d',$this->Vmin)){
//                  $this->load->view('seguimiento/vis_tipo_cont_recaudo',$data);
//                }else{
//                         }
                //$this->load->view('seguimiento/vis_tipo_cont_recaudo',$data);

                // redirect('con_reg_2/index/'.$data['valorpk']);

                //redirect('con_reg_2/index/'.$data['valorpk']);

}

    function grabar(){
                
                $this->vismenu = $this->load->view('vis_menu','',TRUE);

                if(!isset($_POST['valorpk']) or $_POST['valorpk']==''){
                  $data['valorpk']  =$this->uri->segment(3);
                }else{
                  $data['valorpk']  =$_POST['valorpk'];
                }

                $data['query_tipo_cont']        = $this->Model_insert_sucursal->consulta_contratista_value($data['valorpk']);
                $fila                           = $data['query_tipo_cont']->row();
                //Obtengo el tipo de contratista a evaluar
                $this->tipo_co                  = $fila->ctp_contratistas_tipo_fk;
                $this->fecha_emi = $_POST['fecha_emi'];

                  $this->eliminar($data);  ///si van
                  $this->incluir($data);

               
    }


   function eliminar($data){

      $result = $this->Model_tipo_cont_recaudo->eliminar('contratista_evaluacion',$data['valorpk'],$this->fecha_emi);
    }



    function incluir($data){

      $result = $this->Model_tipo_cont_recaudo->insertar('contratista_evaluacion',$this->tipo_co);
      redirect('con_result_solvencia/index/'.$data['valorpk']);
    }

 



}
?>
