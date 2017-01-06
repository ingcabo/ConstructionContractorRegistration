<?php

/**
 * Programador: Carlos Ramirez
 * Fecha inicio: 10/10/08
 * Fecha final: 11/04/09
 * Controlador de Registro de Personas de la Contratista
 */
class Con_reg_4 extends Controller
{

var $valorpk;
var $valorid;
var $vismenu;

     function Con_reg_4() {

             parent::Controller();
             $this->load->database();
             $this->load->model('Model_insert_personas','',TRUE);
             $this->load->model('Model_consulta_contratista','',TRUE);
             $this->load->model('Model_insert','',TRUE);            
             $this->load->library('xajax');
             $this->load->helper(array('form', 'url'));
             $this->load->library('form_validation');
       //    $this->load->helper('form');
             $this->load->library('mylib_base');   
             $this->xajax->registerFunction(array('alertacedula',&$this,'alertacedula'));
             $this->xajax->processRequest();
             




     }


  function reg_form()

  {
                $this->vismenu = $this->load->view('vis_menu','',TRUE);
                $data['xajax_js'] = $this->xajax->getJavascript(base_url());

                if(!isset($_POST['valorpk']) or $_POST['valorpk']==''){
                $data['valorpk']  = $this->uri->segment(3);}else{
                $data['valorpk']  = $_POST['valorpk'];}

                if(!isset($_POST['valorid']) or $_POST['valorid']==''){
                $data['valorid']  =$this->uri->segment(4);}else{
                $data['valorid']  =$_POST['valorid'];}

                if(!isset($_POST['modo']) or $_POST['modo'] <= '0'){
                $data['modo']       =$this->uri->segment(5);}
                else{$data['modo']  =$_POST['modo'];}
              
              
               $data['nomb']           ='';
               $data['apdo']           = '';
               $data['ced']            = '';
               $data['nrif']           = '';
               $data['email']          = '';
               $data['profesion']      = '';
               $data['numcole']        = '';
               $data['vigen']          = '';
               $data['cargac']         = '';
               $data['comisario']      = 'false';
               $data['acc']            = 'false';
               $data['rp']             = 'false';
               $data['JDir']           = 'false';
               $data['chk_comisario']  = '';
               $data['bk_cedula']      ='';
               $data['checked']        = '';
               $data['dis']            ='';
               $data['dis_comisario']  ='';
               $data['porc']           = '';
               
               $data['query']= $this->Model_consulta_contratista->personas_contratistas($data['valorpk']);  
               $data['query_comisario']= $this->Model_consulta_contratista->consulta_persona_comisario($data['valorpk']);
               $data['fila'] = $this->Model_consulta_contratista->consulta_contratista_general($data['valorpk']);
                
               $this->load->view('Registro/regcontratista_4',$data);

}//fin funcion reg_form



function grabar()
{
                $this->vismenu = $this->load->view('vis_menu','',TRUE);
                
                if(!isset($_POST['valorpk']) or $_POST['valorpk']==''){
                $data['valorpk']  = $this->uri->segment(3);}else{
                $data['valorpk']  = $_POST['valorpk'];}

                if(!isset($_POST['valorid'])){
                $data['valorid']  =$this->uri->segment(4);}else{
                $data['valorid']  =$_POST['valorid'];}

             
              if(!isset($_POST['modo']) or $_POST['modo'] <= '0'){
                $data['modo']       =$this->uri->segment(5);}
                else{$data['modo']  =$_POST['modo'];}
              
                
                $data['xajax_js'] = $this->xajax->getJavascript(base_url());
                $data['query_persona_natural']= $this->Model_insert_personas->consulta_persona_natural($data['valorid']);
                $data['fila'] = $this->Model_consulta_contratista->consulta_contratista_general($data['valorpk']);
                
                
    if ($data['query_persona_natural']->num_rows() > 0 and $this->uri->segment(4) >0){
       
                $fila = $data['query_persona_natural']->row();
                $data['nomb']   = $fila->pnt_nombres;
                $data['apdo']   = $fila->pnt_apellidos;
                $data['ced']    = $fila->pnt_cedula_de_identidad;
                $data['nrif']   = $fila->pnt_rif_personal;
                $data['email']  = $fila->pnt_email;
                //$data['chk_comisario'] = '';
                $data['bk_cedula'] = 'readonly="readonly"';
               

                                                                        //aqui cambie a un segundo parametro valorpk
                $data['query_persona_accionista']= $this->Model_insert_personas->consulta_persona_accionista_id_pk($data['valorpk'],$data['valorid']);
      if ($data['query_persona_accionista']->num_rows() > 0){
       
                $fila2 = $data['query_persona_accionista']->row();
                $data['cargac']        =$fila2->ajr_cargo_actual;
                $data['comisario']     ='';
                $data['acc']           =$fila2->ajr_accionista;
                $data['rp']            =$fila2->ajr_representante_legal;
                $data['JDir']          =$fila2->ajr_miembro_junta_directiva;
                $data['chk_comisario'] = '';
                $data['comisario']     ='false';
                $data['dis']           ='';
                $data['dis_comisario'] ='disabled="true"';
                $data['porc']          =$fila2->ajr_porcentaje_acciones;
       //       $data['xajax_js']      = $this->xajax->getJavascript(base_url());

                
                if(!isset($_POST['profesion']) or $_POST['profesion']==''){
                $data['profesion']     ='';}else{
                $data['profesion']     =$_POST['profesion'];}

                if(!isset($_POST['numcole']) or $_POST['numcole']==''){
                $data['numcole']       ='';}else{
                $data['numcole']       =$_POST['numcole'];}

                if(!isset($_POST['vigen']) or $_POST['vigen']=='' ){
                $data['vigen']         ='';}else{
                $data['vigen']         =$_POST['vigen'];}

      }else{                                                                           //aqui cambie  a un segundo parametro valor id
               $data['query_comisario']= $this->Model_consulta_contratista->consulta_persona_comisario($data['valorpk'],$data['valorid']);
               $fila3 = $data['query_comisario']->row();
               $data['profesion']     =$fila3->com_profesion;
               $data['numcole']       =$fila3->com_numero_colegiado;
               $data['vigen']         =$this->mylib_base->pg_to_human($fila3->com_vigencia_colegiado);
               $data['porc']          = '';
               $data['chk_comisario'] = 'checked';
               $data['dis'] = 'disabled="true"';
               $data['dis_comisario'] ='disabled="true"';

               if(!isset($_POST['comisario']) or $_POST['comisario']==''){
               $data['comisario']    ='false';}else{
               $data['comisario']    =$_POST['comisario'];}

               if(!isset($_POST['cargac']) or $_POST['cargac']==''){
               $data['cargac']       ='';}else{
               $data['cargac']       =$_POST['cargac'];}

               $data['acc']          ='false';


              if(!isset($_POST['rp']) or $_POST['rp']==''){
              $data['rp']           ='false';}else{
              $data['rp']           =$_POST['rp'];}

              if(!isset($_POST['JDir']) or $_POST['JDir']==''){
              $data['JDir']          ='false';}else{
              $data['JDir']          =$_POST['JDir'];}
      
      }

    }//fin cuando pregunto si el id de la persona esta en la tabla personas naturales
    else{// inicio de la recoleccion de datos de variables por post

                if(isset($_POST['nomb'])){
                $data['nomb']          =$_POST['nomb'];}else{
                $data['nomb']          ='';}

                $data['bk_cedula'] = '';


                if(!isset($_POST['chk_comisario'])){
                $data['chk_comisario']          ='';}else{
                $data['chk_comisario']          =$_POST['chk_comisario'];}



                if(!isset($_POST['dis'])){
                $data['dis']          ='';}else{
                $data['dis']          =$_POST['dis'];}


                if(!isset($_POST['dis_comisario'])){
                $data['dis_comisario']          ='';}else{
                $data['dis_comisario']          =$_POST['dis_comisario'];}


                if(isset($_POST['chk_comisario'])){
                $data['chk_comisario']          =$_POST['chk_comisario'];}else{
                $data['chk_comisario']          ='';}

                if(isset($_POST['apdo'])){
                $data['apdo']          =$_POST['apdo'];}else{
                $data['apdo']          ='';}

                if(isset($_POST['ced']) or $_POST['ced']==''){
                $data['ced']           =$_POST['ced'];}else{
                $data['ced']           ='';}

                if(isset($_POST['nrif']) or $_POST['nrif']==''){
                $data['nrif']          =$_POST['nrif'];}else{
                $data['nrif']          ='';}

                if(isset($_POST['email'])or $_POST['email']==''){
                $data['email']         =$_POST['email'];}else{
                $data['email']         ='';}

                if(!isset($_POST['profesion']) or $_POST['profesion']==''){
                $data['profesion']     ='';}else{
                $data['profesion']     =$_POST['profesion'];}

                if(!isset($_POST['numcole']) or $_POST['numcole']==''){
                $data['numcole']       ='';}else{
                $data['numcole']       =$_POST['numcole'];}

                if(!isset($_POST['vigen']) or $_POST['vigen']=='' ){
                $data['vigen']         ='';}else{
                $data['vigen']         =$_POST['vigen'];}

                if(!isset($_POST['cargac']) or $_POST['cargac']==''){
                $data['cargac']       ='';}else{
                $data['cargac']       =$_POST['cargac'];}

                if(!isset($_POST['comisario']) or $_POST['comisario']==''){
                $data['comisario']    ='';}else{
                $data['comisario']    =$_POST['comisario'];}

                if(!isset($_POST['acc']) or $_POST['acc']==''){
                $data['acc']          ='false';}else{
                $data['acc']          =$_POST['acc'];}

                if(!isset($_POST['rp']) or $_POST['rp']==''){
                $data['rp']           ='false';}else{
                $data['rp']           =$_POST['rp'];}
            
                if(!isset($_POST['JDir']) or $_POST['JDir']==''){
                $data['JDir']          ='false';}else{
                $data['JDir']          =$_POST['JDir'];}
            // $data['porc']
               if(!isset($_POST['porc']) or $_POST['porc']==''){
                $data['porc']          ='0.00';}else{
                $data['porc']          =$_POST['porc'];}

                $data['xajax_js'] = $this->xajax->getJavascript(base_url());
            ////fin de obtener las variables por post
      }
      
                $this->Model_insert_legal->pkcontratista    = $this->uri->segment(3);
                $this->form_validation->set_rules('nomb','Nombre','required');
                $this->form_validation->set_rules('apdo','Apellido','required');
                $this->form_validation->set_rules('ced','Numero de Cedula','required');
                $this->form_validation->set_rules('nrif','R.I.F.','required');
                 $this->form_validation->set_rules('persona','Tipo de Persona','norequired');

                $data['query_persona_natural']= $this->Model_insert_personas->consulta_persona_natural($data['valorid']); //le consulto si el id de la persona existe en la vista personas naturales
                $data['query']= $this->Model_consulta_contratista->personas_contratistas($data['valorpk']);
                $data['query_comisario']= $this->Model_consulta_contratista->consulta_persona_comisario($data['valorpk']);
                $data['query_persona_natural_id']= $this->Model_insert_personas->consulta_persona_natural_id($data['ced']);
                $data['fila'] = $this->Model_consulta_contratista->consulta_contratista_general($data['valorpk']);
//********************************************************///***************************************************************
  if ($this->form_validation->run() == FALSE) //valido el formulario

                {

              $this->load->view('Registro/regcontratista_4',$data);

                }
  else{

       if ($data['query_persona_natural']->num_rows() > 0)
                   {//modificar registros           
            $this->modificar($data);
                    
                    }
       else{

            
            if ($data['query_persona_natural_id']->num_rows() > 0){
                   $this->load->view('Registro/regcontratista_4',$data);
                    }else{
                     $this->incluir($data);

                         }
           }


  }//********************************************************************//***************************************************


                
}//fin de funcion grabar

