<?php
/**
 * Description of con_listview_estatus
 *
 * @author rcamejo
 */
class Con_listview_organismos extends Controller{

    function Con_listview_organismos(){
      parent::Controller();
      $col_anc = array('1'=>70,'2'=>15,'3'=>10);
      $params = array('tabla_prefijo' => 'org_', 'tabla_nombre' => 'organismos', 'paginacion' => '5','anchos'=>$col_anc);
      $this->load->library('listview',$params);
      $this->load->model('Mfrmclass','',TRUE);
    }

    function Tipo_condicion($campo_seleccionado){
         $objResponse = new xajaxResponse();
         $objResponse->Assign("DivSelectOperador","innerHTML", $this->Mfrmclass->Operador($campo_seleccionado));
         $objResponse->Assign("DivCampoFiltro","innerHTML", $this->Mfrmclass->Campo_filtro($campo_seleccionado));
         return $objResponse;
    } //Fin Tipo_condicion

    function index($registro_offset=0){
      $this->listview->inicializar($registro_offset);
    }
}
?>
