<?php
/**
 * Programador: Carlos Ramirez
 * Fecha inicio: 10/10/08
 * Fecha final: 11/04/09
 * Controlador de Registro de Personas de la Contratista (si una persona se encuentra en otra contratista)
 */
class con_reg_4_1 extends Controller
{

var $valorpk;
var $valorid;
var $vismenu;
     function con_reg_4_1() {

             parent::Controller();
             $this->load->database();
             
             $this->load->model('Model_insert_personas','',TRUE);
             $this->load->model('Model_consulta_contratista','',TRUE);
             $this->load->model('Model_insert','',TRUE);            
             $this->load->library('xajax');
             $this->load->helper(array('form', 'url'));
             $this->load->library('form_validation');
             $this->load->helper('form');
             $this->xajax->registerFunction(array('alertacedula',&$this,'alertacedula'));
             $this->xajax->processRequest();
             $this->load->model('Model_consulta_contratista','',TRUE);

            $this->load->library('mylib_base');

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

                if(!isset($_POST['modo'])){
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
                
               $this->load->view('Registro/regcontratista_4_1',$data);

}//fin funcion reg_form



function grabar(){

                $this->vismenu = $this->load->view('vis_menu','',TRUE);

                if(!isset($_POST['valorpk']) or $_POST['valorpk']==''){
                $data['valorpk']  = $this->uri->segment(3);}else{
                $data['valorpk']  = $_POST['valorpk'];}

                if(!isset($_POST['valorid']) or $_POST['valorid']=='')
                {$data['valorid']  =$this->uri->segment(4);}
                else
                {$data['valorid']  =$_POST['valorid'];}

                 if(!isset($_POST['modo'])){
                $data['modo']       =$this->uri->segment(5);}
                else{$data['modo']  =$_POST['modo'];}

                
    $data['xajax_js'] = $this->xajax->getJavascript(base_url());
    $data['query_persona_natural']= $this->Model_insert_personas->consulta_persona_natural_id($data['valorid']);
    $data['fila'] = $this->Model_consulta_contratista->consulta_contratista_general($data['valorpk']);
                
                
    if ($data['query_persona_natural']->num_rows() > 0 )
    {
       
                $fila = $data['query_persona_natural']->row();
                $data['nomb']   = $fila->pnt_nombres;
                $data['apdo']   = $fila->pnt_apellidos;
                $data['ced']    = $fila->pnt_cedula_de_identidad;
                $data['nrif']   = $fila->pnt_rif_personal;
                $data['email']  = $fila->pnt_email;
                $data['pk_persona_natural']  = $fila->pnt_personas_naturales_pk;
                
                //$data['chk_comisario'] = '';
            
                //pnt_personas_naturales_pk
               
               if(!isset($_POST['chk_comisario'])){
                $data['chk_comisario']          ='';}else{
                $data['chk_comisario']          =$_POST['chk_comisario'];}



                if(!isset($_POST['dis'])){
                $data['dis']          ='';}else{
                $data['dis']          =$_POST['dis'];}


                if(!isset($_POST['dis_comisario'])){
                $data['dis_comisario']          ='';}else{
                $data['dis_comisario']          =$_POST['dis_comisario'];}

               if(!isset($_POST['cargac']) or $_POST['cargac']==''){
               $data['cargac']       ='';}else{
               $data['cargac']       =$_POST['cargac'];}

                if(!isset($_POST['acc']) or $_POST['acc']==''){
                $data['acc']          ='false';}else{
                $data['acc']          =$_POST['acc'];}

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

              if(!isset($_POST['profesion']) or $_POST['profesion']==''){
                $data['profesion']     ='';}else{
                $data['profesion']     =$_POST['profesion'];}

                if(!isset($_POST['numcole']) or $_POST['numcole']==''){
                $data['numcole']       ='';}else{
                $data['numcole']       =$_POST['numcole'];}

                if(!isset($_POST['vigen']) or $_POST['vigen']=='' ){
                $data['vigen']         ='';}else{
                $data['vigen']         =$_POST['vigen'];}

                if(!isset($_POST['porc']) or $_POST['porc']==''){
                $data['porc']          ='0.00';}else{
                $data['porc']          =$_POST['porc'];}

    
 

    }//fin cuando pregunto si el id de la persona esta en la tabla personas naturales
    else
    {           // inicio de la recoleccion de datos de variables por post
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

                if(isset($_POST['ced'])){
                $data['ced']           =$_POST['ced'];}else{
                $data['ced']           ='';}

                if(isset($_POST['nrif'])){
                $data['nrif']          =$_POST['nrif'];}else{
                $data['nrif']          ='';}

                if(isset($_POST['email'])){
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
                $data['xajax_js'] = $this->xajax->getJavascript(base_url());

                if(!isset($_POST['porc']) or $_POST['porc']==''){
                $data['porc']          ='0.00';}else{
                $data['porc']          =$_POST['porc'];}





            ////fin de obtener las variables por post
      }
      
                $this->Model_insert_legal->pkcontratista    = $this->uri->segment(3);
                $this->form_validation->set_rules('nomb','Nombre','required');
                $this->form_validation->set_rules('apdo','Apellido','required');
                $this->form_validation->set_rules('ced','Numero de Cedula','required');
                $this->form_validation->set_rules('nrif','R.I.F.','required');

                $data['query_persona_natural']= $this->Model_insert_personas->consulta_persona_natural_id($data['valorid']); //le consulto si el id de la persona existe en la vista personas naturales
                $data['query']= $this->Model_consulta_contratista->personas_contratistas($data['valorpk']);
                $data['query_comisario']= $this->Model_consulta_contratista->consulta_persona_comisario($data['valorpk']);
                $data['fila'] = $this->Model_consulta_contratista->consulta_contratista_general($data['valorpk']);
                
//********************************************************///***************************************************************
  if ($this->form_validation->run() == FALSE) //valido el formulario

                {

              $this->load->view('Registro/regcontratista_4_1',$data);

                }
     else{

             $this->incluir($data);
           }


  //********************************************************************//***************************************************


                
}//fin de funcion grabar

    function incluir($data)

   {
       
       
          
                                             
            if(!isset($_POST['comisario']) or $_POST['comisario'] == '0' ){//veo si el check de comisario es true(comisario) o false(accinista)
            $result_accionista = $this->Model_insert_personas->ingreso_accionista('contratistas_acjdrl',$_POST['valorpk'],$data['pk_persona_natural']);
           $cero = '0';
           redirect('con_reg_4/reg_form/'.$_POST['valorpk'].'/'.$cero.'/'.$data['modo']);} //fin si es falso el check ingreso accionista
            else{
               $data['query_comisario']= $this->Model_consulta_contratista->consulta_persona_comisario($data['valorpk']);
            if($data['query_comisario']->num_rows() > 0){ //pregunto si hay un fk_contratista en comisario
             //$this->xajax->alerta();
            $cero = '0';
            redirect('con_reg_4/reg_form/'.$_POST['valorpk'].'/'.$cero.'/'.$data['modo']);}
            else{
            $result_comisario = $this->Model_insert_personas->ingreso_comisario('contratistas_comisarios',$_POST['valorpk'],$data['pk_persona_natural']);

            $cero = '0';
            redirect('con_reg_4/reg_form/'.$_POST['valorpk'].'/'.$cero.'/'.$data['modo']);
             }
               }//fin else truue el check ingreso comisario
                  
}//

function modificar($data){

        $result_mod_personas = $this->Model_insert_personas->modificar_persona_natural($data['valorid']);

        $data['query_persona_accionista']= $this->Model_insert_personas->consulta_persona_accionista($data['valorid']);

      if ($data['query_persona_accionista']->num_rows() > 0) //modifico accionista o comisario
                {//modificar accionista
                $cero = '0';
                $result_modificar_accionista = $this->Model_insert_personas->modificar_accionista('contratistas_acjdrl',$data['valorid']);
                redirect('con_reg_4/reg_form/'.$_POST['valorpk'].'/'.$cero.'/'.$data['modo']);

                }else{//modificar comisario
                 $result_modificar_contratista = $this->Model_insert_personas->modificar_comisario('contratistas_comisarios',$data['valorid']);
                 $cero = '0';
                 redirect('con_reg_4/reg_form/'.$_POST['valorpk'].'/'.$cero.'/'.$data['modo']);

                     }


        }



     function alertacedula($ced_persona){


                $respuesta = new xajaxResponse();
                if(!isset($_POST['valorpk']) or $_POST['valorpk']==''){
                $data['valorpk']  = $this->uri->segment(3);}else{
                $data['valorpk']  = $_POST['valorpk'];}
                $pk_contratista = $data['valorpk'];
                $propiedadInputDestino = "innerHTML";
                 $inputDestino = "resp_cedula";



               $data['query_persona_natural_id']= $this->Model_insert_personas->consulta_persona_natural_id($ced_persona);
               $data['consulta_persona_en_contratista']= $this->Model_insert_personas->consulta_persona_en_contratista($data['valorpk'],$ced_persona );

              if ($data['consulta_persona_en_contratista']->num_rows() > 0){
               
                $valorAAsignar = '<font color="#FF0000"><BLINK>La persona ya esta registrada en la Contratista</BLINK></font>';
            
               }elseif ($data['query_persona_natural_id']->num_rows() > 0){

                
                $valorAAsignar=anchor('con_reg_4_1/grabar/'.$pk_contratista.'/'.$ced_persona,'La persona Ya existe ¿desea Agregarla?<img alt="Siguiente" src="'.base_url().'system/application/imagenes/taza.gif" border="0">');
                                                                                            

               }else{

                    $valorAAsignar ='';
               }

                 $respuesta->Assign($inputDestino, $propiedadInputDestino, $valorAAsignar);
                 return $respuesta;
        }



       
            




  }//fin clase
 
   
  


?>
