<?php
/**
 * Programador: Carlos Ramirez
 * Fecha inicio: 10/10/08
 * Fecha final: 11/04/09
 * Controlador de Registro de Datos Legales de la Contratista
 */


class Con_reg_2 extends Controller
{
     var $vismenu;

    function Con_reg_2() {
             parent::Controller();
             $this->load->database();
             $this->load->model('Model_insert_legal','',TRUE);
             $this->load->model('Model_insert','',TRUE);
             $this->load->library('pagination');
             $this->load->library('xajax');
             $this->load->helper(array('form', 'url'));
             $this->load->library('form_validation');
             $this->load->library('mylib_base');
             $this->load->model('Model_consulta_contratista','',TRUE);

    }
    
    function index(){//formulario 2
               
                 $this->vismenu = $this->load->view('vis_menu','',TRUE);
                 $para                                       = $this->uri->segment(3);
                 $this->Model_insert_legal->pkcontratista    = $this->uri->segment(3);



                if(!isset($_POST['valorpk']) or $_POST['valorpk']==''){
                $data['valorpk']  = $this->uri->segment(3);}else{
                $data['valorpk']  = $_POST['valorpk'];}

                if(!isset($_POST['valorid'])){
                $data['valorid']  =$this->uri->segment(4);}else{
                $data['valorid']  =$_POST['valorid'];}

                if(!isset($_POST['modo'])){
                $data['modo']  =$this->uri->segment(5);}else{
                $data['modo']  =$_POST['modo'];}
                 
                

                 $data['consulta_contratista_legal']= $this->Model_insert_legal->consulta_contratista_legal($data['valorpk']);
                 $data['query_denominacion']=  $this->Model_insert_legal->consulta_denominacion();
                 $data['fila'] = $this->Model_consulta_contratista->consulta_contratista_general($data['valorpk']);
                 $data['c_r']= $this->Model_insert_legal->consulta_registro_principal($data['valorpk']);
                
                if ($data['c_r']->num_rows() > 0 ){
                    $fila_r = $data['c_r']->row();
                    //print_r($data['c_r']);

                    $data['idcrjud']          =$fila_r->clg_circunscripcion_judicial;
                    $data['nummregm']         =$fila_r->clg_numero_registro;
                    $data['fchconsti']        =$this->mylib_base->pg_to_human($fila_r->clg_fecha_constitutiva);
                    $data['objsc']            =$fila_r->clg_objeto_social;
                    $data['var3']             ='readonly="readonly"';
                    $data['campo']            ='perdio';
                }else{

                    $data['idcrjud']          ='';
                    $data['nummregm']         ='';
                    $data['fchconsti']        ='';
                    $data['var3']             ='';
                    $data['campo']            ='fchconsti';
                }
                 


                 $data['select_iddenomi']  ='0';
                 $data['iddenomi']         ='';
                 $data['finscrmer']        ='';
                 $data['numinsr']          ='';
                 $data['tomo']             ='';
                 $data['folio']            ='';
                 $data['ciefisc']          ='';
                // $data['capsocsuc']        ='0.00';
                // $data['capsocpg']         ='0.00';
                 $data['nmodif']           ='';
                // $data['objsc']            ='';
                 $data['dirleg']           ='';
                 $data['modif']            ='';
                 $data['obs']            ='';
             


                  $this->load->view('Registro/regcontratista_2',$data);
    }

    
  function grabar(){

                $this->vismenu = $this->load->view('vis_menu','',TRUE);

                if(!isset($_POST['valorpk']) or $_POST['valorpk']==''){
                $data['valorpk']  = $this->uri->segment(3);}else{
                $data['valorpk']  = $_POST['valorpk'];}

                if(!isset($_POST['valorid'])){
                $data['valorid']       =$this->uri->segment(4);}
                else{$data['valorid']  =$_POST['valorid'];}
                       
                if(!isset($_POST['modo'])){
                $data['modo']       =$this->uri->segment(5);}
                else{$data['modo']  =$_POST['modo'];}
                
                
                $data['var3']             ='readonly="readonly"';
                $data['campo']            ='perdio';



               

                $data['consulta_contratista_legal']       =  $this->Model_insert_legal->consulta_contratista_legal($data['valorpk']);
                $data['query_denominacion']               =  $this->Model_insert_legal->consulta_denominacion();
                $data['consulta_contratista_legal_id']    =  $this->Model_insert_legal->consulta_contratista_legal_id($data['valorpk'],$data['valorid']);
                $data['fila'] = $this->Model_consulta_contratista->consulta_contratista_general($data['valorpk']);

                if ($data['consulta_contratista_legal']->num_rows() > 0 and $this->uri->segment(4) >0){


                 $fila = $data['consulta_contratista_legal_id']->row();
                 $data['nummregm']         =$fila->clg_numero_registro;
                 $data['select_iddenomi']  =$fila->dec_denominacion_comercial_fk;
                 $data['idcrjud']          =$fila->clg_circunscripcion_judicial;
                 $data['iddenomi']         =$fila->dec_denominacion_comercial_fk;
                 $data['finscrmer']        =$this->mylib_base->pg_to_human($fila->clg_fecha_inscripcion);
                 $data['numinsr']          =$fila->clg_numero_inscripcion;
                 $data['tomo']             =$fila->clg_numero_tomo;
                 $data['folio']            =$fila->clg_numero_folio;
                 $data['fchconsti']        =$this->mylib_base->pg_to_human($fila->clg_fecha_constitutiva);
                 $data['ciefisc']          =$this->mylib_base->pg_to_human($fila->clg_cierre_fiscal_actual);
                 $data['capsocsuc']        =$fila->clg_capital_social_suscrito;
                 $data['capsocpg']         =$fila->clg_capital_social_pagado;
                 $data['nmodif']           =$fila->clg_numero_modificaciones;  //numero de modificacion
                 $data['objsc']            =$fila->clg_objeto_social;
                 $data['dirleg']           =$fila->clg_domicilio_legal_actual;
                 $data['modif']            =$fila->clg_modificacion; //modificado si o no
                 $data['obs']              =$fila->clg_observaciones;
                 
                 }else{

               if(isset($_POST['nummregm'])){
               $data['nummregm']=$_POST['nummregm'];}
               else{$data['nummregm']='';}
                                
               $data['select_iddenomi']  =$_POST['iddenomi'];
                

               if(isset($_POST['iddenomi'])){
               $data['iddenomi']=$_POST['iddenomi'];}
               else{$data['iddenomi']='';}

               if(isset($_POST['idcrjud'])){
               $data['idcrjud']=$_POST['idcrjud'];}else{
               $data['idcrjud']='';}

               if(isset($_POST['finscrmer'])){
               $data['finscrmer']=$_POST['finscrmer'];}else{
               $data['finscrmer']='';}

               if(isset($_POST['numinsr'])){
               $data['numinsr']=$_POST['numinsr'];}else{
               $data['numinsr']='';}

               if(isset($_POST['tomo'])){
               $data['tomo']=$_POST['tomo'];}else{
               $data['tomo']='';}

               if(isset($_POST['folio'])){
               $data['folio']=$_POST['tomo'];}else{
               $data['folio']='';}

               if(isset($_POST['fchconsti'])){
               $data['fchconsti']=$_POST['fchconsti'];}else{
               $data['fchconsti']='';}

               if(isset($_POST['ciefisc'])){
               $data['ciefisc']=$_POST['ciefisc'];}else{
               $data['ciefisc']='';}

               if(isset($_POST['capsocsuc'])){
               $data['capsocsuc']=$_POST['capsocsuc'];}else{
               $data['capsocsuc']='';}

               if(isset($_POST['capsocpg'])){
               $data['capsocpg']=$_POST['capsocpg'];}else{
               $data['capsocpg']='';}

               if(isset($_POST['nmodif'])){
               $data['nmodif']=$_POST['nmodif'];}else{
               $data['nmodif']='';}

               if(isset($_POST['objsc'])){
               $data['objsc']=$_POST['objsc'];}else{
               $data['objsc']='';}

               if(isset($_POST['dirleg'])){
               $data['dirleg']=$_POST['dirleg'];}else{
               $data['dirleg']='';}

               if(isset($_POST['modif'])){
               $data['modif']=$_POST['modif'];}else{
               $data['modif']='';}

               if(isset($_POST['obs'])){
               $data['obs']=$_POST['obs'];}else{
               $data['obs']='';}

               if(!isset($_POST['modo'])){
               $data['modo']       =$this->uri->segment(5);}
               else{$data['modo']  =$_POST['modo'];}

               $data['var3']  = $_POST['var3'];
               $data['campo'] = $_POST['campo'];

            

                }

                $this->form_validation->set_rules('nummregm','Número Reg. Mercantil','required');
                $this->form_validation->set_rules('finscrmer','Fecha de Inscripción del Registro Mercantil','required');
                $this->form_validation->set_rules('numinsr','Número de Inscripción del Registro Mercantil','required');
                $this->form_validation->set_rules('fchconsti','Fecha de Constitución','required');
                $this->form_validation->set_rules('numinsr','Número de Inscripción','required');
                $this->form_validation->set_rules('tomo','Número de Tomo','required');
                $this->form_validation->set_rules('capsocsuc','Capital Social Suscrito','required');
                $this->form_validation->set_rules('capsocpg','Capital Social Pagado','required');
                $this->form_validation->set_rules('dirleg','Domicilio Legal','required');
                $this->form_validation->set_rules('iddenomi','Denominación Comercial','required');
                $this->form_validation->set_rules('objsc','Objeto Social','required');
                $this->form_validation->set_rules('radio', '', '');
                

                

                if ($this->form_validation->run() == FALSE){

                       $this->load->view('Registro/regcontratista_2',$data);
                       }
                        else{

                              if ($data['consulta_contratista_legal_id']->num_rows() > 0){
                                      
                                      $this->modificar($data);
                              }else{

                                      $this->incluir($data);

                                   }
                        }


                  }//fin de funcion grabar


