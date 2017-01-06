<?php
/*
 * Programador: Ricardo Camejo
 * Fecha: 01/03/2009
 *
 */
/**
* @property CI_Loader $load
* @property CI_Form_validation $form_validation
* @property CI_Input $input
* @property CI_Email $email
* @property CI_DB_active_record $db
* @property CI_DB_forge $dbforge
*/


class Con_consult_regco extends Controller
{
    var $titulo, $encabezado, $campos_lv, $TotalRegistros, $Tit_Tabla, $col_anc;
    var $t_nombre,$t_prefijo, $registros_paginas, $esquema, $vismenu, $clase_crud;
    var $anchos     = array('1'=>75,'2'=>10,'3'=>10);
    var $filtrado   = array();

    function Con_consult_regco() {
      parent::Controller();
      $this->load->model('Mfrmclass','',TRUE);
      $this->load->library(array('Mylib_base','pagination','xajax'));
      $this->load->helper(array('form','url'));
    }

    function Tipo_condicion($campo_seleccionado){
      $objResponse = new xajaxResponse();
      $objResponse->Assign("DivSelectOperador","innerHTML", $this->Mfrmclass->Operador($campo_seleccionado));
      return $objResponse;
    } //Fin Tipo_condicion

    function index($registro_offset=0){

      //Paginacion
      $pag_config['per_page'] = '5';
      $this->Mfrmclass->prefijo_tabla   = 'con_';
      $this->Mfrmclass->nombre_tabla    = 'contratistas';
      $this->titulo                     = 'Vista de '.$this->Mfrmclass->CrearTitulo($this->Mfrmclass->prefijo_tabla.$this->Mfrmclass->nombre_tabla);
      $this->encabezado                 = 'Listado de '.$this->Mfrmclass->CrearTitulo($this->Mfrmclass->prefijo_tabla.$this->Mfrmclass->nombre_tabla);


      //Valido quien llama al listview para limpiar los filtros activos
//      if($this->centinela->getReferencia() == '' or $this->centinela->getReferencia() <> $this->uri->segment(1) or $this->centinela->getReferencia() <> $this->Mfrmclass->uri_segmento($_SERVER['HTTP_REFERER'],4)){
//        if(isset($_SERVER['HTTP_REFERER']))
//          $this->centinela->putReferencia($this->Mfrmclass->uri_segmento($_SERVER['HTTP_REFERER'],4));
//        else $this->centinela->putReferencia('');
//        $this->centinela->putcampo1('');
//        $this->centinela->putcampo2('');
//        $this->centinela->putcampo3('');
//      }

      if(isset($_SERVER['HTTP_REFERER'])){
        if($this->centinela->getReferencia() <> $this->Mfrmclass->uri_segmento($_SERVER['HTTP_REFERER'],4)){
          $this->centinela->putReferencia($this->Mfrmclass->uri_segmento($_SERVER['HTTP_REFERER'],4));
          $this->centinela->putcampo1('');
          $this->centinela->putcampo2('');
          $this->centinela->putcampo3('');
        }
      }

       //Si no hay filtro en el post lo elimino
//      if(isset($_POST['CampoFiltro'])){
//          if(trim($_POST['CampoFiltro']) == ''){
//            $this->centinela->putcampo1('');
//            $this->centinela->putcampo2('');
//            $this->centinela->putcampo3('');
//          }elseif($_POST['CampoFiltro'] !=  $this->centinela->getcampo3('CampoFiltro')){
//            $this->centinela->putcampo1($_POST['dl_campos']);
//            $this->centinela->putcampo2($_POST['SelectOperador']);
//            $this->centinela->putcampo3($_POST['CampoFiltro']);
//          }
//      }

      if(isset($_POST['CampoFiltro'])){
          if(trim($_POST['CampoFiltro']) == ''){
            $this->centinela->putcampo1('');
            $this->centinela->putcampo2('');
            $this->centinela->putcampo3('');
          }elseif($_POST['CampoFiltro'] !=  $this->centinela->getcampo3()){
            $this->centinela->putcampo3($_POST['CampoFiltro']);
          }elseif($_POST['dl_campos'] !=  $this->centinela->getcampo1()){
            $this->centinela->putcampo1($_POST['dl_campos']);
          }elseif($_POST['SelectOperador'] !=  $this->centinela->getcampo2()){
            $this->centinela->putcampo2($_POST['SelectOperador']);
          }
      }

      //Consulta de registros a mostrar
      //Evaluo los campos a filtrar, si existe o no, para almacenarlo en la session
      if($this->centinela->getcampo1() <> ''){
          $buscar_campo = $this->centinela->getcampo1();
      }else {
          $buscar_campo = $this->input->post('dl_campos',TRUE);
          $this->centinela->putcampo1($buscar_campo);
      }
      if($this->centinela->getcampo2() <> ''){
          $buscar_operador = $this->centinela->getcampo2();
      }else {
          $buscar_operador = $this->input->post('SelectOperador',TRUE);
          $this->centinela->putcampo2($buscar_operador);
      }
      if($this->centinela->getcampo3() <> '' ){
          $buscar_filtro = $this->centinela->getcampo3();
      }else {
          $buscar_filtro = $this->input->post('CampoFiltro',TRUE);
          $this->centinela->putcampo3($buscar_filtro);
      }
       
      //Se ejecuta el filtrado de hacer falta
      if($buscar_campo <> '0' and $buscar_filtro <> '' and $buscar_operador <> '0'){
          if($registro_offset == 0){
            $resultado_busqueda = $this->Mfrmclass->ObtRegistrosFiltrados($buscar_campo,$buscar_filtro,$buscar_operador,$pag_config['per_page'],'',$this->esquema);
          }else{
            $resultado_busqueda = $this->Mfrmclass->ObtRegistrosFiltrados($buscar_campo,$buscar_filtro,$buscar_operador,$pag_config['per_page'],$registro_offset,$this->esquema);
          }
          $this->campos_lv = ($resultado_busqueda <> NULL) ? $resultado_busqueda->result_array() : NULL;
          $this->filtrado = array('dl_campos'=>$buscar_campo,'SelectOperador'=>$buscar_operador,'CampoFiltro'=>$buscar_filtro);
          $q_registros = $this->Mfrmclass->ObtRegistrosFiltrados($buscar_campo,$buscar_filtro,$buscar_operador,'','',$this->esquema);
          if($q_registros <> null)
            $this->TotalRegistros       = $q_registros->num_rows();
          else
            $this->TotalRegistros       = 0;
      }else {
          if($registro_offset == 0){
            $resultado_busqueda = $this->Mfrmclass->ObtTodosRegistros($pag_config['per_page'],'',$this->esquema);
          }else{
            $resultado_busqueda = $this->Mfrmclass->ObtTodosRegistros($pag_config['per_page'],$registro_offset,$this->esquema);
          }
          $this->campos_lv = ($resultado_busqueda <> NULL) ? $resultado_busqueda->result_array() : NULL;
          $this->TotalRegistros       = $this->Mfrmclass->CantidadRegistros($this->esquema);
      }
      
      //Parametros para paginacion
      $pag_config['base_url'] = base_url().'/index.php/con_consult_regco/index/';
      $pag_config['total_rows'] = $this->TotalRegistros;
      $this->pagination->initialize($pag_config);

      //Incorporo ajax al formulario de busqueda
      $this->xajax->registerFunction(array('Tipo_condicion',&$this,'Tipo_condicion'));
      $this->xajax->processRequest();
      $template['xajax_js'] = $this->xajax->getJavascript(base_url());
      $template['content']  = 'xajax_Tipo_condicion(this.value);';

      //Identifico el campo PK
      $this->Mfrmclass->campo_clave = $this->Mfrmclass->prefijo_tabla.$this->Mfrmclass->nombre_tabla.'_pk';
      //Cuento la cantidad de registros
      $this->vismenu = $this->load->view('vis_menu','',true);
      //Compobacion de existen datos que mostrar o no
      if ($this->campos_lv != null){
        //Asigno los titulos de los campos
        $Tit_Tabla        = array_keys($this->campos_lv[0]);
      }else{
        //Asigno anchos de campos para generar tabla vacia
        $Tit_Tabla        = $this->anchos; 
      }
      $this->Tit_Tabla  = $this->Mfrmclass->sinpk($Tit_Tabla);
      $this->load->view('seguimiento/vis_consulta_cont_recaudo',$template);
    }
} //Fin clase con_listview
?>