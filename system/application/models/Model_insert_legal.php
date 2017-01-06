<?php
class Model_insert_legal extends Model {

 var $pkcontratista;


	function Model_insert_legal()
	{
                        parent::Model();
                        $this->load->model('Model_insert','',TRUE);
                        $this->load->database();
                        $this->load->helper('inflector');
                        $this->load->helper('date');
	}

  function consulta_contratista_legal_id($pk_contratista,$id_legal){
      
                       $this->db->where('con_contratistas_fk',$pk_contratista);
                       $this->db->where('clg_contratistas_legal_pk',$id_legal);
                       $query_cont_legal = $this->db->get('vis_contratistas_legal');
                       return ($query_cont_legal);
   }

function consulta_registro_principal($valorpk){ //solo para sacar la fecha de emision


                  $this->db->where('con_contratistas_fk',$valorpk);
                  $this->db->where('clg_modificacion','false');
                  $query =  $this->db->get('vis_contratistas_legal');
        	      return ($query);
}

    function consulta_contratista_legal($pk_contratista){

                       $this->db->where('con_contratistas_fk',$pk_contratista);
                       $query_cont_legal = $this->db->get('vis_contratistas_legal');
                       return ($query_cont_legal);
   }


                            

   function insertar_contratista_legal($nom_tabla,$parametro) {
 

                        $datos['con_contratistas_fk']                  =$parametro;
                        
                        if(!isset($_POST['nummregm']) or $_POST['nummregm']==''){
                        $datos['clg_numero_registro']=null;}
                        else{$datos['clg_numero_registro']             =$_POST['nummregm'];}
                        $datos['dec_denominacion_comercial_fk']        =$_POST['iddenomi'];

                        if(!isset($_POST['idcrjud']) or $_POST['idcrjud']==''){
                        $datos['clg_circunscripcion_judicial']='No';}
                        else{$datos['clg_circunscripcion_judicial']    =$_POST['idcrjud'];}

                        $datos['clg_fecha_inscripcion']                =$this->mylib_base->human_to_pg($this->input->post('finscrmer'));  //$_POST['finscrmer'];
                        $datos['clg_numero_inscripcion']               =$_POST['numinsr'];
                        $datos['clg_numero_tomo']                      =$_POST['tomo'];
                        $datos['clg_numero_folio']                     =$_POST['folio'];
                        $datos['clg_objeto_social']                    =$_POST['objsc'];
                        $datos['clg_domicilio_legal_actual']           =$_POST['dirleg'];
                        $datos['clg_fecha_constitutiva']               =$this->mylib_base->human_to_pg($this->input->post('fchconsti'));//$_POST['fchconsti'];

                        if(!isset($_POST['ciefisc']) or $_POST['ciefisc']==''){
                        $datos['clg_cierre_fiscal_actual']            =$_POST['factual'];}
                        else{$datos['clg_cierre_fiscal_actual']       =$this->mylib_base->human_to_pg($this->input->post('ciefisc'));} //$_POST['ciefisc'];}


                            if(!isset($_POST['capsocsuc']) or $_POST['capsocsuc']=="" ){
                            $datos['clg_capital_social_suscrito'] ='0';}else{

                            $tr = str_replace('.','',$_POST['capsocsuc']);
                            $td = str_replace(',','.',$tr);
                            $datos['clg_capital_social_suscrito'] = $td;}



                           if(!isset($_POST['capsocpg']) or $_POST['capsocpg']=="" ){
                            $datos['clg_capital_social_pagado'] ='0';}else{

                            $ttz = str_replace('.','',$_POST['capsocpg']);
                            $ttd = str_replace(',','.',$ttz);
                            $datos['clg_capital_social_pagado'] = $ttd;}



                        //$datos['clg_capital_social_suscrito']         =str_replace('.','',$_POST['capsocsuc']);


                        //$datos['clg_capital_social_pagado']           =str_replace('.','',$_POST['capsocpg']);

                        if(isset($_POST['radio'])){

                            if($_POST['radio']=='1'){

                           $datos['clg_modificacion']  = 'false';

                            }else{

                            $datos['clg_modificacion']  = 'true';

                            }

                        }else{

                            $datos['clg_modificacion']                    = 'true';
                        }




                        $datos['clg_numero_modificaciones']           =$_POST['nmodif'];
                        $datos['clg_observaciones']                  =$_POST['obs'];


                        $consulta_cont_legal = "select * from ins_$nom_tabla (".$this->Model_insert->CreaParametros($nom_tabla,$datos).")";

                      // print_r($consulta_cont_legal);
                       return $this->db->query($consulta_cont_legal);

                        //echo "qui va un numero".$this->Model_insert->parametro_id;

     }


function consulta_denominacion(){

                    $this->db->select('dec_denominacion_comercial_pk,dec_descripcion,dec_abreviatura');
                    $query_denominacion= $this->db->get('vis_denominacion_comercial');
                    return ($query_denominacion);
}




function modificar_documento_legal($id,$pk)
{
                    $nom_tabla = 'contratistas_legal';

                    $datos['dec_denominacion_comercial_fk']        =$_POST['iddenomi'];

                    if(!isset($_POST['nummregm']) or $_POST['nummregm']==''){
                    $datos['clg_numero_registro']                  =null;}
                    else{$datos['clg_numero_registro']             =$_POST['nummregm'];}

                    if(!isset($_POST['idcrjud']) or $_POST['idcrjud']==''){
                    $datos['clg_circunscripcion_judicial']         ='0';}else{
                    $datos['clg_circunscripcion_judicial']         =$_POST['idcrjud'];}

                    $datos['clg_fecha_inscripcion']                =$this->mylib_base->human_to_pg($this->input->post('finscrmer'));
                    $datos['clg_numero_inscripcion']               =$_POST['numinsr'];
                    $datos['clg_numero_tomo']                      =$_POST['tomo'];
                    $datos['clg_numero_folio']                     =$_POST['folio'];
                    $datos['clg_objeto_social']                    =$_POST['objsc'];
                    $datos['clg_domicilio_legal_actual']           =$_POST['dirleg'];
                    $datos['clg_fecha_constitutiva']               =$this->mylib_base->human_to_pg($this->input->post('fchconsti'));

                    if(!isset($_POST['ciefisc']) or $_POST['ciefisc']==''){
                    $datos['clg_cierre_fiscal_actual']            =$this->mylib_base->human_to_pg($this->input->post('factual'));}
                    else{$datos['clg_cierre_fiscal_actual']       =$this->mylib_base->human_to_pg($this->input->post('ciefisc'));}




                            if(!isset($_POST['capsocsuc']) or $_POST['capsocsuc']=="" ){
                            $datos['clg_capital_social_suscrito'] ='0';}else{

                            $tr = str_replace('.','',$_POST['capsocsuc']);
                            $td = str_replace(',','.',$tr);
                            $datos['clg_capital_social_suscrito'] = $td;}



                           if(!isset($_POST['capsocpg']) or $_POST['capsocpg']=="" ){
                            $datos['clg_capital_social_pagado'] ='0';}else{

                            $ttz = str_replace('.','',$_POST['capsocpg']);
                            $ttd = str_replace(',','.',$ttz);
                            $datos['clg_capital_social_pagado'] = $ttd;}






                 // $datos['clg_capital_social_suscrito']         =str_replace('.','',$_POST['capsocsuc']);
                // $datos['clg_capital_social_pagado']           =str_replace('.','',$_POST['capsocpg']);


                  if(isset($_POST['radio'])){

                            if($_POST['radio']=='1'){

                           $datos['clg_modificacion']  = 'false';

                            }else{

                            $datos['clg_modificacion']  = 'true';

                            }

                        }else{

                            $datos['clg_modificacion']                    = 'true';
                        }






                    $datos['clg_numero_modificaciones']           =$_POST['nmodif'];
                    $datos['clg_observaciones']                  =$_POST['obs'];
                    $datos['clg_contratistas_legal_pk']           =$id;
                    $datos['con_contratistas_fk']                 =$pk;

                    $consulta = "select * from upd_$nom_tabla (".$this->Model_insert->CreaParametros($nom_tabla,$datos).")";

                   // print_r($consulta);
                    return $this->db->query($consulta);

}


function borrar_legal($nom_tabla,$pk_contratista,$id_legal){


                $borrar_legal = "select * from del_$nom_tabla($id_legal,$pk_contratista)";
                return $this->db->query($borrar_legal);

}





}


?>
