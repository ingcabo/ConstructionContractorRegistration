<?php
//result_solvencia
class Model_result_solvencia extends Model {

 var $pkcontratista;


	function Model_result_solvencia()
	{
                        parent::Model();
                        $this->load->model('Model_insert','',TRUE);
                        $this->load->database();
                        $this->load->helper('inflector');
                        $this->load->helper('date');

	}











}

?>
