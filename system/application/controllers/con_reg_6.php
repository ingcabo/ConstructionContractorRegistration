<?php
/**
 * Programador: Carlos Ramirez
 * Fecha inicio: 10/10/08
 * Fecha final: 11/04/09
 * Controlador de Registro de Contratos de la Contratista
 */

class Con_reg_6 extends Controller
{
     var $vismenu;
     
     function Con_reg_6() {
         parent::Controller();
         $this->load->database();
         $this->load->model('Model_insert_contrato_contratista','',TRUE);
         $this->load->model('Model_insert');
         $this->load->helper(array('form', 'url'));
         $this->load->library('pagination');
         $this->load->helper(array('form', 'url'));
         $this->load->library('form_validation');
         $this->load->library('mylib_base');
         $this->load->model('Model_consulta_contratista','',TRUE);
     }

    function index(){
      $this->vismenu = $this->load->view('vis_menu','',TRUE);
      //Obtengo valor pk del registro
      if(!isset($_POST['valorpk']) or $_POST['valorpk']==''){
        $data['valorpk']  = $this->uri->segment(3);
      }else{
        $data['valorpk']  = $_POST['valorpk'];
      }
      //Obtengo id del registro
      if(!isset($_POST['valorid'])){
        $data['valorid']  = $this->uri->segment(4);
      }else{
        $data['valorid']  = $_POST['valorid'];
      }
      //Modo de trabajo
      if(!isset($_POST['modo'])){
        $data['modo']  = $this->uri->segment(5);
      }else{
        $data['modo']  = $_POST['modo'];
      }

      $data['query_estatus']            =  $this->Model_insert_contrato_contratista->estatus();
      $data['query_rendimientos']       =  $this->Model_insert_contrato_contratista->consulta_rendimientos();
      $data['query_organismos']         =  $this->Model_insert_contrato_contratista->organismos();
      $data['query_tipo_actividad']     =  $this->Model_insert_contrato_contratista->tipo_actividad();
      $data['query_contratos']          =  $this->Model_insert_contrato_contratista->consulta_contratistas_contratos($data['valorpk']);
      $data['fila']                     =  $this->Model_consulta_contratista->consulta_contratista_general($data['valorpk']);
      $data['tipoact']                  = '';
      $data['orga']                     = '';
      $data['estatus']                  = '';
      $data['fecha']                    = '';
      $data['numero']                   = '';
      $data['select_rendimiento']       = '';
      $data['descrip']                  = '';
      $data['obsv']                     = '';
      $data['select_rendimientos']      = '0';
      $data['select_tipoact']           = '0';
      $data['select_orga']              = '0';
      $data['select_estatus']           = '0';
      //Carga vista
      $this->load->view('Registro/regcontratista_6',$data);

  } //Fin index

