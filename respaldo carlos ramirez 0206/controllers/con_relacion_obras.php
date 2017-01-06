<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
* @property CI_Loader $load
* @property CI_Form_validation $form_validation
* @property CI_Input $input
* @property CI_Email $email
* @property CI_DB_active_record $db
* @property CI_DB_forge $dbforge
*/


class Con_relacion_obras extends Controller
{
    var $titulo, $encabezado, $campos_lv, $TotalRegistros, $Tit_Tabla;
    var $vismenu;

    function Con_relacion_obras() {
      parent::Controller();
      $this->load->model('Model_consulta_contratista','',TRUE);
      $this->load->library('pagination');
      $this->load->helper('form');
      $this->load->helper('url');
      $this->load->library('xajax');
    }

    function Tipo_condicion($campo_seleccionado){
         $objResponse = new xajaxResponse();
         $objResponse->Assign("DivSelectOperador","innerHTML", $this->Model_consulta_contratista->Operador($campo_seleccionado));
         return $objResponse;
    } //Fin Tipo_condicion

    function index($registro_offset=0){

      $pag_config['per_page'] = '20';
      $this->Model_consulta_contratista->prefijo_tabla   = 'con_';
      $this->Model_consulta_contratista->nombre_tabla    = 'contratistas';
      $this->titulo                     = 'Vista de '.$this->Model_consulta_contratista->CrearTitulo($this->Model_consulta_contratista->prefijo_tabla.$this->Model_consulta_contratista->nombre_tabla);
      $this->encabezado                 = 'Listado de '.$this->Model_consulta_contratista->CrearTitulo($this->Model_consulta_contratista->prefijo_tabla.$this->Model_consulta_contratista->nombre_tabla);
      //Consulta de registros a mostrar
      $buscar_campo     = $this->input->post('dl_campos',TRUE);
      $buscar_operador  = $this->input->post('SelectOperador',TRUE);
      $buscar_filtro    = $this->input->post('CampoFiltro',TRUE);
      if($buscar_campo <> '' and $buscar_filtro <> '' and $buscar_operador <> ''){
          if($registro_offset == 0){
            $resultado_busqueda = $this->Model_consulta_contratista->ObtRegistrosFiltrados($buscar_campo,$buscar_filtro,$buscar_operador,$pag_config['per_page'],'');
          }else{
            $resultado_busqueda = $this->Model_consulta_contratista->ObtRegistrosFiltrados($buscar_campo,$buscar_filtro,$buscar_operador,$pag_config['per_page'],$registro_offset);
          }
          $this->campos_lv = ($resultado_busqueda <> NULL) ? $resultado_busqueda->result_array() : NULL;
      }else {
          if($registro_offset == 0){
            $resultado_busqueda = $this->Model_consulta_contratista->ObtTodosRegistros($pag_config['per_page']);
          }else{
            $resultado_busqueda = $this->Model_consulta_contratista->ObtTodosRegistros($pag_config['per_page'],$registro_offset);
          }
          $this->campos_lv = ($resultado_busqueda <> NULL) ? $resultado_busqueda->result_array() : NULL;
      }
      //Parametros para paginacion
      $pag_config['base_url'] = base_url().'/index.php/con_consult_regco/index/';
      $pag_config['total_rows'] = $this->Model_consulta_contratista->CantidadRegistros();
      $this->pagination->initialize($pag_config);

      //Incorporo ajax al formulario de busqueda
      $this->xajax->registerFunction(array('Tipo_condicion',&$this,'Tipo_condicion'));
      $this->xajax->processRequest();
      $template['xajax_js'] = $this->xajax->getJavascript(base_url());
      $template['content']  = 'xajax_Tipo_condicion(this.value);';

      //Compobacion de existen datos que mostrar o no
      if ($this->campos_lv != null){
        //Asigno los titulos de los campos
        $Tit_Tabla        = array_keys($this->campos_lv[0]);
        $this->Tit_Tabla  = $this->Model_consulta_contratista->sinpk($Tit_Tabla);
        //Identifico el campo PK
        $this->Model_consulta_contratista->campo_clave = $this->Model_consulta_contratista->prefijo_tabla.$this->Model_consulta_contratista->nombre_tabla.'_pk';
        //Cuento la cantidad de registros
        $this->TotalRegistros   = $this->Model_consulta_contratista->CantidadRegistros();
        $this->vismenu = $this->load->view('vis_menu','',true);
        $this->load->view('seguimiento/vis_relacion_obras',$template);
      }else{
        show_error('No hay registros que mostrar');
      }
    }
} //Fin clase con_listview
?>