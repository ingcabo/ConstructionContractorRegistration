<?php
class Model_insert_personas extends Model {



	function Model_insert_personas()
	{
		parent::Model();
       $this->load->model('Model_insert','',TRUE);
       $this->load->database();
       $this->load->helper('inflector');
       $this->load->helper('date');



	}


function consulta_persona_natural($pk_natural){//consulta por el pk de la persona natural
    
       $this->db->where('pnt_personas_naturales_pk',$pk_natural);
       //$this->db->select('pnt_personas_naturales_pk');
       $query_persona = $this->db->get('vis_personas_naturales');
       //$query_persona = $query_persona->row();
       return ($query_persona);

}



function consulta_persona_natural_cedula($cedula_id){//consulta por el pk de la persona natural

       $this->db->where('pnt_cedula_de_identidad',$cedula_id);
       //$this->db->select('pnt_personas_naturales_pk');
       $query_persona = $this->db->get('vis_personas_naturales');
       //$query_persona = $query_persona->row();
       return ($query_persona);

}


function consulta_persona_natural_id($id_natural){//consulta por el id o cedula de la persona natural

       $this->db->where('pnt_cedula_de_identidad',$id_natural);
       $query_persona = $this->db->get('personas_naturales');
       return ($query_persona);

}


function modificar_persona_natural($pk){
$nom_tabla = 'personas_naturales';

$datos['pnt_nombres']               = $_POST['nomb'];//viene del formulario
$datos['pnt_apellidos']             = $_POST['apdo'];
$datos['pnt_email']                 = $_POST['email'];
$datos['pnt_otro_documento']        = 'otros';
$datos['pnt_personas_naturales_pk'] = $pk;

$consulta = "select * from upd_$nom_tabla (".$this->Model_insert->CreaParametros($nom_tabla,$datos).")";
//print_r($consulta);
return $this->db->query($consulta);


}


function ingreso_persona($nom_tabla)
{

$datos['pnt_nombres']                = $_POST['nomb'];
$datos['pnt_apellidos']              = utf8_encode($_POST['apdo']);
$datos['pnt_cedula_de_identidad']    = $_POST['persona'].$_POST['ced'];
$datos['pnt_rif_personal']           = $_POST['nrif'];
$datos['pnt_email']                  = $_POST['email'];
$datos['pnt_otro_documento']         = 'otros';



$consulta_personas_naturales = "select * from ins_$nom_tabla (".$this->Model_insert->CreaParametros($nom_tabla,$datos).")";

//print_r($consulta_personas_naturales);
return $this->db->query($consulta_personas_naturales);
    
}



function modificar_comisario($nom_tabla,$pk)
{



$datos['com_profesion']                        = $_POST['profesion'];
$datos['com_numero_colegiado']                 = $_POST['numcole'];
if(!isset($_POST['vigen']) or $_POST['vigen']== "" ){
$datos['com_vigencia_colegiado'] = '01-01-1900';}
else{$datos['com_vigencia_colegiado']          =$this->mylib_base->human_to_pg($this->input->post('vigen'));} //$_POST['vigen'];}
$datos['pnt_personas_naturales_fk']            = $pk;


        $consulta = "select * from upd_$nom_tabla (".$this->Model_insert->CreaParametros($nom_tabla,$datos).")";
        return $this->db->query($consulta);
    
}


function ingreso_comisario($nom_tabla,$parametro,$idpersona)
{
$datos['con_contratistas_fk']            = $parametro;
$datos['pnt_personas_naturales_fk']      = $idpersona;
$datos['com_profesion']                  = $_POST['profesion'];
$datos['com_numero_colegiado']           = $_POST['numcole'];

if(!isset($_POST['vigen']) or $_POST['vigen']=="" ){
$datos['com_vigencia_colegiado'] = '01-01-1900';}
else{$datos['com_vigencia_colegiado']   =$this->mylib_base->human_to_pg($this->input->post('vigen'));}




$consulta_personas_comisario = "select * from ins_$nom_tabla (".$this->Model_insert->CreaParametros($nom_tabla,$datos).")";

//print_r($consulta_personas_comisario);

return $this->db->query($consulta_personas_comisario);
    
}