 function grabar(){

    $this->vismenu = $this->load->view('vis_menu','',TRUE);
    if(!isset($_POST['valorpk']) or $_POST['valorpk']==''){
      $data['valorpk']  = $this->uri->segment(3);
    }else{
      $data['valorpk']  = $_POST['valorpk'];
    }

    if(!isset($_POST['valorid'])){
      $data['valorid']       =$this->uri->segment(4);
    }else{
      $data['valorid']  =$_POST['valorid'];
    }

    if(!isset($_POST['modo'])){
      $data['modo']       =$this->uri->segment(5);
    }else{
      $data['modo']  =$_POST['modo'];
    }

    $data['query_estatus']                      =  $this->Model_insert_contrato_contratista->estatus();
    $data['query_rendimientos']                 =  $this->Model_insert_contrato_contratista->consulta_rendimientos();
    $data['query_organismos']                   =  $this->Model_insert_contrato_contratista->organismos();
    $data['query_tipo_actividad']               =  $this->Model_insert_contrato_contratista->tipo_actividad();
    $data['query_contratos_de_cada_contratista']=  $this->Model_insert_contrato_contratista->contratos_de_cada_contratista($data['valorpk'],$data['valorid'] );
    $data['fila']                               = $this->Model_consulta_contratista->consulta_contratista_general($data['valorpk']);

    if ($data['query_contratos_de_cada_contratista']->num_rows() > 0 and $this->uri->segment(4) > 0 ){ //
      $fila = $data['query_contratos_de_cada_contratista']->row();
      $data['fecha']                    =$this->mylib_base->pg_to_human($fila->ctt_fecha);
      $data['numero']                   =$fila->ctt_numero;
      //$data['select_rendimiento']     =$fila->ctt_rendimiento;
      $data['descrip']                  =$fila->ctt_descripcion;
      $data['obsv']                     =$fila->ctt_observaciones;
      $data['select_tipoact']           =$fila->tpa_tipo_actividad_fk;
      $data['select_orga']              =$fila->org_organismos_fk;
      $data['select_estatus']           =$fila->ett_estatus_fk;
      $data['select_rendimientos']      =$fila->ren_rendimiento_fk;
    }else{
      if(isset($_POST['tipoact'])){
        $data['tipoact']          =$_POST['tipoact'];
      }else{
        $data['tipoact']          ='';
      }

      if(isset($_POST['orga'])){
        $data['orga']          =$_POST['orga'];
      }else{
        $data['orga']          ='';
      }

      if(isset($_POST['estatus'])){
        $data['estatus']          =$_POST['estatus'];
      }else{
        $data['estatus']          ='';
      }

      if(isset($_POST['fecha'])){
        $data['fecha']          =$_POST['fecha'];
      }else{
        $data['fecha']          ='';
      }

      if(isset($_POST['numero'])){
        $data['numero']          =$_POST['numero'];
      }else{
        $data['numero']          ='';
      }

      if(isset($_POST['rendimiento'])){
        $data['rendimiento']          =$_POST['rendimiento'];
      }else{
        $data['rendimiento']          ='';
      }

      if(isset($_POST['descrip'])){
        $data['descrip']          =$_POST['descrip'];
      }else{
        $data['descrip']          ='';
      }

      if(!isset($_POST['obsv']) or $_POST['obsv']==''){
        $data['obsv']          ='';
      }else{
        $data['obsv']          =$_POST['obsv'];
      }

      $data['select_tipoact']=$_POST['tipoact'];
      $data['select_orga']=$_POST['orga'];
      $data['select_estatus']=$_POST['estatus'];
      $data['select_rendimientos']= $_POST['rendimiento'];
    }

    //$this->form_validation->set_rules('tipoact','Denominacion Comercial','numeric');
    //$this->form_validation->set_rules('orga','Denominacion Comercial','numeric');
    //$this->form_validation->set_rules('estatus','Denominacion Comercial','numeric');
    $this->form_validation->set_rules('numero','Número','required');
    $this->form_validation->set_rules('rendimiento','Rendimiento','required');
    $this->form_validation->set_rules('orga','Organismo','required');
    $this->form_validation->set_rules('tipoact','Tipo Actividad','required');
    $this->form_validation->set_rules('estatus','Estatus','required');

    $data['query_contratos']= $this->Model_insert_contrato_contratista->consulta_contratistas_contratos($data['valorpk']);

    //********************************************************///***************************************************************
    if ($this->form_validation->run() == FALSE){ //valido el formulario
      //  $data['select_rendimientos']= $_POST['select_estatus'];
      $this->load->view('Registro/regcontratista_6',$data);
    }else{
      if ($data['query_contratos_de_cada_contratista']->num_rows() > 0){//modificar registros
        $this->modificar($data);
      }else{
        $this->incluir($data);
      }
    }//********************************************************************//***************************************************

}//fin de funcion grabar


       function incluir ($data){
         $cero= '0';
         $result = $this->Model_insert_contrato_contratista->insertar_contratistas_contratos('contratistas_contratos',$data['valorpk']);
         redirect('con_reg_6/index/'.$data['valorpk'].'/'.$cero.'/'.$data['modo']);
       }

       function modificar ($data){
         $cero= '0';
         $result = $this->Model_insert_contrato_contratista->modificar_contratistas_contratos('contratistas_contratos',$data['valorpk'],$data['valorid']);
         redirect('con_reg_6/index/'.$data['valorpk'].'/'.$cero.'/'.$data['modo']);
       }


      function eliminar(){
        if(!isset($_POST['valorpk']) or $_POST['valorpk']==''){
          $data['valorpk']  = $this->uri->segment(3);
        }else{
          $data['valorpk']  = $_POST['valorpk'];
        }

        if(!isset($_POST['valorid'])){
          $data['valorid']  =$this->uri->segment(4);
        }else{
          $data['valorid']  =$_POST['valorid'];
        }

        $cero= '0';
        $result = $this->Model_insert_contrato_contratista->eliminar_contratos('contratistas_contratos',$data['valorpk'],$data['valorid']);
        redirect('con_reg_6/index/'.$data['valorpk'].'/'.$cero.'/'.$data['modo']);
      }

}
?>
