<?php
class Con_solvencia_tipo extends Controller
{
     function Con_solvencia_tipo() {

             parent::Controller();
             $this->load->database();

            
             $this->load->model('Model_insert','',TRUE);
             $this->load->helper(array('form', 'url'));




    }


    function index()

    {

 $this->load->view('Registro/regcontratista_7');
        
    }




}
?>
