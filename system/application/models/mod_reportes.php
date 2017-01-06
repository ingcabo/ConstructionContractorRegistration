<?php
/**
 * PHP Template.
 */
Class Mod_reportes extends Model
{
    
    
    //Constructor
    function Mod_reportes(){
        parent::Model();
        $this->load->database();
        $this->load->helper('inflector');
        $this->load->library('mylib_base');
      }

    function municipio($pk_estado){
        $this->db->where('est_estados_fk',$pk_estado);
        $this->db->where('mun_activo','true');
        $this->db->order_by('mun_nombre');
        $res_mun = $this->db->get('municipio');
        $dpd_mun = '<select name="dpd_municipio" id="dpd_municipio" onchange="xajax_AjaxCiudades(this.value);" style="width:250px;">
                    <option value="0">Seleccione uno</option>';
        foreach($res_mun->result_array() as $fila_mun){
           $dpd_mun .= '<option value="'.$fila_mun['mun_municipio_pk'].'">'.$fila_mun['mun_nombre'].'</option>';
        }
        $dpd_mun .= '</select>';
        return $dpd_mun;
    } //Fin municipio

    function ciudades($pk_municipio){
        $this->db->where('mun_municipio_fk',$pk_municipio);
        $this->db->where('ciu_activo','true');
        $this->db->order_by('ciu_nombre');
        $res_mun = $this->db->get('ciudades');
        $dpd_mun = '<select name="dpd_ciudades" id="dpd_ciudades" style="width:250px">
                    <option value="0">Seleccione uno</option>';
        foreach($res_mun->result_array() as $fila_mun){
           $dpd_mun .= '<option value="'.$fila_mun['ciu_ciudades_pk'].'">'.$fila_mun['ciu_nombre'].'</option>';
        }
        $dpd_mun .= '</select>';
        return $dpd_mun;
    } //Fin municipio

    function ciu_xestados($pk_estado){
        $consulta = 'select ciu_ciudades_pk from estados, ciudades, municipio where est_estados_fk = est_estados_pk and mun_municipio_pk = mun_municipio_fk and est_estados_pk = ?';
        $res_ciuxest = $this->db->query($consulta,$pk_estado);
        $conjunto = ' AND ciu_ciudades_fk IN (';
        if($res_ciuxest->num_rows() >0){
          foreach($res_ciuxest->result_array() as $fila){
            $conjunto .= $fila['ciu_ciudades_pk'].',';}
        }else{
          return ' AND ciu_ciudades_fk = 0';
        }
        return rtrim($conjunto,',').')';
    }

    function ciu_xmunicipio($pk_municipio){
        $consulta = 'select ciu_ciudades_pk from estados, ciudades, municipio where est_estados_fk = est_estados_pk and mun_municipio_pk = mun_municipio_fk and mun_municipio_pk = ?';
        $res_ciuxest = $this->db->query($consulta,$pk_municipio);
        $conjunto = ' AND ciu_ciudades_fk IN (';
        if($res_ciuxest->num_rows() >0){
          foreach($res_ciuxest->result_array() as $fila){
            $conjunto .= $fila['ciu_ciudades_pk'].',';}
        }else{
          return ' AND ciu_ciudades_fk = 0';
        }
        return rtrim($conjunto,',').')';
    }

    function numeros_telefonicos_tipos(){
               $this->db->select('ntt_descripcion,ntt_numeros_telefonicos_tipo_pk');
               $query_telef= $this->db->get('numeros_telefonicos_tipo');
               return ($query_telef);
    }

    function consulta_area_empresa ($valorpk){
              $this->db->where('con_contratistas_pk',$valorpk);
              $query_contratista_areas = $this->db->get('vis_contrstistas_areas_objeto');
              return ( $query_contratista_areas);
    }

    function consulta_contratista_general($valorpk){
             $this->db->where('con_contratistas_pk',$valorpk);
             $query_contratista = $this->db->get('vis_contratistas_general');
             $query = $query_contratista->row_array();
             return ($query);
    }

    function contratista_tipo(){
           $this->db->select('ctp_contratistas_tipo_pk,ctp_descripcion');
           $query_cont_tipo = $this->db->get('vis_contratistas_tipo');
           return ($query_cont_tipo);
    }

    function  consulta_contratista_legal($valorpk){
             $this->db->where('con_contratistas_fk',$valorpk);
             $query_contratista_legal = $this->db->get('vis_contratistas_legal');
             $query  = $query_contratista_legal->row_array();
             return ($query);
    }

    function consulta_persona_comisario($valorpk){
             $this->db->where('con_contratistas_fk',$valorpk);
             $query_comisario = $this->db->get('vis_persona_comisario');
             return ($query_comisario);
    }

    function consulta_persona_legal($valorpk){
            $this->db->where('con_contratistas_fk',$valorpk);
            $query_persona_legal = $this->db->get('vis_persona_legal');
            return ($query_persona_legal->row_array());
    }

    function personas_contratistas($valorpk){
            $this->db->where('con_contratistas_pk',$valorpk);
            $query_personas = $this->db->get('vis_personas_contratistas');
            return ($query_personas);
    }
    
    function consultas($vistab,$campo,$filtro){
        $query = $this->db->where($campo,$filtro);
        $query = $this->db->get($vistab);
        return $query->result_array();
    }
}
?>
