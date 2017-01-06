<?php
/**
 * PHP Template.
 */
class Con_desincorporacion extends controller
{

    var $titulo, $encabezado, $campos_lv, $TotalRegistros, $Tit_Tabla, $vismenu;
    var $col_anc;

    function Con_desincorporacion(){
        parent::Controller();
        $this->load->model('Mfrmclass','',TRUE);
        $this->load->plugins('to_pdf');
        $this->load->helper(array('form','url'));
        $this->load->library(array('xajax','form_validation','pagination'));
    }

    function Tipo_condicion($campo_seleccionado){
         $objResponse = new xajaxResponse();
         $objResponse->Assign("DivSelectOperador","innerHTML", $this->Mfrmclass->Operador($campo_seleccionado));
         return $objResponse;
    } //Fin Tipo_condicion

    function index($registro_offset=0){

      $pag_config['per_page'] = '5';
      $this->Mfrmclass->prefijo_tabla   = '';
      $this->Mfrmclass->nombre_tabla    = 'desincorporar';
      $this->titulo                     = 'Vista de '.$this->Mfrmclass->CrearTitulo($this->Mfrmclass->prefijo_tabla.$this->Mfrmclass->nombre_tabla);
      $this->encabezado                 = 'Listado de '.$this->Mfrmclass->CrearTitulo($this->Mfrmclass->prefijo_tabla.$this->Mfrmclass->nombre_tabla);
      $this->col_anc                    = array('1'=>25,'2'=>10,'3'=>12,'4'=>10,'5'=>20,'6'=>1);
      
      //Consulta de registros a mostrar
      $buscar_campo     = $this->input->post('dl_campos',TRUE);
      $buscar_operador  = $this->input->post('SelectOperador',TRUE);
      $buscar_filtro    = $this->input->post('CampoFiltro',TRUE);
      if($buscar_campo <> '' and $buscar_filtro <> '' and $buscar_operador <> ''){
          if($registro_offset == 0){
            $resultado_busqueda = $this->Mfrmclass->ObtRegistrosFiltrados($buscar_campo,$buscar_filtro,$buscar_operador,$pag_config['per_page'],'');
          }else{
            $resultado_busqueda = $this->Mfrmclass->ObtRegistrosFiltrados($buscar_campo,$buscar_filtro,$buscar_operador,$pag_config['per_page'],$registro_offset);
          }
          $this->campos_lv = ($resultado_busqueda <> NULL) ? $resultado_busqueda->result_array() : NULL;
      }else {
          if($registro_offset == 0){
            $resultado_busqueda = $this->Mfrmclass->ObtTodosRegistros($pag_config['per_page']);
          }else{
            $resultado_busqueda = $this->Mfrmclass->ObtTodosRegistros($pag_config['per_page'],$registro_offset);
          }
          $this->campos_lv = ($resultado_busqueda <> NULL) ? $resultado_busqueda->result_array() : NULL;
      }
      //Parametros para paginacion
      $pag_config['base_url'] = base_url().'/index.php/con_Desincorporacion/index/';
      $tr = $this->db->query("select count(*) from vis_desincorporar");
      $rtr = $tr->row_array();
      $pag_config['total_rows'] = $rtr['count'];
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
        $this->Tit_Tabla  = $this->Mfrmclass->sinpk($Tit_Tabla);
        //Identifico el campo PK
        $this->Mfrmclass->campo_clave = $this->Mfrmclass->prefijo_tabla.$this->Mfrmclass->nombre_tabla.'_pk';
        //Cuento la cantidad de registros
        $this->TotalRegistros   = $pag_config['total_rows'];
        $centinela = new Centinela();
        $centinela->putcampo1($this->campos_lv);
        $this->vismenu = $this->load->view('vis_menu','',true);
        $this->load->view('vis_desincorporar',$template);
      }else{
        redirect( base_url().'index.php/con_consult_regco');
      }
    }

    //Realizo cambio e estatus de la contratistas a desincorporar
    function ejecutar_desincorporacion($datos){
       foreach($datos as $fila){
           $this->db->query('select * from ett_contratistas(2,'.$fila['con_contratistas_pk'].')');
       }
    }

    //Valido si la informacion necesaria para realizar la desincorporacion esta completa, de ser asi se imprime el reporte
    function rep_desincorporar(){

        //Opcion de cancelar
        if($this->input->post('bto_cancelar')){
            redirect('con_Desincorporacion');
        }

        $this->form_validation->set_rules('txt_ley','Descripci&oacute;n de ley','required');
        $this->form_validation->set_rules('txt_articulos','Articulo(s)','required');

        $this->vismenu = $this->load->view('vis_menu','',true);
        if($this->form_validation->run() ==  FALSE){
            $this->load->view('seguimiento/frm_desincorporar_datos');
        }else{
            $data['ley']        = $this->input->post('txt_ley');
            $data['articulos']  = $this->input->post('txt_articulos');
            $centinela = new Centinela();
            $data['conlista']   = $centinela->getcampo1();
            //Se ejecuta store procedure para cambiar campo de estatus en tabla de contratistas
            $this->ejecutar_desincorporacion($data['conlista']);
            $html = $this->load->view('reportes/rep_desincorporar',$data,true);
            pdf_create($html,'desincorporar_'.now());
        }
    } //Fin rep_desincorporar

}
?>
