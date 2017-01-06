<?php
/**
 * PHP Template.
 */
class Con_repconstructor extends controller
{
    var $vismenu, $variables;

    function Con_repconstructor()
    {
        parent::Controller();
        $this->load->model('mfrmclass');
        $this->load->model('mod_reportes');
        $this->load->plugins('to_pdf');
        $this->load->helper('form');
        $this->load->library('xajax');
        $this->load->library('mylib_base');
    }

    //funcion para refrescar combos de estado, municipios y ciudades
    function AjaxMunicipios($campo_seleccionado){
         $objResponse = new xajaxResponse();
         $objResponse->Assign("Divdpdmun","innerHTML", $this->mod_reportes->municipio($campo_seleccionado));
         return $objResponse;
    } //Fin Tipo_condicion

    //funcion para refrescar combos de estado, municipios y ciudades
    function AjaxCiudades($campo_seleccionado){
         $objResponse = new xajaxResponse();
         $objResponse->Assign("Divdpdciu","innerHTML", $this->mod_reportes->ciudades($campo_seleccionado));
         return $objResponse;
    } //Fin Tipo_condicion

    //Armo un arreglo a partir de una consulta de SQL con el resultado query
    function query_to_dpd($consulta){
        $arr_est = array('0'=>'Seleccione uno');
        foreach($consulta->result_array() as $fila){
          foreach($fila as $campo => $valor){
            if($this->mfrmclass->espk($campo)){
             $pk = $valor;}
            else {$arr_est[$pk] = $valor;}
          }
        }
        return $arr_est;
    } //Fin query_to_dpd

    //Genero listado de años
    function listaanos(){
       $anoinicio = 1950;
       $anos[0] = 'Seleccione uno';
       for($ano=1950;$ano<=date('Y',now());$ano++){
           $anos[$ano] = $ano;
       }
       return $anos;
    } //Fin listaanos


    function index(){

        //Incorporo ajax al formulario de busqueda
        $this->xajax->registerFunction(array('AjaxMunicipios',&$this,'AjaxMunicipios'));
        $this->xajax->registerFunction(array('AjaxCiudades',&$this,'AjaxCiudades'));
        $this->xajax->processRequest();
        $template['xajax_js']     = $this->xajax->getJavascript(base_url());
        $template['content_mun']  = 'xajax_AjaxMunicipios(this.value);';
        $template['content_ciu']  = 'xajax_AjaxCiudades(this.value);';

        $this->variables['xajax'] = $template;
        $this->variables['txt_rif'] = '';
        $this->variables['txt_rnc'] = '';
        $this->variables['nombre'] = '';
        $this->variables['estemp'] = $this->query_to_dpd($this->mfrmclass->ObtRegPorTabla('contratistas_estatus','visfk_'));
        $this->variables['est'] = $this->query_to_dpd($this->mfrmclass->ObtRegPorTabla('estados','visfk_'));
        $this->variables['mun'] = $this->query_to_dpd($this->mfrmclass->ObtRegPorTabla('municipio','visfk_'));
        $this->variables['ciu'] = $this->query_to_dpd($this->mfrmclass->ObtRegPorTabla('ciudades','visfk_'));

        $data_area = array();
        $res_aob = $this->db->query('select * from areas_objeto where aob_activo = true order by aob_nombre');
        foreach($res_aob->result_array() as $fila_aob){
            $res_esp = $this->db->query('select * from especialidad_objeto where aob_areas_objeto_fk = ? and epo_activo =true order by epo_nombre',$fila_aob['aob_areas_objeto_pk']);
            foreach($res_esp->result_array() as $fila_epo){
                $data_chk['name'] = 'chk[]';
                $data_chk['id']   = 'chks';
                $data_chk['value']= $fila_epo['epo_especialidad_objeto_pk'];
                $data_area[$fila_aob['aob_nombre']][$fila_epo['epo_nombre']] =$data_chk;
            }
        }
        $this->variables['lisesp'] = $data_area;
        $this->variables['dencom'] = $this->query_to_dpd($this->mfrmclass->ObtRegPorTabla('denominacion_comercial','visfk_'));
        $this->variables['calfin'] = '';
        $this->variables['capfin'] = '';
        $this->variables['nivfin'] = $this->query_to_dpd($this->mfrmclass->ObtRegPorTabla('nivel_financiero_snc','visfk_'));
        $this->variables['anocon'] = $this->listaanos();
        $this->variables['tipemp'] = $this->query_to_dpd($this->mfrmclass->ObtRegPorTabla('contratistas_tipo','visfk_'));
        $this->variables['anoreg'] = $this->listaanos();
        $this->variables['conpor'] = $this->query_to_dpd($this->mfrmclass->ObtRegPorTabla('organismos','visfk_'));;

        $this->vismenu = $this->load->view('vis_menu','',true);
        $this->load->view('frm_RepConstructor',$this->variables);
    }