    function incluir($data)

   {

           

              
            $result_personas = $this->Model_insert_personas->ingreso_persona('personas_naturales',$_POST['valorpk']);
            $row = $result_personas->row_array();
            $row['ins_personas_naturales'];
            // inserte  a la persona natural
         
            if(!isset($_POST['comisario']) or $_POST['comisario'] == '0' ){//veo si el check de comisario es true(comisario) o false(accinista)
            $result_accionista = $this->Model_insert_personas->ingreso_accionista('contratistas_acjdrl',$_POST['valorpk'],$row['ins_personas_naturales']);
            $cero = '0';
            redirect('con_reg_4/reg_form/'.$_POST['valorpk'].'/'.$cero.'/'.$data['modo']);} //fin si es falso el check ingreso accionista
            else{
               $data['query_comisario']= $this->Model_consulta_contratista->consulta_persona_comisario($data['valorpk']);
            if($data['query_comisario']->num_rows() > 0){ //pregunto si hay un fk_contratista en comisario
          
            $cero = '0';
            redirect('con_reg_4/reg_form/'.$_POST['valorpk'].'/'.$cero.'/'.$data['modo']);}
            else{

            $cero = '0';
            $result_comisario = $this->Model_insert_personas->ingreso_comisario('contratistas_comisarios',$_POST['valorpk'],$row['ins_personas_naturales']);
            redirect('con_reg_4/reg_form/'.$_POST['valorpk'].'/'.$cero.'/'.$data['modo']);
             }
                }//fin else truue el check ingreso comisario

                   


   }

function modificar($data){


        $result_mod_personas = $this->Model_insert_personas->modificar_persona_natural($data['valorid']);

        $data['query_persona_accionista']= $this->Model_insert_personas->consulta_persona_accionista($data['valorid']);

      if ($data['query_persona_accionista']->num_rows() > 0) //modifico accionista o comisario
                {//modificar accionista

                $cero = '0';
                $result_modificar_accionista = $this->Model_insert_personas->modificar_accionista('contratistas_acjdrl',$data['valorid']);
                redirect('con_reg_4/reg_form/'.$_POST['valorpk'].'/'.$cero.'/'.$data['modo']);

                }else{//modificar comisario
                 $cero = '0';
                 $result_modificar_contratista = $this->Model_insert_personas->modificar_comisario('contratistas_comisarios',$data['valorid']);
                 redirect('con_reg_4/reg_form/'.$_POST['valorpk'].'/'.$cero.'/'.$data['modo']);

                     }


        }

