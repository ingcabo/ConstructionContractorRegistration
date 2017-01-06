<?php
class Model_insert_sucursal extends Model {



	function Model_insert_sucursal()
	{
		parent::Model();
       $this->load->model('Model_insert','',TRUE);
       $this->load->database();
       $this->load->helper('inflector');
       $this->load->helper('date');
	}







function insertar_sucursal($tabla,$pk)
{

                  $datos['con_contratistas_fk'] =$pk;

                  if(!isset($_POST['sucu']) or $_POST['sucu']=="" ){
                  $datos['csu_descripcion'] = null;}else{
                  $datos['csu_descripcion'] =$_POST['sucu'];}

                  if(!isset($_POST['dir']) or $_POST['dir']=="" ){
                  $datos['csu_direccion'] = null;}else{
                  $datos['csu_direccion'] =$_POST['dir'];}

                  $datos['csu_activo']    = 'true';



                  $consulta_sucursal = "select * from ins_$tabla (".$this->Model_insert->CreaParametros($tabla,$datos).")";
                  //print_r($consulta);
                  return $this->db->query($consulta_sucursal);
                    
    


}


function desactivar_sucursal($tabla,$valorid){

      $datos['csu_activo']                     = 'FALSE';
      $datos['csu_contratistas_sucursales_pk'] = $valorid;

      $consulta_desactivar_sucursal = "select * from del_$tabla (".$this->Model_insert->CreaParametros($tabla,$datos).")";
     //print_r($consulta_desactivar_sucursal);
      return $this->db->query($consulta_desactivar_sucursal);
}





function desactivar_telefonos_sucursal($tabla,$valorid){

      $datos['tls_activo']                     = 'FALSE';
      $datos['csu_contratistas_sucursales_fk'] = $valorid;

      $consulta_desactivar_telefono_sucursal = "select * from upd_$tabla (".$this->Model_insert->CreaParametros($tabla,$datos).")";
     //print_r($consulta_desactivar_telefono_sucursal);
      return $this->db->query($consulta_desactivar_telefono_sucursal);
}










function modificar_sucursal($tabla,$valorid)
{



                  if(!isset($_POST['sucu']) or $_POST['sucu']=="" ){
                  $datos['csu_descripcion'] = null;}else{
                  $datos['csu_descripcion'] =$_POST['sucu'];}

                  if(!isset($_POST['dir']) or $_POST['dir']=="" ){
                  $datos['csu_direccion'] = null;}else{
                  $datos['csu_direccion'] =$_POST['dir'];}
                
                  $datos['csu_contratistas_sucursales_pk']  =$valorid;

                  $consulta_sucursal = "select * from upd_$tabla (".$this->Model_insert->CreaParametros($tabla,$datos).")";
                 // print_r($consulta);
                  return $this->db->query($consulta_sucursal);




}


/*
//ins_numeros_telefonicos_sucursales
function insertar_numeros_telefonos_sucursales($nom_tabla,$id_sucu){
   // $this->parametro_id =  $id_cont;
    $can_telf = $this->db->count_all('numeros_telefonicos_tipo'); //cantidad de tipos de telefonos un campo numerico
    $subnumero = 1;
    while ( $subnumero <= $can_telf ) {
          //$datosf['ntt_numeros_telefonicos_tipo_fk']    = $subnumero;
          //el id del registro ya lo tengo
              $datosf['ntt_numeros_telefonicos_tipo_fk']    =$subnumero;
              if($_POST['num_'.$subnumero] <> '' or   $_POST['num_'.$subnumero] >= '0' ){//IF GRANDE
                if(isset($_POST['num_'.$subnumero])  or $_POST['num_'.$subnumero] <> ''  or $_POST['num_'.$subnumero] >= '0' )  {
                  $datosf['csu_contratistas_sucursales_fk'] =$id_sucu;
                  $datosf['tls_numero'] = $_POST['num_'.$subnumero];
                  if(isset($_POST['pre_'.$subnumero])  or $_POST['pre_'.$subnumero] <> ""  or $_POST['pre_'.$subnumero] >= '0'){
                    $datosf['tls_codigo_area']                    = $_POST['pre_'.$subnumero];
                  }else{
                    $datosf['tls_codigo_area']= 0;}
                  $datosf['tls_activo']                         = 'true';
                  $consulta_telefono_sucursales                 = "select * from ins_$nom_tabla(".$this->Model_insert->CreaParametros($nom_tabla,$datosf).")";
                 //  print_r($consulta_telefono_sucursales);
                 $this->db->query($consulta_telefono_sucursales);
                }
              }//fin del if grande
          $subnumero++;
          unset($datosf);
    }// fin while


  }


*/


function insertar_numeros_telefonos_sucursales($nom_tabla,$valorid){
   // $this->parametro_id =  $id_cont;
    $can_telf = $this->db->count_all('numeros_telefonicos_tipo'); //cantidad de tipos de telefonos un campo numerico
   $lospk = $this->db->query('select * from numeros_telefonicos_tipo');
    foreach ($lospk->result() as $row) {
      
          //$datosf['ntt_numeros_telefonicos_tipo_fk']    = $subnumero;
          //el id del registro ya lo tengo
              $datosf['ntt_numeros_telefonicos_tipo_fk']    = $row->ntt_numeros_telefonicos_tipo_pk;
              if($_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk] <> '' or   $_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk] >= '0' ){//IF GRANDE
                if(isset($_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk])or $_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk] <> '' or $_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk] >= '0' )  {
                  $datosf['csu_contratistas_sucursales_fk']                = $valorid;
                  $datosf['tls_numero'] = $_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk];
                  if(isset($_POST['pre_'.$row->ntt_numeros_telefonicos_tipo_pk]) or $_POST['pre_'.$row->ntt_numeros_telefonicos_tipo_pk] <> "" or $_POST['pre_'.$row->ntt_numeros_telefonicos_tipo_pk] >= '0'){
                    $datosf['tls_codigo_area']                    = $_POST['pre_'.$row->ntt_numeros_telefonicos_tipo_pk];
                  }else{
                    $datosf['tls_codigo_area']= 0;}
                  $datosf['tls_activo']                         = 'true';
                  $consulta_telefono         = "select * from ins_$nom_tabla (".$this->Model_insert->CreaParametros($nom_tabla,$datosf).")";
                  // print_r($consulta_telefono);
                  $this->db->query($consulta_telefono);
                }
              }//fin del if grande
          
        //  unset($datosf);
    }// fin fore


  }


  

