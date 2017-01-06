<?php
class Model_insert_contrato_contratista extends Model {



	function Model_insert_contrato_contratista()
	{
		parent::Model();
        $this->load->model('Model_insert','',TRUE);
        $this->load->database();
        $this->load->helper('inflector');

	}




    function tipo_actividad()
    {
                   $this->db->select('tpa_tipo_actividad_pk,tpa_nombre');
                   $query_tipo_actividad = $this->db->get('vis_tipo_actividad');
                   return ($query_tipo_actividad);

    }

     function organismos(){

                    $this->db->select('org_organismos_pk,org_nombre');
                    $query_organismos = $this->db->get('vis_organismos');
                    return ($query_organismos);
         
     }
  function estatus(){

                    $this->db->select('ett_estatus_pk,ett_nombre');
                    $query_estatus = $this->db->get('vis_estatus');
                    return ($query_estatus);


     }

     function consulta_contratistas_contratos($valorpk)
     {
        
                    $this->db->where('con_contratistas_fk',$valorpk);
                    $query_contratos = $this->db->get('vis_contratistas_contratos');
                    return ($query_contratos);        

     }


     function contratos_de_cada_contratista($valorpk,$valorid){

                    $this->db->where('con_contratistas_fk',$valorpk);
                    $this->db->where('ctt_contratistas_contratos_pk',$valorid);
                    $query_contratos = $this->db->get('vis_contratistas_contratos');
                    return ($query_contratos);       
     }


     function insertar_contratistas_contratos($nom_tabla,$parametro)
     {

                    $datos['con_contratistas_fk']                   =$parametro;

                    if(!isset($_POST['tipoact']) or $_POST['tipoact']==''){
                    $datos['tpa_tipo_actividad_fk']=null;}
                    else{$datos['tpa_tipo_actividad_fk']             =$_POST['tipoact'];}

                    if(!isset($_POST['estatus']) or $_POST['estatus']==''){
                    $datos['ett_estatus_fk']=null;}
                    else{$datos['ett_estatus_fk']                     =$_POST['estatus'];}

                    if(!isset($_POST['orga']) or $_POST['orga']==''){
                    $datos['org_organismos_fk']=null;}
                    else{$datos['org_organismos_fk']                  =$_POST['orga'];}

                    if(!isset($_POST['numero']) or $_POST['numero']==''){
                    $datos['numero']=null;}
                    else{$datos['ctt_numero']                         =$_POST['numero'];}

                    if(!isset($_POST['descrip']) or $_POST['descrip']==''){
                    $datos['ctt_descripcion']=null;}
                    else{$datos['ctt_descripcion']                    =$_POST['descrip'];}
              
                    if(!isset($_POST['fecha']) or $_POST['fecha']==''){
                    $datos['ctt_fecha']=null;}
                    else{$datos['ctt_fecha']                    =$this->mylib_base->human_to_pg($this->input->post('fecha'));} //$_POST['fecha'];}

                    if(!isset($_POST['obsv']) or $_POST['obsv']==''){
                    $datos['ctt_observaciones']=null;}
                    else{$datos['ctt_observaciones']                  =$_POST['obsv'];}

                    if(!isset($_POST['rendimiento']) or $_POST['rendimiento']==''){
                    $datos['ctt_rendimiento']=null;}
                    else{$datos['ctt_rendimiento']                   =$_POST['rendimiento'];}




         
      $consulta_cont_contratos = "select * from ins_$nom_tabla (".$this->Model_insert->CreaParametros($nom_tabla,$datos).")";

       //print_r($consulta_cont_contratos);
       return $this->db->query($consulta_cont_contratos);


     }



     function modificar_contratistas_contratos($nom_tabla,$valorpk,$valorid){
         //upd_contratistas_contratos

                    // $datos['con_contratistas_fk']                =$valorpk;

                    if(!isset($_POST['tipoact']) or $_POST['tipoact']==''){
                    $datos['tpa_tipo_actividad_fk']=null;}else{
                    $datos['tpa_tipo_actividad_fk']=$_POST['tipoact'];}

                    if(!isset($_POST['estatus']) or $_POST['estatus']==''){
                    $datos['ett_estatus_fk']=null;}
                    else{$datos['ett_estatus_fk']=$_POST['estatus'];}

                    if(!isset($_POST['orga']) or $_POST['orga']==''){
                    $datos['org_organismos_fk']=null;}
                    else{$datos['org_organismos_fk']=$_POST['orga'];}

                    if(!isset($_POST['numero']) or $_POST['numero']==''){
                    $datos['numero']=null;}
                    else{$datos['ctt_numero']=$_POST['numero'];}

                    if(!isset($_POST['descrip']) or $_POST['descrip']==''){
                    $datos['ctt_descripcion']=null;}
                    else{$datos['ctt_descripcion']=$_POST['descrip'];}

                    if(!isset($_POST['fecha']) or $_POST['fecha']==''){
                    $datos['ctt_fecha']=null;}
                    else{$datos['ctt_fecha']=$this->mylib_base->human_to_pg($this->input->post('fecha'));}//$_POST['fecha'];}

                    if(!isset($_POST['obsv']) or $_POST['obsv']==''){
                    $datos['ctt_observaciones']=null;}
                    else{$datos['ctt_observaciones']=$_POST['obsv'];}

                    if(!isset($_POST['rendimiento']) or $_POST['rendimiento']==''){
                    $datos['ctt_rendimiento']=null;}
                    else{$datos['ctt_rendimiento']=$_POST['rendimiento'];}

                   $datos['ctt_contratistas_contratos_pk'] = $valorid;


       $consulta_cont_contratos = "select * from upd_$nom_tabla (".$this->Model_insert->CreaParametros($nom_tabla,$datos).")";

       //print_r($consulta_cont_contratos);
       return $this->db->query($consulta_cont_contratos);


     }



function eliminar_contratos($nom_tabla,$pk_contratista,$pk_contrato){

                $eliminar_contratos = "select * from del_$nom_tabla ($pk_contratista,$pk_contrato)";
                return $this->db->query($eliminar_contratos);

}

function consulta_rendimientos(){
                    
                    $this->db->select('ren_rendimientos_pk,ren_descripcion');
                    $query_rendimientos = $this->db->get('vis_rendimientos');
                    return ($query_rendimientos);
   
}

}
?>
