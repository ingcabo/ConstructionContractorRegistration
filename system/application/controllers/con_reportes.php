<?php
/**
 * Programador: Ricardo Camejo
 * Fecha: 12/06/2009
 */
class Con_reportes extends controller
{
    var $arr_rep_leg, $vismenu, $dpd_opciones;

    function Con_reportes()
    {
        parent::Controller();
        $this->load->plugins('to_pdf');
        $this->load->helper('form');
    }

    function codigo_especialidad($contratista_pk){
        $gen_cod = 'SELECT con_contratistas_fk, epo_inicial, eac_principal, aob_inicial
  FROM esp_are_xcontratista, especialidad_objeto, areas_objeto
  WHERE con_contratistas_fk = ? AND epo_especialidad_objeto_fk = epo_especialidad_objeto_pk and aob_areas_objeto_fk = aob_areas_objeto_pk
  ORDER BY aob_inicial,eac_principal desc';
        $res_gen_doc = $this->db->query($gen_cod,array($contratista_pk));
        $codigo_siez = '';
        foreach($res_gen_doc->result_array() as $fila){
            if(strpos($codigo_siez,$fila['aob_inicial']) === false){
                $codigo_siez .= $fila['aob_inicial'];
            }
            $codigo_siez .= $fila['epo_inicial'];
        }
        return $codigo_siez;
    } //fin codigo_especialidad

    function rep_inscripcion($contratista_pk){
        //Datos de la tabla contratistas
        $datos = 'select con_numero_rif,con_nombre,con_siglas,tpf_descripcion, con_fecha_inscripcion,con_codigo_siez from contratistas, tipo_firma as tf where con_contratistas_pk = ? and tpf_tipo_firma_pk = tpf_tipo_firma_fk';
        $res_datos = $this->db->query($datos,array($contratista_pk));
        $arr_datos = $res_datos->result_array();
        $arr_datos[0]['cod_especialidad'] = $this->codigo_especialidad($contratista_pk);
        $rep_leg = 'SELECT pnt_apellidos || \',\' ||pnt_nombres as nombre,pnt_cedula_de_identidad,ajr_cargo_actual
                    FROM contratistas_acjdrl, personas_naturales
                    WHERE ajr_representante_legal = true AND pnt_personas_naturales_fk = pnt_personas_naturales_pk AND con_contratistas_fk = ? ';
        $res_rep_leg = $this->db->query($rep_leg,array($contratista_pk));
        $this->arr_rep_leg = $res_rep_leg->result_array();
        if($res_rep_leg->num_rows() > 0){
          $html = $this->load->view('reportes/rep_inscripcion',$arr_datos[0],true);
          pdf_create($html,'inscripcion'.$arr_datos[0]['con_numero_rif']);
        }else{
          show_error('Contratista con datos incompletos para emitir Certificado de Inscripci&oacute;n');
        }
       
    } //fin rep_inscripcion

    function rep_solvencia($contratista_pk){
        $datos = "SELECT con_numero_rif,con_nombre,con_siglas, tpf_descripcion, CURRENT_DATE ,con_codigo_siez, nfs_nivel ||'=>'||nfs_capital_desde||':'||nfs_capital_hasta as nivel
                  FROM contratistas, tipo_firma as tf, nivel_financiero_snc
                  WHERE con_contratistas_pk = ? and tpf_tipo_firma_pk = tpf_tipo_firma_fk and nfs_nivel_financiero_snc_fk = nfs_nivel_financiero_snc_pk";
        $res_datos = $this->db->query($datos,array($contratista_pk));
        $arr_datos = $res_datos->result_array();
        $arr_datos[0]['cod_especialidad'] = $this->codigo_especialidad($contratista_pk);
        $rep_leg = 'SELECT pnt_apellidos || \',\' ||pnt_nombres as nombre,pnt_cedula_de_identidad,ajr_cargo_actual
                    FROM contratistas_acjdrl, personas_naturales
                    WHERE ajr_representante_legal = true AND pnt_personas_naturales_fk = pnt_personas_naturales_pk AND con_contratistas_fk = ? ';
        $res_rep_leg = $this->db->query($rep_leg,array($contratista_pk));
        $this->arr_rep_leg = $res_rep_leg->result_array();
        //Busco fecha de vencimiento de solvencia
        $res_fv = $this->db->query('select max(sol_fecha_vencimiento) as fecha from contratistas_solvencias where con_contratistas_fk = ?',array($contratista_pk));
        $arr_fv = $res_fv->row_array();
        $arr_datos[0]['fecha_vencimiento'] = $arr_fv['fecha'];
        $html = $this->load->view('reportes/rep_solvencia',$arr_datos[0],true);
        pdf_create($html,'solvencia'.$arr_datos[0]['con_numero_rif']);
    }

    function rep_observaciones($contratista_pk){
        $datos = "SELECT eva_contratista_evaluacion_pk, svr_descripcion, con_nombre, con_numero_rif
                  FROM vis_recaudos_transito, contratistas
                  WHERE con_contratistas_fk = ? and con_contratistas_fk = con_contratistas_pk and eva_estatus in ('3','5');";
        $res_datos = $this->db->query($datos,array($contratista_pk));
        $arr_datos['obser'] = $res_datos->result_array();
        $html = $this->load->view('reportes/rep_observaciones',$arr_datos,true);
        pdf_create($html,'observaciones'.$arr_datos);
    }

    function rep_recaudos(){
        $con_tipos = 'SELECT ctp_contratistas_tipo_pk, ctp_descripcion FROM visfk_contratistas_tipo';
        $res_con_tipos = $this->db->query($con_tipos);
        $opciones = array('primero' => 'Seleccione Uno');
        foreach($res_con_tipos->result_array() as $fila){
             $opciones = $opciones+array($fila['ctp_contratistas_tipo_pk'] => $fila['ctp_descripcion']);
        }
        $this->dpd_opciones = $opciones;
        $this->vismenu = $this->load->view('vis_menu','',true);

        if(isset($_POST['dpd_tipos']) and $this->input->post('dpd_tipos') <> 'primero'){
            $datos = "SELECT  svr_descripcion, srt_vigente_hasta, srt_obligatorio
                      FROM sol_rec_xtipo, solvencias_recaudos, contratistas_tipo
                      WHERE svr_solvencias_recaudos_fk = svr_solvencias_recaudos_Pk AND ctp_contratistas_tipo_fk = ctp_contratistas_tipo_Pk AND srt_vigente_hasta >= CURRENT_DATE AND ctp_contratistas_tipo_fk = ?
                      ORDER BY svr_descripcion";
            $res_datos = $this->db->query($datos,array($_POST['dpd_tipos']));
            $this->arr_rep_leg = $res_datos->result_array();
            if($res_datos->num_rows() > 0){
              $con_tipos        = 'SELECT ctp_contratistas_tipo_pk, ctp_descripcion FROM visfk_contratistas_tipo WHERE ctp_contratistas_tipo_pk = ?';
              $res_con_tipos    = $this->db->query($con_tipos,$_POST['dpd_tipos']);
              $data['tipo']     = $res_con_tipos->result_array();
              $html = $this->load->view('reportes/rep_recaudos',$data,true);
              pdf_create($html,'recaudos');
            }else {
              $this->load->view('vis_rep_recaudos',array('info' => 'No hay informaci&oacute;n para mostrar'));
            }
        }else{
            $this->load->view('vis_rep_recaudos','');
        }
    } //Fin rep_recaudos


}
?>
