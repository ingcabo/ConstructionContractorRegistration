<?php
/**
 * Programador: Carlos Ramirez
 * Fecha inicio: 10/10/08
 * Fecha final: 11/04/09
 * Controlador de Registro de Datos generales de la Contratista
 */
class Con_reg_1 extends Controller{
    var $titulo, $encabezado, $campos_lv, $TotalRegistros, $Tit_Tabla, $campo_clave, $vismenu;

    var $cap;

	
	function Con_reg_1(){
		parent :: Controller();
		
		$this -> load -> database();
		$this -> load -> model('Model_insert','',TRUE);
		$this -> load -> library('pagination');
		$this -> load -> library('xajax');
		$this -> load -> library('form_validation');
		$this -> load -> helper(array('form', 'url'));
        $this -> load -> library('mylib_base');
     
		
		//declarar en el controller las fuinciones xajas a llamara en el view
		$this -> xajax -> registerFunction(array('obtieneMunicipio', &$this, 'obtieneMunicipio'));
		$this -> xajax -> registerFunction(array('obtieneCiudad', &$this, 'obtieneCiudad'));
        $this -> xajax -> registerFunction(array('alertarif', &$this, 'alertarif'));


		$this -> xajax -> processRequest();
	}
	
	
	// Formulario 1:
	function index(){
		$data['xajax_js'] = $this -> xajax -> getJavascript(base_url());
		
         $this->vismenu = $this->load->view('vis_menu','',TRUE);
		
		$data['query_indice_capital']   = $this -> Model_insert -> indice_capital();
		$data['query_tipo_coop']        = $this -> Model_insert -> tipo_cooperativa();
		$data['query_telef']            = $this -> Model_insert -> numeros_telefonicos_tipo();
		$data['query_contratista_tipo'] = $this -> Model_insert -> contratista_tipo();
		$data['query_estados']          = $this -> Model_insert -> consulta_estados();
		$data['query_tipo_firma']       = $this -> Model_insert -> tipo_tipo_firma();
		$data['query_nivel_financiero'] = $this -> Model_insert -> nivel_financiero();

		
		if(isset($_POST['siglas'])){
        
        $data['siglas'] = $_POST['siglas'];
        }
		else{
			$data['siglas'] = '';
        }
            if(isset($_POST['capf'])){
            
            $data['capf'] = $_POST['capf'];
            }
		else{
			$data['capf'] = '';
        }
		
		if(isset($_POST['clf'])){
        
        $data['clf'] = $_POST['clf'];
        }
		else{
			$data['clf'] = '';
        }

		if(isset($_POST['indice_cap'])){
        
        $data['select_indice_cap'] = $_POST['indice_cap'];
        }
		else{
			$data['select_indice_cap'] = '';
        }
		if(isset($_POST['nivelf'])){
       $data['select_nivelf'] = $_POST['nivelf'];
        }
		else{
			$data['select_nivelf'] = '';
        }
		if(isset($_POST['tipof'])){
       $data['select_tipof'] = $_POST['tipof'];
        }
		else{
			$data['select_tipof'] = '';
        }
		if(isset($_POST['ticoo'])){
        
        $data['select_ticoo'] = $_POST['ticoo'];
        }
		else{
			$data['select_ticoo'] = '';
        }
		if(isset($_POST['objcoop'])){
        
        $data['objcoop'] = $_POST['objcoop'];
        }
		else{
			$data['objcoop'] = '';
        }
		if(isset($_POST['objcoop'])){
       $data['objcoop'] = $_POST['objcoop'];
       }
		else{
			$data['objcoop'] = '';
        }
		if(isset($_POST['timcoop'])){
       $data['timcoop'] = $_POST['timcoop'];
        }
		else{
			$data['timcoop'] = '';
        }
		if(isset($_POST['durcoop'])){
        
        $data['durcoop'] = $_POST['durcoop'];
        }
		else{
			$data['durcoop'] = '';
        }
		if(isset($_POST['objsoca'])){
       $data['objsoca'] = $_POST['objsoca'];
        }
		else{
			$data['objsoca'] = '';
        }
		if(isset($_POST['codpost'])){
        
        $data['codpost'] = $_POST['codpost'];
        }
		else{
			$data['codpost'] = '';
        }
		if(isset($_POST['codpost'])){
        $data['codpost'] = $_POST['codpost'];

        }
		else{
			$data['codpost'] = '';
        }
		if(isset($_POST['dirfis'])){
       $data['dirfis'] = $_POST['dirfis'];
        }
		else{
			$data['dirfis'] = '';
        }

		
		// Actualizar los combos.
		if(isset($_POST['tipco'])){
        $data['ctp_contratistas_tipo_fk'] = $_POST['tipco'];

        }
		else{
        }		$data['ctp_contratistas_tipo_fk'] = 0;
		
		if(isset($_POST['selEstados'])){
			$data['est_estados_fk']   = $_POST['selEstados'];
			$data['query_municipios'] = $this -> Model_insert -> consultar_estado_municipios($_POST['selEstados']);
		}
		else{
			$data['est_estados_fk'] = 0;
        }
		if(isset($_POST['menu1'])){
			$data['mun_municipio_fk'] = $_POST['menu1'];
			$data['query_ciudades']   = $this -> Model_insert -> consultar_municipio_ciudades($_POST['menu1']);
		}
		else{
			$data['mun_municipio_fk'] = 0;
		}
		
		if(isset($_POST['selCiudades'])){
        $data['ciu_ciudades_fk'] = $_POST['menu1'];

        }
		else{
			$data['mun_municipio_fk'] = 0;
        }

            if(isset($_POST['factual'])){
			$data['factual'] = $_POST['factual'];}
		else{
			$data['factual'] = '';
            
            }

            if(isset($_POST['tipco'])){
			$data['tipco'] = $_POST['tipco'];}
		else{
			$data['tipco'] = '';

            }

             

	    //$this->cap = $data['capf'];

        
		$this -> form_validation -> set_rules('rif','R.I.F','required');
		$this -> form_validation -> set_rules('nrnc','Número RNC','required');
		$this -> form_validation -> set_rules('nomraz','Razón Social','required');
		$this -> form_validation -> set_rules('dFecMenor','Fecha Inicio RNC','required');
		$this -> form_validation -> set_rules('dFecMayor','Fecha Final RNC','required');
		$this -> form_validation -> set_rules('nivelf','Nivel Financiero','required|callback_capacidad_financiera');
		$this -> form_validation -> set_rules('selCiudades','Ciudad','required');
		$this -> form_validation -> set_rules('capf','Capacidad Financiera','required');//
		
        $this -> form_validation -> set_rules('indice_cap','Índice Capital','required');
        $this -> form_validation -> set_rules('tipof','Tipo de Firma','required');
        $this -> form_validation -> set_rules('tipco','Tipo de Contratista','required');
        $this -> form_validation -> set_rules('selCiudades','Ciudad','required');
        $this -> form_validation -> set_rules('siglas','Las Siglas','');
        $this -> form_validation -> set_rules('clf','La Calificación','required');
        $this -> form_validation -> set_rules('dirmail','Email','valid_email|required');
        $this -> form_validation -> set_rules('dirfis','Dirección','required');
        $this -> form_validation -> set_rules('codpost','Código Postal','required');
        $this -> form_validation -> set_rules('menu1','Municipio','required');
        $this -> form_validation -> set_rules('persona','Tipo de Persona Juridica','required');

        //numeros_telefonicos_tipo
        $data['query_tipo_telefono']          = $this -> Model_insert -> consulta_combo('numeros_telefonicos_tipo');


            foreach ($data['query_tipo_telefono']->result() as $telf)
            {
                 if ($telf->ntt_obligatorio == 't'){
                
                      $this -> form_validation -> set_rules('num_'.$telf->ntt_numeros_telefonicos_tipo_pk,'Teléfono','required');

                   }else{
                  
                 }
            }

       




        $tarto_1 = str_replace('.','',$data['capf']);
        $tarto_2 = str_replace(',','.',$tarto_1);
        $this->cap = $tarto_2;









		
		if($this -> form_validation -> run() == FALSE)
			$this -> load -> view('Registro/regcontratista_1', $data);
		else{

            $cod = $this-> Model_insert ->codigo_siez ($data['factual']);
            $row_cod = $cod -> row_array();

			$result = $this -> Model_insert -> insertar_contratista('contratistas',$row_cod['gen_codigo_siez']);
			$row = $result -> row_array();
			
			$result2 = $this -> Model_insert -> insertar_numeros_telefonos('numeros_telefonicos', $row['ins_contratistas']);
			redirect('Con_reg_2/index/' . $row['ins_contratistas'].'/0');
		}
	}