       function consulta_persona_natural_comisario($pk_contratista,$pk_natural){//consulta por el pk de la persona natural

       $this->db->where('pnt_personas_naturales_fk',$pk_natural);
       $this->db->where('con_contratistas_fk',$pk_contratista);
      
       $query_persona_en_tablacomisario = $this->db->get('contratistas_comisarios');
     
       return ($query_persona_en_tablacomisario);

}




function ingreso_accionista ($nom_tabla,$parametro,$idpersona)
{
$datos['con_contratistas_fk']               = $parametro;
$datos['pnt_personas_naturales_fk']         = $idpersona;
$datos['ajr_cargo_actual']                  = $_POST['cargac']; // texto

if(!isset($_POST['acc']) or $_POST['acc']==''){
$datos['ajr_accionista']= 'false';}else{
$datos['ajr_accionista']= 'true';}

if(!isset($_POST['JDir']) or $_POST['JDir']==''){
$datos['ajr_miembro_junta_directiva']= 'false';}else{
$datos['ajr_miembro_junta_directiva']= 'true';}

if(!isset($_POST['rp']) or $_POST['rp']==''){
$datos['ajr_representante_legal']= 'false';}else{
$datos['ajr_representante_legal']= 'true';}


 if(!isset($_POST['porc']) or $_POST['porc']==''){
    $datos['ajr_porcentaje_acciones']  = 0;}else{
               if ($_POST['porc'] > 100){
               $datos['ajr_porcentaje_acciones'] = 100;
               }else{

                   $tarto_1 = str_replace('.','',$_POST['porc']);
                   $tarto_2 = str_replace(',','.',$tarto_1);

                   $datos['ajr_porcentaje_acciones']  = $tarto_2;
                    }
                                                 }





$consulta_personas_accionista = "select * from ins_$nom_tabla (".$this->Model_insert->CreaParametros($nom_tabla,$datos).")";

//print_r($consulta_personas_accionista);

return $this->db->query($consulta_personas_accionista);

    
}

function consulta_persona_accionista($pk_natural){



  $this->db->where('pnt_personas_naturales_fk',$pk_natural);
  $query_persona = $this->db->get('contratistas_acjdrl');
  return ($query_persona);
    


}


function consulta_persona_accionista_id_pk($pk_contratista,$pk_natural){


  $this->db->where('con_contratistas_fk',$pk_contratista);
  $this->db->where('pnt_personas_naturales_fk',$pk_natural);
  $query_persona = $this->db->get('contratistas_acjdrl');
  return ($query_persona);



}






function modificar_accionista ($nom_tabla,$idpersona){

    if(!isset($_POST['cargac']) or $_POST['cargac']==''){
    $datos['ajr_cargo_actual'] = '';}else{
    $datos['ajr_cargo_actual']= $_POST['cargac'];} // texto

    if(!isset($_POST['acc']) or $_POST['acc']==''){
    $datos['ajr_accionista']= 'false';}else{
    $datos['ajr_accionista']= 'true';}

    if(!isset($_POST['JDir']) or $_POST['JDir']==''){
    $datos['ajr_miembro_junta_directiva']= 'false';}else{
    $datos['ajr_miembro_junta_directiva']= 'true';}

    if(!isset($_POST['rp']) or $_POST['rp']==''){
    $datos['ajr_representante_legal']= 'false';}else{
    $datos['ajr_representante_legal']= 'true';}

    if(!isset($_POST['porc']) or $_POST['porc']==''){
    $datos['ajr_porcentaje_acciones']  = 0;}else{
               if ($_POST['porc'] > 100){
               $datos['ajr_porcentaje_acciones'] = 100;
               }else{
                   
                            $tarto_1 = str_replace('.','',$_POST['porc']);
                            $tarto_2 = str_replace(',','.',$tarto_1);
                   
                   $datos['ajr_porcentaje_acciones']  = $tarto_2;
                    }
                                                 }
    $datos['pnt_personas_naturales_fk'] = $idpersona;


$consulta_personas_accionista = "select * from upd_$nom_tabla (".$this->Model_insert->CreaParametros($nom_tabla,$datos).")";

//print_r($consulta_personas_accionista);

return $this->db->query($consulta_personas_accionista);


    
}

function consulta_persona_en_contratista($pk_contratista, $pk_natural){


       $this->db->where('pnt_cedula_de_identidad',$pk_natural);
       $this->db->where('con_contratistas_pk',$pk_contratista);
       $query_persona_en_contratista = $this->db->get('vis_personas_contratistas');
       return ($query_persona_en_contratista);
}


function borrar_accionista($pk_contratista,$pk_natural){

    $nom_tabla="contratistas_acjdrl";
    $borrar_personas_accionista = "select * from del_$nom_tabla ($pk_contratista,$pk_natural)";
    return $this->db->query($borrar_personas_accionista);

}

function borrar_comisario($pk_contratista,$pk_natural){

    $nom_tabla="contratistas_comisarios";
    $borrar_personas_comisario = "select * from del_$nom_tabla ($pk_contratista,$pk_natural)";
    return $this->db->query($borrar_personas_comisario);

}







}
?>
