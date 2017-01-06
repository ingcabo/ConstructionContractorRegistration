<?php
class Model_insert extends Model {
  
    

	function Model_insert()
	{
		parent::Model();
	}
function consulta_combo($tabla){

// $tabla = la tabla o vista a consultar.


	$query = $this -> db -> get($tabla);
	return ($query);
}
function numeros_telefonicos_tipo(){

   // $this->db->select('ntt_descripcion,ntt_numeros_telefonicos_tipo_pk,ntt_obligatorio');
    $this -> db -> order_by('ntt_numeros_telefonicos_tipo_pk', 'ASC');
    $query_telef= $this->db->get('numeros_telefonicos_tipo');
    return ($query_telef);

}

                            function ObtTodosRegistros($limite = 0,$comienza=0,$tabla ='',$campo = '',$valorpk= 0){

                            if($limite == 0){

                            $this->db->where($campo,$valorpk);
                            $query = $this->db->query("select * from $tabla");
                            }else{
                            if($comienza == 0){

                            $this->db->where($campo,$valorpk);
                            $query = $this->db->query("select * from $tabla".$limite);
                            }else{

                            $this->db->where($campo,$valorpk);
                            $query = $this->db->query("select * from $tabla limit $limite offset $comienza");
                            }
                            }
                            if($query->num_rows() > 0){
                            return $query;
                            }
                            else{
                            return null;
                            }

                            }


                      
                               function CreaParametros($tabla,$arreglo){
                                    $resultado = '';
                                    foreach($arreglo as $cam => $valor){
                                        $atributos = $this->ObtAttCampo($tabla,$cam);

                                        

                                        if($atributos['tipo'] == 'varchar'){
                                          $resultado = $resultado.'\''.$valor.'\',';
                                        }elseif($atributos['tipo'] == 'date'){
                                            if($valor == NULL){ $resultado = $resultado.'null,';}else{
                                                $resultado = $resultado.'\''.$this->mylib_base->human_to_pg($valor).'\',';
                                            }
                                          
                                        }elseif($atributos['tipo'] == 'int2' or $atributos['tipo'] == 'int4' or $atributos['tipo'] == 'int2' or $atributos['tipo'] == 'numeric'){
                                          if($valor == '')
                                            $resultado = $resultado.'null,';
                                          else
                                            $resultado = $resultado.$valor.',';
                                        }elseif($atributos['tipo'] == 'bool'){
                                           if($valor == '')
                                             $resultado = $resultado.'false,';
                                           else
                                             $resultado = $resultado.$valor.',';
                                        }else{
                                          $resultado = $resultado.$valor.',';
                                        }
                                    }
                                  //  print_r($resultado);
                                    return rtrim($resultado,',');
                        } //Fin CreaParametros