	function obtieneMunicipio($idEstado){
		$respuesta = new xajaxResponse(); //Creamos el objeto xajax
		$inputDestino = "divMunicipio"; //indicamos el ID del tag HTML de destino. en este caso el DIV que contiene el selector
		$propiedadInputDestino = "innerHTML"; //indicamos la propiedad que deseamos que se modifique. Colocaremos el selector dentro del DIV
		$valorAAsignar = ""; //indicamos el nuevo valor que este tendrá. Cadena HTML
		
		
		$query_municipio = $this -> Model_insert -> consultar_municipio_combo($idEstado);
		$valorAAsignar .= "<select name='menu1' class='textbox' onChange='xajax_obtieneCiudad(this.value);'>";
		$valorAAsignar .= "<option value='0'>[Seleccione]</option>";
		
		foreach($query_municipio -> result() as $row)
			$valorAAsignar .= "<option value='" . $row -> mun_municipio_pk . "'>" . $row -> mun_nombre . "</option>";
		
		$valorAAsignar .= "</select>";
		
		$respuesta -> Assign($inputDestino, $propiedadInputDestino, $valorAAsignar);
		
		return $respuesta;
	}
	
	
	function obtieneCiudad($idMunicipio){
		$respuesta = new xajaxResponse(); //Creamos el objeto xajax
		$inputDestino = "divCiudad"; //indicamos el ID del tag HTML de destino. en este caso el DIV que contiene el selector
		$propiedadInputDestino = "innerHTML"; //indicamos la propiedad que deseamos que se modifique. Colocaremos el selector dentro del DIV
		$valorAAsignar = ""; //indicamos el nuevo valor que este tendrá. Cadena HTML
		
		$valorAAsignar .= "<select name='selCiudades' class='textbox'>";
		$valorAAsignar .= "<option value=''>[Seleccione uno]</option>";
		
		$query_ciudades = $this -> Model_insert -> consultar_municipio_ciudades($idMunicipio);
		
		foreach ($query_ciudades -> result() as $row)
			$valorAAsignar .= "<option value='" . $row -> ciu_ciudades_pk . "'>" . $row -> ciu_nombre . "</option>";
		
		$valorAAsignar .= "</select>";
		
		$respuesta -> Assign($inputDestino, $propiedadInputDestino, $valorAAsignar);
		
		return $respuesta;
	}