    function gen_reporte(){

        if(isset($_POST['bto_procesar'])){
            $vista = 'SELECT c.*,ce.ett_nombre, nf.nfs_nivel, ct.ctp_descripcion, cl.clg_capital_social_suscrito,cl.clg_capital_social_pagado, dc.dec_denominacion_comercial_pk,dc.dec_descripcion
                        FROM contratistas as c,contratistas_estatus as ce, nivel_financiero_snc as nf, contratistas_tipo as ct, contratistas_legal as cl, denominacion_comercial as dc
                        WHERE ett_contratistas_estatus_fk = ett_contratistas_estatus_pk and nfs_nivel_financiero_snc_pk = nfs_nivel_financiero_snc_fk and ctp_contratistas_tipo_pk = ctp_contratistas_tipo_fk
                        and con_contratistas_pk = cl.con_contratistas_fk and cl.dec_denominacion_comercial_fk = dc.dec_denominacion_comercial_pk';

            $filtro = '';
            //Filtrado por numero de rif
            if(isset($_POST['txt_rif']) and $_POST['txt_rif'] <> ''){
                $filtro = $filtro.' AND c.con_numero_rif = \''.$this->input->post('inirif').$this->input->post('txt_rif').'\'';}

            //Filtrado por numero de rnc
            if(isset($_POST['txt_rnc']) and $_POST['txt_rnc'] <> ''){
                $filtro = $filtro.' AND c.con_numero_rnc = \''.$this->input->post('txt_rnc').'\'';}
            
            //Filtrado por nombre o razon social
            if(isset($_POST['txt_nombre']) and $_POST['txt_nombre'] <> ''){
                $filtro = $filtro.' AND c.con_nombre LIKE \''.$this->input->post('txt_nombre').'\'';}
            
            //Filtrado por estatus de la empresa
            if(isset($_POST['dpd_estemp'])){
                $multiple = '';
                foreach($_POST['dpd_estemp'] as $pk){
                    $multiple .= $pk.',';
                }
                $filtro = $filtro.' AND c.ett_contratistas_estatus_fk IN ('.rtrim($multiple,',').')';}

            //Filtrado por nombre o razon social
            if(isset($_POST['dpd_ciudades']) and $_POST['dpd_ciudades'] == 0){
              if(isset($_POST['dpd_municipio']) and $_POST['dpd_municipio'] == 0){
                if(isset($_POST['dpd_estado']))
                  if($_POST['dpd_estado'] <> 0){
                      $filtro .= $this->mod_reportes->ciu_xestados($_POST['dpd_estado']);}
              }else{
                $filtro .= $this->mod_reportes->ciu_xmunicipio($_POST['dpd_municipio']);}
            }else{
                $filtro = ' AND ciu_ciudades_fk ='.$_POST['dpd_ciudades']; }

            //Filtrado por denominacion comercial
            if(isset($_POST['dpd_dencom']) and $_POST['dpd_dencom'] <> 0){
                $filtro = $filtro.' AND dc.dec_denominacion_comercial_pk IN ('.$_POST['dpd_dencom'].')';}

            //Filtrado por Capital social suscrito
            if(isset($_POST['txt_cap_suscrito']) and $_POST['txt_cap_suscrito'] <> '' and is_numeric($_POST['txt_cap_suscrito'])){
                $filtro = $filtro.' AND clg_capital_social_suscrito > '.$_POST['txt_cap_suscrito'];}

            //Filtrado por Capital pagado
            if(isset($_POST['txt_cap_pagado']) and $_POST['txt_cap_pagado'] <> '' and is_numeric($_POST['txt_cap_pagado'])){
                $filtro = $filtro.' AND clg_capital_social_pagado > '.$_POST['txt_cap_pagado'];}

            //Filtrado por Calificacion Financiera
            if(isset($_POST['txt_calfin']) and $_POST['txt_calfin'] <> ''){
                $filtro = $filtro.' AND con_calificacion_financiera LIKE '.$_POST['txt_calfin'];}

           //Filtrado por Capacidad Financiera
            if(isset($_POST['txt_capfin']) and $_POST['txt_capfin'] <> ''){
                $filtro = $filtro.' AND con_capacidad_financiera LIKE '.$_POST['txt_capfin'];}

            //Filtrado por Nivel Financiero de Contratacion
            if(isset($_POST['dpd_nivfin']) and $_POST['dpd_nivfin'] <> 0){
                $filtro = $filtro.' AND nfs_nivel_financiero_snc_fk = ('.$_POST['dpd_nivfin'].')';}

            //Filtrado por tipo de contratista
            if(isset($_POST['dpd_tipemp']) and $_POST['dpd_tipemp'] <> 0){
                $filtro = $filtro.' AND ctp_contratistas_tipo_fk = ('.$_POST['dpd_tipemp'].')';}

           //Filtrado por fecha de inscripcion en REGCO
            if(isset($_POST['dpd_anoreg']) and $_POST['dpd_anoreg'] <> 0){
                $filtro = $filtro.' AND EXTRACT(YEAR FROM con_fecha_inscripcion) = ('.$_POST['dpd_anoreg'].')';}

           $vista = "$vista $filtro";
           //Filtrado por contratos del año seleccionado y contratado por
            if(!empty($_POST['dpd_anocon']) or !empty($_POST['dpd_conpor'])){
                $filtro_contratos = '';
                if($this->input->post('dpd_anocon') <> 0){
                  $filtro_contratos = " AND EXTRACT(YEAR FROM ctt_fecha) = ".$_POST['dpd_anocon'];}
                if($this->input->post('dpd_conpor') <> 0){
                  $multiple = '';
                  foreach($_POST['dpd_conpor'] as $pk){
                    $multiple .= $pk.',';}
                  $filtro_contratos = " AND org_organismos_fk IN (".rtrim($multiple,',').')';}
                $vista = "select c2.* from contratistas_contratos as cc, ($vista) as c2 WHERE cc.con_contratistas_fk= c2.con_contratistas_pk $filtro_contratos";
            }

            //Tipo de actividad
            if(isset($_POST['chk']) and count($_POST['chk']) > 0){
              $chkf = '';
              foreach($_POST['chk'] as $ch => $vch){
                  $chkf .= $vch.',';}
              $vista = "select c1.* from esp_are_xcontratista as eac, ($vista) AS c1 WHERE eac.con_contratistas_fk = c1.con_contratistas_pk AND eac.epo_especialidad_objeto_fk IN (". rtrim($chkf,',').")";
            }
            //else{
            //  $vista = "$vista $filtro";}

            //echo $vista;
            //return;
            //Consulta principal
            $res_vista = $this->db->query($vista);
            $q_vista['query'] = $res_vista->result_array();
            //Genero cadena de telefonos de la contratista
            foreach($q_vista['query'] as $fila_con){
               $res_telf = $this->db->query('select * from vis_contratistas_telefonos where con_contratistas_pk = ?',$fila_con['con_contratistas_pk']);
               $teles = '';
               foreach($res_telf->result_array() as $fila_tel){
                 $teles = $teles.$fila_tel['tel_codigo_area'].'-'.$fila_tel['tel_numero'].chr(13);
               }
               $q_vista['telefonos'][$fila_con['con_contratistas_pk']] = $teles;
            }

            //Genero html de reporte
            $html = $this->load->view('reportes/rep_constructor',$q_vista);
            //pdf_create($html,'constructor',true,'landscape','legal');
        }
    }

    function rep_ficha($pk) {
             $data['fila']                  = $this->mod_reportes->consulta_contratista_general($pk);
             $data['legal']                 = $this->mod_reportes->consultas('vis_contratistas_legal','con_contratistas_fk',$pk);
             $data['telefonos']             = $this->mod_reportes->consultas('vis_contratistas_telefonos','con_contratistas_pk',$pk);
             $data['personas']              = $this->mod_reportes->consultas('vis_persona_legal','con_contratistas_fk',$pk);
             //Busco el tipo de firma
             $query                         = $this->db->query('Select tpf_descripcion from tipo_firma where  tpf_tipo_firma_pk = ?',$data['fila']['con_tipo_firma']);
             $data['firma']                 = $query->row_array();
             $data['areas']                 = $this->mod_reportes->consultas('vis_contrstistas_areas_objeto','con_contratistas_pk',$pk);
             $data['obras']                 = $this->mod_reportes->consultas('vis_contratistas_contratos','con_contratistas_fk',$pk);

             $html = $this->load->view('reportes/rep_ficha',$data,false);
             //pdf_create($html,'constructor');
    }

}
?>
