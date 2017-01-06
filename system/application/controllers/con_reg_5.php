<?php
/**
 * Programador: Carlos Ramirez
 * Fecha inicio: 10/10/08
 * Fecha final: 11/04/09
 * Controlador de Registro de Sucursales de la Contratista
 */
class Con_reg_5 extends Controller
{
var $vismenu;


function Con_reg_5() {

             parent::Controller();
             $this->load->database();
             $this->load->model('Model_insert_sucursal','',TRUE);
             $this->load->model('Model_insert','',TRUE);
             $this->load->helper(array('form', 'url'));
             $this->load->library('form_validation');
             $this->load->helper('array');
             $this->load->library('mylib_base');
            


     }


function index(){


                    $this->vismenu = $this->load->view('vis_menu','',TRUE);

                  if(!isset($_POST['valorpk']) or $_POST['valorpk']==''){
                   $data['valorpk']  =$this->uri->segment(3);}else{
                   $data['valorpk']  =$_POST['valorpk'];}

                  $data['general']             = $this->Model_insert_sucursal->consulta_contratista($data['valorpk']);


                   if(!isset($_POST['valorid'])){
                   $data['valorid']  ='0';}else{
                   $data['valorid']  =$_POST['valorid'];}
               
                   if(!isset($_POST['modo'])){
                    $data['modo']       =$this->uri->segment(5);}
                    else{$data['modo']  =$_POST['modo'];}
               
                   $data['sucu']         = '';
                   $data['dir']          = '';
                 
   
                   $data['query_telef']         = $this->Model_insert->numeros_telefonicos_tipo(); //los tipòs de telefono
                   $data['query_detalle']       = $this->Model_insert_sucursal->consulta_sucursales_telefonos($data['valorpk']); // la vista general de las sucursales y telefonos
                   $data['query_telefonos_id']  = $this->Model_insert_sucursal->consulta_sucursales_telefonos_id($data['valorid']);
                 
                   $this->load->view('Registro/regcontratista_5',$data);
                   $this->Model_insert_sucursal->consulta_sucursales_telefonos($data['valorpk']);
}



function grabar(){


                   $this->vismenu = $this->load->view('vis_menu','',TRUE);

                  if(!isset($_POST['valorpk']) or $_POST['valorpk']==''){
                   $data['valorpk']  =$this->uri->segment(3);}else{
                   $data['valorpk']  =$_POST['valorpk'];}

                   if(!isset($_POST['valorid'])){
                   $data['valorid']  =$this->uri->segment(4);}else{
                   $data['valorid']  =$_POST['valorid'];}

                   if(!isset($_POST['modo'])){
                    $data['modo']       =$this->uri->segment(5);}
                    else{$data['modo']  =$_POST['modo'];}
                                                                     
                   $data['general']                          = $this->Model_insert_sucursal->consulta_contratista($data['valorpk']);
                   $data['query_telef']                      = $this->Model_insert->numeros_telefonicos_tipo();
                   $data['query_detalle']                    = $this->Model_insert_sucursal->consulta_sucursales_telefonos($data['valorpk']);
                   $data['query_telefonos_id']               = $this->Model_insert_sucursal->consulta_sucursales_telefonos_id($data['valorid']);
                   $data['consulta_sucursales_contratistas'] = $this->Model_insert_sucursal->consulta_sucursales_contratistas($data['valorid'],$data['valorpk']);

           //       $data['fila_s'] = $this->Model_consulta_contratista->consulta_contratista_general($data['valorpk']);

             if ($data['query_telefonos_id']->num_rows() > 0  and  $this->uri->segment(4) > 0 ){

                   $fila = $data['query_telefonos_id']->row();
                   $data['sucu']    = $fila->csu_descripcion;
                   $data['dir']     = $fila->csu_direccion;

           
              
               }else{
                       if(isset($_POST['sucu'])){
                        $data['sucu'] =$_POST['sucu'];}else{
                        $data['sucu'] ='';}


                        if(isset($_POST['dir'])){
                        $data['dir'] =$_POST['dir'];}else{
                        $data['dir'] ='';}
                                                           
                    }

               
                  $this->form_validation->set_rules('sucu','Nombre de Sucursal','required');
                  $this->form_validation->set_rules('dir','Dirección','required');

                 
                 foreach ($data['query_telef']->result() as $telf)
                {
                     if ($telf->ntt_obligatorio == 't'){

                          $this -> form_validation -> set_rules('num_'.$telf->ntt_numeros_telefonicos_tipo_pk,'Teléfono','required');

                       }else{

                     }
                }


                
                  if ($this->form_validation->run() == FALSE){

                  $this->load->view('Registro/regcontratista_5',$data);
                  
                  }else{

                      
                      if ($data['consulta_sucursales_contratistas']->num_rows() > 0 ){

                       // print_r($data['consulta_sucursales_contratistas']->num_rows());

                        $this->modificar($data);


                          }else{

                        $this->incluir($data);

                         
                               }




                      
                  }
              
 
}


function incluir($data){

                                  
                   $resultado = $this->Model_insert_sucursal->insertar_sucursal('contratistas_sucursales',$data['valorpk']);
                   $row = $resultado->row_array();
                   $cero = '0';
                   $result2 = $this->Model_insert_sucursal->insertar_numeros_telefonos_sucursales('numeros_telefonicos_sucursales', $row['ins_contratistas_sucursales']);
                   redirect('con_reg_5/index/'.$data['valorpk'].'/'.$cero.'/'.$data['modo']);

                                              
}



function modificar($data){


                   $result = $this->Model_insert_sucursal->modificar_sucursal('contratistas_sucursales',$data['valorid']);
                 //$row = $result->row_array();
                   $cero = '0';
                   $result_2 = $this->Model_insert_sucursal->borrar_telefonos_de_sucursal('numeros_telefonicos_sucursales',$data['valorid']);

                   $result_3 = $this->Model_insert_sucursal->modificar_numeros_telefonos_sucursales('numeros_telefonicos_sucursales', $data['valorid']);
                   redirect('con_reg_5/index/'.$data['valorpk'].'/'.$cero.'/'.$data['modo']);
    
}



function eliminar(){

                   if(!isset($_POST['valorpk']) or $_POST['valorpk']==''){
                   $data['valorpk']  =$this->uri->segment(3);}else{
                   $data['valorpk']  =$_POST['valorpk'];}
           //        $data['fila'] = $this->Model_consulta_contratista->consulta_contratista_general($data['valorpk']);

                   if(!isset($_POST['valorid'])){
                   $data['valorid']  =$this->uri->segment(4);}else{
                   $data['valorid']  =$_POST['valorid'];}

                    if(!isset($_POST['modo'])){
                    $data['modo']       =$this->uri->segment(5);}
                    else{$data['modo']  =$_POST['modo'];}
                    
                      $cero = '0';
                      $result = $this->Model_insert_sucursal->desactivar_sucursal('contratistas_sucursales',$data['valorid']);

                      $result = $this->Model_insert_sucursal->desactivar_telefonos_sucursal('numeros_telefonicos_sucursales',$data['valorid']);

                      redirect('con_reg_5/index/'.$data['valorpk'].'/'.$cero.'/'.$data['modo']);
}






}
?>