function consulta_sucursales_telefonos($valorpk)
{


                     $this->db->where('con_contratistas_fk',$valorpk);
	                 $query =  $this->db->query('select * from vis_sucursales_telefonos');
	    		     $query = $query->row();
                      return ($query);
                     

}





function consulta_sucursales_telefonos_id($valorid){

                   // $this->db->where('csu_contratistas_sucursales_fk',$valorid);
				    $query =  $this->db->query('select * from vis_contratistas_sucursales_telefonos where csu_contratistas_sucursales_pk = '.$valorid);
				  // $query = $query->row();
                     return ($query);
                   
}

    

function borrar_telefonos_de_sucursal($nom_tabla,$valorid){


    $borrar_telefonos_de_sucursal = "select * from del_$nom_tabla($valorid)";
     return $this->db->query($borrar_telefonos_de_sucursal);


}




function modificar_numeros_telefonos_sucursales($nom_tabla,$valorid){

                

$can_telf = $this->db->count_all('numeros_telefonicos_tipo'); //cantidad de tipos de telefonos un campo numerico
 $lospk = $this->db->query('select * from numeros_telefonicos_tipo');
 foreach ($lospk->result() as $row) {

   
          //$datosf['ntt_numeros_telefonicos_tipo_fk']    = $subnumero;
          //el id del registro ya lo tengo
              $datosf['ntt_numeros_telefonicos_tipo_fk']    = $row->ntt_numeros_telefonicos_tipo_pk;
              if($_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk] <> '' or   $_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk] >= '0' ){//IF GRANDE
                if(isset($_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk])or $_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk] <> '' or $_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk] >= '0' )  {
                  $datosf['csu_contratistas_sucursales_fk']                = $valorid;
                  $datosf['tls_numero'] = $_POST['num_'.$row->ntt_numeros_telefonicos_tipo_pk];
                  if(isset($_POST['pre_'.$row->ntt_numeros_telefonicos_tipo_pk]) or $_POST['pre_'.$row->ntt_numeros_telefonicos_tipo_pk] <> "" or $_POST['pre_'.$row->ntt_numeros_telefonicos_tipo_pk] >= '0'){
                    $datosf['tls_codigo_area']                    = $_POST['pre_'.$row->ntt_numeros_telefonicos_tipo_pk];
                  }else{
                    $datosf['tls_codigo_area']= 0;}
                  $datosf['tls_activo']                         = 'true';
                  $consulta_telefono         = "select * from ins_$nom_tabla (".$this->Model_insert->CreaParametros($nom_tabla,$datosf).")";
                  // print_r($consulta_telefono);
                  $this->db->query($consulta_telefono);
                }
              }//fin del if grande
          
          //unset($datosf);
    }// fin while






  


  }


  function consulta_sucursales_contratistas($valorid,$valorpk){

                    
				    $query =  $this->db->query('select * from vis_contratistas_sucursales_telefonos where csu_contratistas_sucursales_pk ='.$valorid.' and '.'con_contratistas_fk ='.$valorpk);
			        return ($query);
      
  }




function consulta_contratista($valorpk){

                 $this->db->where('con_contratistas_pk',$valorpk);
                 $query_contratista = $this->db->get('vis_contratistas_general');
                 $query = $query_contratista->row_array();
                 return ($query);


}

function consulta_contratista_value($valorpk){

                 $this->db->where('con_contratistas_pk',$valorpk);
                 $query = $this->db->get('vis_contratistas_general');
                 //$query = $query_contratista->row_array();
                 return ($query);


}






}





?>
