<?php

class Model_tipo_cont_recaudo extends Model {

 var $pkcontratista;


	function Model_tipo_cont_recaudo()
	{
                        parent::Model();
                        $this->load->model('Model_insert','',TRUE);
                        $this->load->database();
                        $this->load->helper('inflector');
                        $this->load->helper('date');
     


	}



    function consulta_por_tipo_cont($idtipo_cont){

                       $this->db->where('ctp_contratistas_tipo_fk',$idtipo_cont);
                       $query = $this->db->get('vis_tipo_cont_tipo_recaudo');
                       return ($query);
    }


  function consulta_solvencia($valorpk,$periodo){

                       $this->db->where('con_contratistas_fk',$valorpk);
                       $this->db->where('sol_periodo',$periodo);
                       $query = $this->db->get('contratistas_solvencias');
                       return ($query);
    }



  function insertar($nom_tabla,$tipo_co) {
                                            /* 1 = *faltante 4 = Aprobado
                                             * 2 = presente  5  = *faltante requerido
                                             * 3 = *vencido  6 = *neutro
                                             */

            $this->db->where('ctp_contratistas_tipo_fk',$tipo_co);
            $query = $this->db->get('vis_tipo_cont_tipo_recaudo');

             foreach ($query->result_array() as $row){

                     if(isset($_POST['chk_'.$row['svr_solvencias_recaudos_fk']])){
                        $data['svr_solvencias_recaudos_fk'] = $_POST['chk_'.$row['svr_solvencias_recaudos_fk']];
                        $data['con_contratistas_fk']        = $_POST['valorpk'];
                        $data['eva_fecha_emision']          = $this->mylib_base->human_to_pg($_POST['factual']);

                                      if(isset($_POST['fcv_'.$row['svr_solvencias_recaudos_fk']])){


                                                 if ($this->mylib_base->human_to_pg($_POST['fcv_'.$row['svr_solvencias_recaudos_fk']]) >=  $this->mylib_base->human_to_pg($_POST['factual'])){

                                                 $data['eva_estatus'] = '2'; //presente
                                                 $data['eva_fecha_vencimiento'] = $this->mylib_base->human_to_pg($_POST['fcv_'.$row['svr_solvencias_recaudos_fk']]);
                                                 $data['eva_codigo_ancla']      = $_POST['valorpk'].$_POST['fact'];

                                                 }else{
                                                 $data['eva_estatus'] = '3'; //vencido
                                                           if( $_POST['fcv_'.$row['svr_solvencias_recaudos_fk']] <> ''){
                                                                $data['eva_fecha_vencimiento'] = $this->mylib_base->human_to_pg($_POST['fcv_'.$row['svr_solvencias_recaudos_fk']]);
                                                           }else{
                                                                $data['eva_fecha_vencimiento'] = NULL;
                                                                }

                                              $data['eva_codigo_ancla']      = $_POST['valorpk'].$_POST['fact'];
                                                       }

                                       }else{

                                              $data['eva_estatus'] = '2'; //faltante
                                              $data['eva_fecha_vencimiento'] = NULL;
                                              $data['eva_codigo_ancla']      = $_POST['valorpk'].$_POST['fact'];

                                             }
                }else{

                         if ($row['srt_obligatorio']== 't'){


                          $data['svr_solvencias_recaudos_fk'] = $row['svr_solvencias_recaudos_fk'];
                          $data['con_contratistas_fk'] = $_POST['valorpk'];
                          $data['eva_fecha_emision']   = $this->mylib_base->human_to_pg($_POST['factual']);
                          $data['eva_estatus'] = '5'; //faltante requerido
                          $data['eva_fecha_vencimiento'] = NULL;
                          $data['eva_codigo_ancla']      = $_POST['valorpk'].$_POST['fact'];

                         }else{

                          $data['svr_solvencias_recaudos_fk'] = $row['svr_solvencias_recaudos_fk'];
                          $data['con_contratistas_fk'] = $_POST['valorpk'];
                          $data['eva_fecha_emision']   = $this->mylib_base->human_to_pg($_POST['factual']);
                          $data['eva_estatus'] = '1'; //NEUTRO
                          $data['eva_fecha_vencimiento'] = NULL;
                          $data['eva_codigo_ancla']      = $_POST['valorpk'].$_POST['fact'];

                              }

                     }

                           $consulta = "select * from ins_$nom_tabla (".$this->Model_insert->CreaParametros($nom_tabla,$data).")";
                           // echo "-->";

                          //print_r($consulta)."<br>"; //lo imprime varias veces normal sin problemas
                           // echo "<br>";
                         $this->db->query($consulta); // lo ejecuta solo una vez "




           }


 

    }// fin de la funcion insertar.


function eliminar($nom_tabla,$valorpk,$fecha){

             $data['con_contratistas_fk'] = $valorpk;
             $data['eva_fecha_emision']   = $fecha;

         $consulta = "select * from del_$nom_tabla (".$this->Model_insert->CreaParametros($nom_tabla,$data).")";
         // print_r($consulta);
            $this->db->query($consulta);

    
}


function inserta_solvencia($nom_tabla,$valorpk,$fechaemi,$fechavenc){

//contratistas_solvencias
                 $data['con_contratistas_fk']    = $valorpk;
                 $data['sol_fecha_emision']      = $fechaemi;
                 $data['sol_fecha_vencimiento']  = $fechavenc;
                 $data['sol_periodo']            =$_POST['periodo'];
                 $data['sol_activo']             ='true';

         
         $consulta = "select * from ins_$nom_tabla (".$this->Model_insert->CreaParametros($nom_tabla,$data).")";
         // print_r($consulta);
          $this->db->query($consulta);
    
}




}
?>
