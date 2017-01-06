<?php
/**
 * Programador: Carlos Ramirez
 * Fecha inicio: 10/10/08
 * Fecha final: 11/04/09
 * Controlador de Registro de Datos areas y especialidades de la Contratista
 */
class Con_reg_3 extends Controller
{
     var $vismenu;
     
     function Con_reg_3() {

             parent::Controller();
             $this->load->database();
             $this->load->model('Model_areas_objeto','',TRUE);
             $this->load->model('Model_insert_sucursal','',TRUE);
             $this->load->library('pagination');
       
             $this->load->helper(array('form', 'url'));
             $this->load->library('form_validation');
             $this->load->scaffolding('especialidad_objeto');
             $this->load->model('Model_consulta_contratista','',TRUE);



        
     }

function index(){ //formulario 3

             
                $this->vismenu = $this->load->view('vis_menu','',TRUE);
                $para                                              =$this->uri->segment(3);
                $data['valorpk']                                   =$para;
                $this->Model_areas_objeto->pkcontratista           =$this->uri->segment(3);
                $data['general']                                   = $this->Model_insert_sucursal->consulta_contratista($data['valorpk']);
                $data['fila'] = $this->Model_consulta_contratista->consulta_contratista_general($data['valorpk']);
                $data['modo']                                         =$this->uri->segment(5);
                
                $this->load->view('Registro/regcontratista_3', $data);

}



function ingreso_areas_contratista(){


                $this->vismenu = $this->load->view('vis_menu','',TRUE);
                $data['valorpk']             =$_POST['valorpk'];
                $data['fila'] = $this->Model_consulta_contratista->consulta_contratista_general($data['valorpk']);
                $data['general']             = $this->Model_insert_sucursal->consulta_contratista($data['valorpk']);
                $data['modo']                =$_POST['modo'];

                $result_eliminar = $this->Model_areas_objeto->eliminar_areas_objeto('esp_are_xcontratista',$data['valorpk']);
                $result = $this->Model_areas_objeto->insertar_areas_objeto('esp_are_xcontratista',$data['valorpk']);
             
                 if ($data['modo'] == 'new'){

                        redirect('con_reg_4/reg_form/'.$data['valorpk'].'/0/new');
                 }else{

                         redirect('con_consult_regco');
                      }


}







}
?>