                              function ObtAttCampo($tabla,$campo)
                            {
                            $consulta = "select * from pg_att_campo('$tabla','$campo')";
                            return $this->db->query($consulta)->row_array();
                            }


function consulta_recaudo_aprobado($valorpk){

 
                $query =  $this->db->query('select * from vis_recaudos_transito where con_contratistas_fk = '.$valorpk.'and eva_estatus = 4 ');
                                 // $query = $query->row();
                return ($query);

}



function consulta_recaudo_transito($valorpk){ //solo para sacar la fecha de emision


                  $this->db->where('con_contratistas_fk',$valorpk);
                  $query =  $this->db->get('vis_recaudos_transito');
        	     // $query = $query->row();
                  return ($query);
}


function consulta_rif($valor){ //solo para sacar la fecha de emision


                  $this->db->where('con_numero_rif',$valor);
                  $query =  $this->db->get('contratistas');
        	     // $query = $query->row();
                  return ($query);



}

function consulta_recaudo_emision($valorpk,$fecha){

    $consulta = $this->db->query('select * from vis_recaudos_transito where con_contratistas_fk =  '.$valorpk.' and eva_fecha_emision =  '.$fecha.'  and  (eva_estatus = 4 )');
    return ($consulta);
}



function consulta_recaudo_transito_pass($valorpk){ //contratistas que tenga vencimineto o faltante


                  $query =  $this->db->query('select * from vis_recaudos_transito where con_contratistas_fk = '.$valorpk.'and (eva_estatus = 3 or eva_estatus = 5)');
        	     // $query = $query->row();
                   return ($query);


}


function consulta_cpf($valor){



                  $this->db->where('nfs_nivel_financiero_snc_pk',$valor);

                  $query =  $this->db->get('nivel_financiero_snc');
                  
                //  $query = $query->row();
                  
                   //print_r($query);
         	       return ($query);
}


function cambiar_estatus_recaudo($nom_tabla,$valorpk,$emision){

                        $datos['eva_estatus']           = '4';
                        $datos['con_contratistas_fk']   = $valorpk;
                        $datos['eva_fecha_emision']     = $emision;


                        $consulta = "select * from act_$nom_tabla (".$this->CreaParametros($nom_tabla,$datos).")";
                        //print_r($consulta);

                        return $this->db->query($consulta);
}



function cambiar_estatus_contratista($valorpk,$vstatus,$nom_tabla){

                       
                        $datos['con_estatus']           = $vstatus;
                        $datos['con_contratistas_pk']   = $valorpk;
                       
                        $consulta = "select * from ett_$nom_tabla (".$this->CreaParametros($nom_tabla,$datos).")";
                        //print_r($consulta);
                        return $this->db->query($consulta);
}






function consulta_contratista_modificar($valorpk){


                  $this->db->where('con_contratistas_pk',$valorpk);
                  $query =  $this->db->query('select * from vis_contratistas');
        	      $query =  $query->row();
                  return ($query);
}



function consulta_contratista($valorpk){

                  $this->db->where('con_contratistas_pk',$valorpk);
                  $query =  $this->db->get('contratistas');
        	     // $query = $query->row();
                  return ($query);


    
}




function consulta_estados(){
	$this -> db -> order_by('est_nombre', 'ASC');
	
	$query_estados = $this -> db -> get('visfk_estados');
	
	return ($query_estados);
}


function consultar_estado($pk){
	$this -> db -> where('est_estados_pk', $pk);
	
	$query = $this -> db -> get('estados');
	
	return ($query);
}


function consulta_municipios(){
	$this -> db -> order_by('mun_nombre', 'ASC');
	
	$query_municipios = $this -> db -> get('visfk_municipio');
	
	return ($query_municipios);
}


function consultar_municipio2($pk){
	$this -> db -> where('mun_municipio_pk', $pk);
	
	$query = $this -> db -> get('municipio');
	
	return $query;
}


function consultar_estado_municipios($fk){
	$this -> db -> select('mun_municipio_pk, mun_nombre');
	$this -> db -> where('est_estados_fk', $fk);
	
	$query = $this -> db -> get('municipio');
	
	return $query;
}


function consulta_ciudades(){
	$this -> db -> order_by('ciu_nombre', 'ASC');
	
	$query_ciudades = $this -> db -> get('visfk_ciudades');
	
	return $query_ciudades;
}


function consultar_ciudad($idciudad){
	$this -> db -> where('ciu_ciudades_pk', $idciudad);
	
	$query_ciudad = $this -> db -> get('ciudades');
	
	return ($query_ciudad);
}


function consultar_municipio_ciudades($fk){
	$this -> db -> select('ciu_ciudades_pk, ciu_nombre');
	$this -> db -> where('mun_municipio_fk', $fk);
	
	$query = $this -> db -> get('ciudades');
	
	return $query;
}


function consultar_municipio($idmunicipio){

          
          $this->db->where('est_estados_fk',$idmunicipio);
          $this->db->select('mun_municipio_pk,mun_nombre');
          $query_municipio = $this->db->get('vis_municipio');
           return ($query_municipio);
}

function consultar_municipio_combo($idmunicipio){


          $this->db->where('est_estados_fk',$idmunicipio);
          $this->db->select('mun_municipio_pk,mun_nombre');
          $query_municipio = $this->db->get('vis_municipio_combo');
           return ($query_municipio);
}


/*
function numeros_telefonicos_tipo(){

    $this->db->select('ntt_descripcion,ntt_numeros_telefonicos_tipo_pk');
    $query_telef= $this->db->get('numeros_telefonicos_tipo');
    return ($query_telef);

}*/


function contratista_tipo(){
              
                       $query_cont_tipo= $this->db->get('visfk_contratistas_tipo');
                       return ($query_cont_tipo);


}



function tipo_tipo_firma(){

                       $query_tipo_firma= $this->db->get('visfk_tipo_firma');
                       return ($query_tipo_firma);


}



function nivel_financiero(){
                       $this->db->select('nfs_nivel_financiero_snc_pk,descripcion_nf');
                       $query_nivel_financiero= $this->db->get('visfk_nivel_financiero_snc');
                       return ($query_nivel_financiero);


}




function tipo_cooperativa(){

                    
                     $query_tipo_coop = $this->db->get('visfk_tipo_cooperativa');
                     return ($query_tipo_coop);
}

function indice_capital(){

                    
                      $query_indice_capital = $this->db->get('visfk_indice_capital_social');
                      return ($query_indice_capital);
}


