<?php
class Model_areas_objeto extends Model {


    var $pkcontratista;

   

	function Model_areas_objeto()
	{
		parent::Model();
     // $this->load->model('Model_insert','',TRUE);
        $this->load->database();
        $this->load->helper('inflector');
        $this->load->model('Model_insert','',TRUE);
	}

  function insertar_areas_objeto($nom_tabla,$parametro) {
   $can_areas = $this->db->count_all('especialidad_objeto'); //cantidad de tipos de especialidades es un  numerico
   $subnumero = 0;
  
   while ( $subnumero <= $can_areas ) {
                //unset($datosa);
                $datosv['con_contratistas_fk']              = $parametro;                  //por envio de parametro tengo el Fk_contratista

               if(isset($_POST['area_'.$subnumero])){                                                  //pregunto si se trae del formulario alguna especialidas
                   $datosa['con_contratistas_fk']           =$datosv['con_contratistas_fk'];         //si es asi lleno el areglo 1ro fk_contratistas
                   $datosa['epo_especialidad_objeto_fk']    =$_POST['area_'.$subnumero];             // lleno el fk_especialidad
                   $datosv['radio'] = false;                                                        // inicializo el valor radio principal en falso
                         if(isset($_POST['radio'])){                                                // si se trae a radio  llenar el arreglo
                            $datosv['radio']                        =$_POST['radio'];                              //
                                if($datosa['epo_especialidad_objeto_fk'] == $datosv['radio'])  {   //si el valor del radio es igual al valor especialidad
                                   $datosa['eac_principal']  = 'true';}                             // es principal esa actividad
                                else{
                                   $datosa['eac_principal']  = 'false';                             // es falso no lo es pero si es una actividad
                                }
                          }if(!isset($_POST['radio']) or $_POST['radio'] == ""  ){ 
                             
                             $datosa['eac_principal']  = 'false';
                          }

               
                $consulta_areas = "select * from ins_$nom_tabla (".$this->Model_insert->CreaParametros($nom_tabla,$datosa).")";
               // echo "-->";
               // print_r($consulta_areas); //lo imprime varias veces normal sin problemas
               // echo "<br>";
               $this->db->query($consulta_areas); // lo ejecuta solo una vez "no se que pasa"
               
          }// fin (if) solo  areas selecciona
        
      $subnumero++;
      //echo "<br>";
      //print_r($subnumero);
        
    }  // Fin de while.
  }// fin de la funcion insertar.



  function eliminar_areas_objeto($nom_tabla,$valorpk){


               $datos['con_contratistas_fk']        = $valorpk;
              
               $consulta_eliminar_areas = "select * from del_$nom_tabla (".$this->Model_insert->CreaParametros($nom_tabla,$datos).")";

               $this->db->query($consulta_eliminar_areas);
  }



function validar_entrada_actividad_principal($valorpk){

                       $this->db->where('con_contratistas_fk',$valorpk);
                       $query = $this->db->get('vis_contrstistas_areas_objeto');
                       return ($query);

    


}







}      // fin de la clase.
?>