        function eliminar_persona(){
                if(!isset($_POST['valorpk']) or $_POST['valorpk']==''){
                $data['valorpk']  = $this->uri->segment(3);}else{
                $data['valorpk']  = $_POST['valorpk'];}

                if(!isset($_POST['valorid']))
                {$data['valorid']      =$this->uri->segment(4);}
                else{$data['valorid']  =$_POST['valorid'];}

                if(!isset($_POST['modo'])){
                $data['modo']       =$this->uri->segment(5);}
                else{$data['modo']  =$_POST['modo'];}

               $data['query_persona_natural_id']= $this->Model_insert_personas->consulta_persona_natural_comisario($data['valorpk'],$data['valorid']);
                
               if ($data['query_persona_natural_id']->num_rows() > 0){
                $cero = '0';
                $eliminar_comisario = $this->Model_insert_personas->borrar_comisario($data['valorpk'],$data['valorid']);
                redirect('con_reg_4/reg_form/'. $data['valorpk'].'/'.$cero.'/'.$data['modo']);
               
               }else{
                $cero = '0';
                $eliminar_accionista = $this->Model_insert_personas->borrar_accionista($data['valorpk'],$data['valorid']);
                redirect('con_reg_4/reg_form/'. $data['valorpk'].'/'.$cero.'/'.$data['modo']);
                }


        }