	function insertar_contratista ($nom_tabla,$codigo){ //registro principal de la contratista
	
    //$this->mylib_base->human_to_pg($this->input->post('txt_fecha'))

                            if(!isset($_POST['nivelf']) or $_POST['nivelf']=="" or $_POST['nivelf']=='0'){
                            $datos['nfs_nivel_financiero_snc_fk'] = 'NULL';}else{
                            $datos['nfs_nivel_financiero_snc_fk']         =$_POST['nivelf']; }

                            if(!isset($_POST['ticoo']) or $_POST['ticoo']==" " or $_POST['ticoo']<='0' ){
                            $datos['tpc_tipo_cooperativa_fk'] = 'null'; }else{
                            $datos['tpc_tipo_cooperativa_fk'] =$_POST['ticoo'];}

                            $datos['ciu_ciudades_fk']             =$_POST['selCiudades'];

                            if(!isset($_POST['tipco'])or $_POST['tipco']=="" or $_POST['tipco']=='0' ){ //detalle a reparar tipo cooperativa =0 no debe ir
                            $datos['ctp_contratistas_tipo_fk'] = 'NULL';}else{
                            $datos['ctp_contratistas_tipo_fk'] =$_POST['tipco'];}

                            $datos['ett_contratistas_estatus_fk'] ='1';

                            $datos['con_nombre']                   =$_POST['nomraz'];

                            if(!isset($_POST['siglas']) or $_POST['siglas']=="" ){
                            $datos['con_siglas'] = null;}else{
                            $datos['con_siglas'] =$_POST['siglas'];}
      

                            $datos['con_numero_rif']             =$_POST['persona'].$_POST['rif'];
                            $datos['con_numero_rnc']             =$_POST['nrnc'];
                            $datos['con_fecha_inscripcion_rnc']  =$this->mylib_base->human_to_pg($this->input->post('dFecMenor'));         //$_POST['dFecMenor'];
                            $datos['con_fecha_vencimiento_rnc']  =$this->mylib_base->human_to_pg($this->input->post('dFecMayor'));   //$_POST['dFecMayor'];


                            if(!isset($_POST['dirfis']) or $_POST['dirfis']=="" ){
                            $datos['con_direccion_fiscal'] = 'null';}else{
                            $datos['con_direccion_fiscal'] =$_POST['dirfis'];}

                            if(!isset($_POST['codpost']) or $_POST['codpost']=="" ){
                            $datos['con_codigo_postal'] = null;}else{
                            $datos['con_codigo_postal'] =$_POST['codpost'];}

                            if (!isset($_POST['dirmail']) or $_POST['dirmail']==""){
                            $datos['con_email'] = 'mail';}else{
                            $datos['con_email']= $_POST['dirmail'];}

                            if(!isset($_POST['tipof']) or $_POST['tipof']=="" ){
                            $datos['tpf_tipo_firma_fk'] =null;}else{
                            $datos['tpf_tipo_firma_fk'] =$_POST['tipof'];}

                            if(!isset($_POST['clf']) or $_POST['clf']=="" ){
                            $datos['con_calificacion_financiera'] = null;}else{
                            $datos['con_calificacion_financiera'] =$_POST['clf'];}

                            if(!isset($_POST['capf']) or $_POST['capf']=="" ){
                            $datos['con_capacidad_financiera'] ='0';}else{

                            $tarto_1 = str_replace('.','',$_POST['capf']);
                            $tarto_2 = str_replace(',','.',$tarto_1);
                            $datos['con_capacidad_financiera'] = $tarto_2;}
        
                            if(!isset($_POST['con_objeto_cooperativa']) or $_POST['con_objeto_cooperativa']=="" ){
                            $datos['con_objeto_cooperativa']= 'null';}else{
                            $datos['con_objeto_cooperativa']=$_POST['objcoop'];}


                            if(!isset($_POST['timcoop']) or $_POST['timcoop']=="" ){
                            $datos['con_tiempo_cooperativa']  = 'null';}else{
                            $datos['con_tiempo_cooperativa']  =$_POST['timcoop']; }


                            if(!isset($_POST['objsoca'])or $_POST['objsoca']=="" ){
                            $datos['con_objeto_social_cooperativa'] = 'null';}else{
                            $datos['con_objeto_social_cooperativa'] =$_POST['objsoca'];}

                            if(!isset($_POST['durcoop']) or $_POST['durcoop']==""){
                            $datos['con_duracion_cooperativa'] = 'null';}else{
                            $datos['con_duracion_cooperativa'] =$_POST['durcoop'];}

                            if(!isset($_POST['indice_cap']) or $_POST['indice_cap']==""){
                            $datos['ics_indice_capital_social_fk'] = 'null';}else{
                            $datos['ics_indice_capital_social_fk'] =$_POST['indice_cap'];}
                           
                            $datos['con_fecha_inscripcion'] =$this->mylib_base->human_to_pg($this->input->post('factual'));//} //$_POST['factual'];}
                                                  

                            $datos['con_codigo_siez'] = $codigo;

                          $consulta = "select * from ins_$nom_tabla (".$this->CreaParametros('contratistas',$datos).")";
                          //print_r($consulta);
                          return $this->db->query($consulta);
              
  
    }
    function codigo_siez($factual){

        $codigo =  "select * from gen_codigo_siez('".$this->mylib_base->human_to_pg($factual)."')";
        return $this->db->query($codigo);

    }

