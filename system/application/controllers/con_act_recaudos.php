<?php

class Con_reg_3 extends Controller
{
     var $vismenu;
     
     function Con_reg_3() {

             parent::Controller();
             $this->load->database();
             $this->load->model('Model_areas_objeto','',TRUE);
             $this->load->library('pagination');
       
             $this->load->helper(array('form', 'url'));
             $this->load->library('form_validation');
             $this->load->scaffolding('especialidad_objeto');
        
     }

function index(){ //formulario 3

                $this->vismenu = $this->load->view('vis_menu','',TRUE);
                $para                                              =$this->uri->segment(3);
                $data['valorpk']                                   =$para;
                $this->Model_areas_objeto->pkcontratista           =$this->uri->segment(3);;
                $this->load->view('Registro/regcontratista_3', $data);

}

function ingreso_areas_contratista(){

                $this->vismenu = $this->load->view('vis_menu','',TRUE);
                $data['valorpk']         =$_POST['valorpk'];
                
                $result_eliminar = $this->Model_areas_objeto->eliminar_areas_objeto('esp_are_xcontratista',$data['valorpk']);
                $result = $this->Model_areas_objeto->insertar_areas_objeto('esp_are_xcontratista',$data['valorpk']);
                redirect('con_reg_3/index/'.$data['valorpk']);

}

}
?>