     function alertacedula($persona,$ced_persona,$pk_contratista,$modo){

               $ced_persona= $persona.$ced_persona;

               $respuesta = new xajaxResponse();

               $propiedadInputDestino = "innerHTML";
               $inputDestino = "resp_cedula";


               $data['consulta_persona_en_contratista']= $this->Model_insert_personas->consulta_persona_en_contratista($pk_contratista,$ced_persona );
               $data['query_persona_natural_id']= $this->Model_insert_personas->consulta_persona_natural_id($ced_persona);
               

              if ($data['consulta_persona_en_contratista']->num_rows() > 0){
               
                $valorAAsignar = '<font color="#FF0000"><BLINK>La persona ya esta registrada en esta Contratista</BLINK></font>';
            
               }elseif ($data['query_persona_natural_id']->num_rows() > 0){

                
                $valorAAsignar=anchor('con_reg_4_1/grabar/'.$pk_contratista.'/'.$ced_persona.'/'.$modo,'La persona Ya existe ¿desea Agregarla a esta Contratista?');
                                                                                            

               }else{

                    $valorAAsignar ='<input type="submit" name="boton" value="Guardar" onclick=""/>';
               }

                 $respuesta->Assign($inputDestino, $propiedadInputDestino, $valorAAsignar);
                 return $respuesta;
        }



       
            




  }

 
   
  


?>