    function editar_contratista($nom_tabla,$valorpk){

                            if(!isset($_POST['nivelf']) or $_POST['nivelf']=="" or $_POST['nivelf']=='0'){
                            $datos['nfs_nivel_financiero_snc_fk'] = 'NULL';}else{
                            $datos['nfs_nivel_financiero_snc_fk']         =$_POST['nivelf']; }

                            if(!isset($_POST['ticoo']) or $_POST['ticoo']== " " or $_POST['ticoo']<='0' ){
                            $datos['tpc_tipo_cooperativa_fk'] = 'NULL'; }else{
                            $datos['tpc_tipo_cooperativa_fk'] =$_POST['ticoo'];}

                            $datos['ciu_ciudades_fk']             =$_POST['selCiudades'];

                            if(!isset($_POST['tipco'])or $_POST['tipco']=="" or $_POST['tipco']=='0' ){ //detalle a reparar tipo cooperativa =0 no debe ir
                            $datos['ctp_contratistas_tipo_fk'] = 'NULL';}else{
                            $datos['ctp_contratistas_tipo_fk'] =$_POST['tipco'];}

                          
                            $datos['con_nombre']                   =$_POST['nomraz'];

                            if(!isset($_POST['siglas']) or $_POST['siglas']=="" ){
                            $datos['con_siglas'] = null;}else{
                            $datos['con_siglas'] =$_POST['siglas'];}


                           
                            $datos['con_numero_rnc']             =$_POST['nrnc'];

                            $datos['con_fecha_inscripcion_rnc']  =$this->mylib_base->human_to_pg($this->input->post('dFecMenor'));         //$_POST['dFecMenor'];

                            $datos['con_fecha_vencimiento_rnc']  =$this->mylib_base->human_to_pg($this->input->post('dFecMayor'));   //$_POST['dFecMayor'];


                            if(!isset($_POST['dirfis']) or $_POST['dirfis']=="" ){
                            $datos['con_direccion_fiscal'] = 'null';}else{
                            $datos['con_direccion_fiscal'] =$_POST['dirfis'];}

                            if(!isset($_POST['codpost']) or $_POST['codpost']=="" ){
                            $datos['con_codigo_postal'] = null;}else{
                            $datos['con_codigo_postal'] =$_POST['codpost'];}

                            if (!isset($_POST['dirmail']) or $_POST['dirmail']==""){
                            $datos['con_email'] = 'mail';}else{
                            $datos['con_email']= $_POST['dirmail'];}

                            if(!isset($_POST['tipof']) or $_POST['tipof']=="" ){
                            $datos['tpf_tipo_firma_fk'] =null;}else{
                            $datos['tpf_tipo_firma_fk'] =$_POST['tipof'];}

                            if(!isset($_POST['clf']) or $_POST['clf']=="" ){
                            $datos['con_calificacion_financiera'] = null;}else{
                            $datos['con_calificacion_financiera'] =$_POST['clf'];}

                            if(!isset($_POST['capf']) or $_POST['capf']=="" ){
                            $datos['con_capacidad_financiera'] ='0';}else{
                           
                             $tarto_1 = str_replace('.','',$_POST['capf']);
                             $tarto_2 = str_replace(',','.',$tarto_1);
                            $datos['con_capacidad_financiera'] = $tarto_2;}

                            
                            //number_format($_POST['capf'], 5, ".","");}

                           //number_format($capf, 0, "",".")
                           //str_replace('.','',$_POST['capf'])


                            if(!isset($_POST['con_objeto_cooperativa']) or $_POST['con_objeto_cooperativa']=="" ){
                            $datos['con_objeto_cooperativa']= 'null';}else{
                            $datos['con_objeto_cooperativa']=$_POST['objcoop'];}


                            if(!isset($_POST['timcoop']) or $_POST['timcoop']=="" ){
                            $datos['con_tiempo_cooperativa']  = 'null';}else{
                            $datos['con_tiempo_cooperativa']  =$_POST['timcoop']; }


                            if(!isset($_POST['objsoca'])or $_POST['objsoca']=="" ){
                            $datos['con_objeto_social_cooperativa'] = 'null';}else{
                            $datos['con_objeto_social_cooperativa'] =$_POST['objsoca'];}

                            if(!isset($_POST['durcoop']) or $_POST['durcoop']==""){
                            $datos['con_duracion_cooperativa'] = 'null';}else{
                            $datos['con_duracion_cooperativa'] =$_POST['durcoop'];}

                            if(!isset($_POST['indice_cap']) or $_POST['indice_cap']==""){
                            $datos['ics_indice_capital_social_fk'] = 'null';}else{
                            $datos['ics_indice_capital_social_fk'] =$_POST['indice_cap'];}

                            $datos['con_contratistas_pk'] = $valorpk;


  $consulta = "select * from upd_$nom_tabla (".$this->CreaParametros('contratistas',$datos).")";
//print_r($consulta);
  return $this->db->query($consulta);

   
    }


function modificar_numeros_telefonos($nom_tabla,$id_cont){
   // $this->parametro_id =  $id_cont;
    $can_telf = $this->db->count_all('numeros_telefonicos_tipo'); //cantidad de tipos de telefonos un campo numerico
    $lospk = $this->db->query('select * from numeros_telefonicos_tipo');
    foreach ($lospk->result() as $row) {
          //$datosf['ntt_numeros_telefonicos_tipo_fk']    = $subnumero;
          //el id del registro ya lo tengo
              $datosf['ntt_numeros_telefonicos_tipo_fk']    = $row->ntt_numeros_telefonicos_tipo_pk;
              if($_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk] <> '' or   $_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk] >= '0' ){//IF GRANDE
                if(isset($_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk])or $_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk] <> '' or $_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk] >= '0' )  {
                  $datosf['con_contratistas_fk']                = $id_cont;
                  $datosf['tel_numero'] = $_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk];
                  if(isset($_POST['pre_'.$row->ntt_numeros_telefonicos_tipo_pk]) or $_POST['pre_'.$row->ntt_numeros_telefonicos_tipo_pk] <> "" or $_POST['pre_'.$row->ntt_numeros_telefonicos_tipo_pk] >= '0'){
                    $datosf['tel_codigo_area']                    = $_POST['pre_'.$row->ntt_numeros_telefonicos_tipo_pk];
                  }else{
                    $datosf['tel_codigo_area']= 0;}
                  $datosf['tel_activo']                         = 'true';
                  $consulta_telefono                            = "select * from ins_$nom_tabla (".$this->CreaParametros($nom_tabla,$datosf).")";
                  // print_r($consulta_telefono);
                  $this->db->query($consulta_telefono);
                }
              }//fin del if grande
         
        //  unset($datosf);
    }// fin fore


  }






