<?php

class Con_result_solvencia extends Controller
{

    var $vismenu;
    var $fecha_emi;
    var $Vmin;
    var $fechaactual;

    function Con_result_solvencia() {
      parent::Controller();
      $this->load->helper('form');
      $this->load->helper('url');
      $this->load->library('mylib_base');
      $this->load->library('xajax');
      $this->load->library('form_validation');
      $this->load->model('Model_insert','',TRUE);
      $this->load->model('Model_tipo_cont_recaudo','',TRUE);
      $this->load->model('Model_consulta_contratista','',TRUE);
      $this->xajax->registerFunction(array('alerta',&$this,'alerta'));


      }



function index(){

                   $data['xajax_js'] = $this->xajax->getJavascript(base_url());
                   if(!isset($_POST['valorpk']) or $_POST['valorpk']==''){
                   $data['valorpk']  = $this->uri->segment(3);}else{
                   $data['valorpk']  = $_POST['valorpk'];}
               
               
                   if(!isset($_POST['factual']) or $_POST['factual']==''){
                   $data['emision']  = '';}else{
                   $data['emision']  = $_POST['factual'];}
                   $data['fila_c']                 = $this->Model_consulta_contratista->consulta_contratista_general($data['valorpk']);
          

                  $data['query_recaudo_transito_pass']   = $this->Model_insert->consulta_recaudo_transito_pass($data['valorpk']);
                  
                  $data['consulta_recaudo_transito']     = $this->Model_insert->consulta_recaudo_transito($data['valorpk']);
                  $fila = $data['consulta_recaudo_transito']->row();
                  $data['emision'] = $fila->eva_fecha_emision;
                  $this->fecha_emi = $fila->eva_fecha_emision;
                  $this->vismenu   = $this->load->view('vis_menu','',TRUE);


                $a = array();
                $data['consulta_recaudo_emision']   = $this->Model_insert->consulta_recaudo_emision($data['valorpk'],$this->fecha_emi);
               if ($data['consulta_recaudo_emision']->num_rows() < 0 ){
                   //nada
			    }else{
                        $consulta_para = $this->db->query('select * from vis_recaudos_transito where con_contratistas_fk = '.$data['valorpk']);
			            foreach ($consulta_para->result() as $row_2){
						if($row_2->eva_fecha_vencimiento <= 0 ){
						$a[$row_2->svr_solvencias_recaudos_fk] = '2020-12-01';
						}else{
						$a[$row_2->svr_solvencias_recaudos_fk] = $row_2->eva_fecha_vencimiento;
						      }
                                                                     }
                         $count =  count($a);

                        if ($count <= 0){

                                     return false;

                        }else{

                                     $this->Vmin = min($a); //Obtengo el valor más bajo
                              }
                }
                $data['dFecMenor'] =  $this->mylib_base->pg_to_human($this->Vmin);
                


             
                 $this->load->view('seguimiento/vis_result_solvencia',$data);
}


function solvencia(){
         
          $data['xajax_js'] = $this->xajax->getJavascript(base_url());
          $this->vismenu = $this->load->view('vis_menu','',TRUE);

          if(!isset($_POST['valorpk']) or $_POST['valorpk']==''){
          $data['valorpk']  = $this->uri->segment(3);}else{
          $data['valorpk']  = $_POST['valorpk'];}


          if(!isset($_POST['dFecMenor']) or $_POST['dFecMenor']==''){
          $data['fechavence']  = '';}else{
          $data['fechavence']  = $_POST['dFecMenor'];}

          if(!isset($_POST['factual']) or $_POST['factual']==''){
          $data['emision']  = '';}else{
          $data['emision']  = $_POST['factual'];}
          $data['fila_c']                 = $this->Model_consulta_contratista->consulta_contratista_general($data['valorpk']);

          $fecha_actual                   = "%Y-%m-%d";
          $tiempo                         = time();
          $this->fechaactual              = mdate($fecha_actual,$tiempo);


      

         $data['query_recaudo_transito_pass']        = $this->Model_insert->consulta_recaudo_transito_pass($data['valorpk']);


                $this -> form_validation -> set_rules('dFecMenor','Fecha vencimiento','required');

                 if ($this->form_validation->run() == FALSE){


                  $this->load->view('seguimiento/vis_result_solvencia',$data);//hasta aqui vamos bien

                 }else{//inicio de que paso el form_validation



                             if ($data['query_recaudo_transito_pass']->num_rows() > 0 ){



                            redirect('con_tipo_cont_recaudo/index/'.$data['valorpk']);


                            }else{//cuando ya voy e emitir la solvecia
                       
                                $solvencia_venc = $this->db->query("select * from contratistas_solvencias where con_contratistas_fk =  ".$data['valorpk']." and sol_fecha_vencimiento >= '".$this->fechaactual."'");

                                 if($solvencia_venc->num_rows() > 0){
                                   redirect('/con_reportes/rep_solvencia/'.$data['valorpk']);
                                  }else{
                                     $this->aprobar_recaudos($data);
                                     $this->insertar_solvencia($data);
                                     $this->actualizar_contratista($data);

                                  }


                            
                            }


            

                 }//fin de que pasa el form_validation



}



function aprobar_recaudos($data){

 $cambiar_estatus = $this->Model_insert->cambiar_estatus_recaudo('contratista_evaluacion',$data['valorpk'],$data['emision']);

 
}



function insertar_solvencia($data){

 $cambiar_estatus = $this->Model_tipo_cont_recaudo->inserta_solvencia('contratistas_solvencias',$data['valorpk'],$data['emision'],$data['fechavence']);
 //redirect('con_reportes/rep_solvencia/'.$data['valorpk']);

}

function actualizar_contratista($data){
//cambiar_estatus_contratista($valorpk,$vstatus,$nom_tabla)
 $cambiar_estatus_contratistas = $this->Model_insert->cambiar_estatus_contratista($data['valorpk'],'4','contratistas');
 redirect('con_reportes/rep_solvencia/'.$data['valorpk']);

    
}

 function alerta($fecha){

        $respuesta = new xajaxResponse(); //Creamos el objeto xajax
		$inputDestino = "buton2"; //indicamos el ID del tag HTML de destino. en este caso el DIV que contiene el selector
		$propiedadInputDestino = "innerHTML"; //indicamos la propiedad que deseamos que se modifique. Colocaremos el selector dentro del DIV
		$valorAAsignar = ""; //indicamos el nuevo valor que este tendrá. Cadena HTML


             if ( $fecha <> ""){

                     $valorAAsignar = 'La Solvencia No debe ser mayor a un año';

               }else{

                    $valorAAsignar ='<input type="submit" value="Generar Certificado de Solvencia" class="botontemp" />';
               }

            //  $valorAAsignar ='<input type="submit" value="Generar Certificado de Solvencia" class="botontemp" />';

                 $respuesta->Assign($inputDestino, $propiedadInputDestino, $valorAAsignar);
                 return $respuesta;
        }






}
?>
