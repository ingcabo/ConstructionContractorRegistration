<?php

class Con_consult extends Controller
{
     function Con_consult() {

             parent::Controller();
             $this->load->database();
             $this->load->model('Mfrmclass','',TRUE);

             $this->load->library('pagination');
             $this->load->library('xajax');
             $this->load->helper(array('form', 'url'));
             $this->load->library('form_validation');


              //declarar en el controller las fuinciones xajas a llamara en el view
              // $this->xajax->registerFunction(array('obtieneMunicipio',&$this,'obtieneMunicipio'));
             //$this->xajax->registerFunction(array('obtieneCiudad',&$this,'obtieneCiudad'));
             //  $this->xajax->processRequest();


     }





function index() //formulario 3


{


         $this->load->view('Consultas/consult_1');


}
}
?>