    function incluir($data){
        $cero= '0';
        $result = $this->Model_insert_legal->insertar_contratista_legal('contratistas_legal',$data['valorpk']);
        redirect('con_reg_2/index/'.$data['valorpk'].'/'.$cero.'/'.$data['modo']);

    }


    function modificar($data){
         $cero= '0';
         $result = $this->Model_insert_legal->modificar_documento_legal($data['valorid'],$data['valorpk']);
         redirect('con_reg_2/index/'.$data['valorpk'].'/'.$cero.'/'.$data['modo']);
        
    }

      function eliminar(){

                $this->vismenu = $this->load->view('vis_menu','',TRUE);
                
                if(!isset($_POST['valorpk']) or $_POST['valorpk']==''){
                $data['valorpk']  = $this->uri->segment(3);}else{
                $data['valorpk']  = $_POST['valorpk'];}

                if(!isset($_POST['valorid']))
                {$data['valorid']  =$this->uri->segment(4);}
                else{$data['valorid']  =$_POST['valorid'];}

                if(!isset($_POST['modo'])){
                $data['modo']       =$this->uri->segment(5);}
                else{$data['modo']  =$_POST['modo'];}

                $cero= '0';
                $result = $this->Model_insert_legal->borrar_legal('contratistas_legal',$data['valorpk'],$data['valorid']);
                redirect('con_reg_2/index/'.$data['valorpk'].'/'.$cero.'/'.$data['modo']);

    }

           



}
?>
