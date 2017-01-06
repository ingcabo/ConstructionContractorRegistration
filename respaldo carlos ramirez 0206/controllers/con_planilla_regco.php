<?php
class Con_planilla_regco extends Controller
{
     function Con_planilla_regco() {

             parent::Controller();
             $this->load->database();
             $this->load->model('Model_consulta_contratista','',TRUE);
             $this->load->helper(array('form', 'url'));

     }

function index() //formulario 3
{


                $para                                              =$this->uri->segment(3);
                $data['valorpk']                                   =$para;
                $this->Model_areas_objeto->pkcontratista           =$this->uri->segment(3);



                 $data['fila'] = $this->Model_consulta_contratista->consulta_contratista_general($data['valorpk']);
                 $data['query_persona_legal']= $this->Model_consulta_contratista->consulta_persona_legal($data['valorpk']);
                 $data['query_comisario']= $this->Model_consulta_contratista->consulta_persona_comisario($data['valorpk']);
                 $data['fila_lg'] = $this->Model_consulta_contratista->consulta_contratista_legal($data['valorpk']);
                 $data['query_contratista_areas']= $this->Model_consulta_contratista->consulta_area_empresa($data['valorpk']);
                 $this->load->view('consultas/consult_contratista',$data);


}



}
?>