     function alertarif($cad1,$cad2){

               $cad = $cad1.$cad2;
               $respuesta = new xajaxResponse();

               $propiedadInputDestino = "innerHTML";
               $inputDestino = "resp";


               $data['consulta_rif']= $this->Model_insert->consulta_rif($cad);



              if ($data['consulta_rif']->num_rows() > 0){

                      $valorAAsignar = '<font color="#FF0000"><BLINK>El R.I.F ya esta registrado en el sistema</BLINK></font>';


               }else{

                      $valorAAsignar ='<input type="submit" name="boton" value="Guardar y Continuar"  />';
                    }

                 $respuesta->Assign($inputDestino, $propiedadInputDestino, $valorAAsignar);
                 return $respuesta;
        }



        function capacidad_financiera($nivelf){

          

                            $call = $this->Model_insert->consulta_cpf($nivelf);
                            //$fila_call = $call->result_array();
                            
                          //  print_r($call);



                    if($call->num_rows() > 0){

                             foreach ($call->result_array() as $row)
                            {
                            $valm = $row['nfs_capital_desde'];

                            $valM = $row['nfs_capital_hasta'];
                            }

                    }else{

                        $valm = '0';
                        $valM = '0';
                          }
                         
           
                            if ($this->cap >= $valm && $this->cap <= $valM){
                                 return TRUE;
                           
                            }
                    else{
                     $this->form_validation->set_message('capacidad_financiera', 'La Capacidad Financiera no concuerda con el Nivel Financiero elegido.');
                            return FALSE;

                    }
            }


}
?>