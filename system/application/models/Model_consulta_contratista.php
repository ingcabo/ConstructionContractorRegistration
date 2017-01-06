<?php

class Model_consulta_contratista extends Model {


	function Model_consulta_contratista(){
            parent::Model();
            $this->load->helper('inflector');
            $this->load->library('mylib_base');
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
            return ($query_persona_legal);
    }

    function personas_contratistas($valorpk){
            $this->db->where('con_contratistas_pk',$valorpk);
            $query_personas = $this->db->get('vis_personas_contratistas');
            return ($query_personas);
    }
}

?>