function insertar_numeros_telefonos($nom_tabla,$id_cont){
   // $this->parametro_id =  $id_cont;
    $can_telf = $this->db->count_all('numeros_telefonicos_tipo'); //cantidad de tipos de telefonos un campo numerico
    $lospk = $this->db->query('select * from numeros_telefonicos_tipo');
    
    foreach ($lospk->result() as $row) {

         

              $datosf['ntt_numeros_telefonicos_tipo_fk']    = $row->ntt_numeros_telefonicos_tipo_pk;
              if($_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk] <> '' or   $_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk] >= '0' ){//IF GRANDE
                if(isset($_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk])or $_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk] <> '' or $_POST['num_'.$$row->ntt_numeros_telefonicos_tipo_pk] >= '0' )  {
                  $datosf['con_contratistas_fk']                = $id_cont;
                  $datosf['tel_numero'] = $_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk];
                  if(isset($_POST['pre_'.$row->ntt_numeros_telefonicos_tipo_pk]) or $_POST['pre_'.$row->ntt_numeros_telefonicos_tipo_pk] <> "" or $_POST['pre_'.$row->ntt_numeros_telefonicos_tipo_pk] >= '0'){
                    $datosf['tel_codigo_area']                    = $_POST['pre_'.$row->ntt_numeros_telefonicos_tipo_pk];
                  }else{
                    $datosf['tel_codigo_area']= 0;}
                  $datosf['tel_activo']                         = 'true';
                  $consulta_telefono                            = "select * from ins_$nom_tabla (".$this->CreaParametros($nom_tabla,$datosf).")";
                  // print_r($consulta_telefono);
                  $this->db->query($consulta_telefono);
                }
              }//fin del if grande
     
          //unset($datosf);
    }// fin fore


  }



  function eliminar_telefono($nom_tabla,$valorpk){


     $borrar_telefonos_de_sucursal = "select * from del_$nom_tabla($valorpk)";
     return $this->db->query($borrar_telefonos_de_sucursal);


      
  }






}
?>