<?php
/**
 * Programador: Carlos Ramirez
 * Fecha inicio: 10/10/08
 * Fecha final: 11/04/09
 * Controlador de editar Registro de datos generales de la Contratista
 */
class Con_reg_edit_1 extends Controller{
    var $titulo, $encabezado, $campos_lv, $TotalRegistros, $Tit_Tabla, $campo_clave;
	var $cap;
	
	function Con_reg_edit_1(){
		parent :: Controller();
		
		$this -> load -> database();
		$this -> load -> model('Model_insert','',TRUE);
		$this -> load -> library('pagination');
		$this -> load -> library('xajax');
		$this -> load -> library('form_validation');
		$this -> load -> helper(array('form', 'url'));
        $this->load->library('mylib_base');
		
		//declarar en el controller las fuinciones xajas a llamara en el view
		$this -> xajax -> registerFunction(array('obtieneMunicipio', &$this, 'obtieneMunicipio'));
		$this -> xajax -> registerFunction(array('obtieneCiudad', &$this, 'obtieneCiudad'));
		$this -> xajax -> processRequest();
	}
	
	
	// Formulario 1:
	function index(){
        $this->vismenu = $this->load->view('vis_menu','',TRUE);
		$data['valorpk']  = $this->uri -> segment(3);
		$data['xajax_js'] = $this->xajax -> getJavascript(base_url());
		
		$data['query_indice_capital'] = $this -> Model_insert -> indice_capital();
		$data['query_tipo_coop'] = $this -> Model_insert -> tipo_cooperativa();
		$data['query_telef'] = $this -> Model_insert -> numeros_telefonicos_tipo();
		$data['query_contratista_tipo'] = $this -> Model_insert -> contratista_tipo();
		$data['query_estados'] = $this -> Model_insert -> consulta_estados();
		$data['query_tipo_firma'] = $this -> Model_insert -> tipo_tipo_firma();
		$data['query_nivel_financiero'] = $this -> Model_insert -> nivel_financiero();
		$data['consulta_contratista'] = $this -> Model_insert -> consulta_contratista($data['valorpk']);
		
		if ($this -> uri -> segment(3) > 0){
			$fila = $data['consulta_contratista'] -> row();
			
			$data['rif'] = $fila -> con_numero_rif;
			$data['nrnc'] = $fila -> con_numero_rnc;
			$data['dFecMenor'] = $fila -> con_fecha_inscripcion_rnc;
			$data['dFecMayor'] = $fila -> con_fecha_vencimiento_rnc;
			$data['nomraz'] = $fila -> con_nombre;
			$data['dirmail'] = $fila -> con_email;
			$data['codpost'] = $fila -> con_codigo_postal;
			$data['dirfis'] =  $fila -> con_direccion_fiscal;
			$data['siglas'] = $fila -> con_siglas;
			$data['clf'] = $fila -> con_calificacion_financiera;
			$data['select_indice_cap'] = $fila -> ics_indice_capital_social_fk;
			$data['select_nivelf'] = $fila -> nfs_nivel_financiero_snc_fk;
			$data['capf'] = $fila -> con_capacidad_financiera;
			$data['select_tipof'] = $fila -> tpf_tipo_firma_fk;
			$data['select_ticoo'] = $fila -> tpc_tipo_cooperativa_fk;
			$data['objcoop'] = $fila -> con_objeto_cooperativa;
			$data['timcoop'] = $fila -> con_tiempo_cooperativa;
			$data['durcoop'] = $fila -> con_duracion_cooperativa;
			$data['objsoca'] = $fila -> con_objeto_social_cooperativa;
			$data['codpost'] = $fila -> con_codigo_postal;
			
			

			// Actualizar los combos.
			$data['ctp_contratistas_tipo_fk'] = $fila -> ctp_contratistas_tipo_fk;
			
			$data['ciu_ciudades_fk'] = $fila -> ciu_ciudades_fk;
			
			$ciudadTmp = $this -> Model_insert -> consultar_ciudad($fila -> ciu_ciudades_fk);
			$ciudad = $ciudadTmp -> row();
			
			$data['mun_municipio_fk'] = $ciudad -> mun_municipio_fk;
			
			$municipioTmp = $this -> Model_insert -> consultar_municipio2($ciudad -> mun_municipio_fk);
			$municipio = $municipioTmp -> row();
			
			$data['est_estados_fk'] = $municipio -> est_estados_fk;
			
			$data['query_municipios'] = $this -> Model_insert -> consultar_estado_municipios($municipio -> est_estados_fk);
			$data['query_ciudades'] = $this -> Model_insert -> consultar_municipio_ciudades($ciudad -> mun_municipio_fk);
		}
		else{
			$data['valorpk'] = $_POST['valorpk'];
			
			if(isset($_POST['siglas']))
				$data['siglas'] = $_POST['siglas'];
			else
				$data['siglas'] = '';
			
			if(isset($_POST['clf']))
				$data['clf'] = $_POST['clf'];
			else
				$data['clf'] = '';
			
			if(isset($_POST['indice_cap']))
				$data['select_indice_cap'] = $_POST['indice_cap'];
			else
				$data['select_indice_cap'] = '';
			
			if(isset($_POST['nivelf']))
				$data['select_nivelf'] = $_POST['nivelf'];
			else
				$data['select_nivelf'] = '';
			
			if(isset($_POST['tipof']))
				$data['select_tipof'] = $_POST['tipof'];
			else
				$data['select_tipof'] = '';
			
			if(isset($_POST['ticoo']))
				$data['select_ticoo'] = $_POST['ticoo'];
			else
				$data['select_ticoo'] = '';
			
			if(isset($_POST['objcoop']))
				$data['objcoop'] = $_POST['objcoop'];
			else
				$data['objcoop'] = '';
			
			if(isset($_POST['objcoop']))
				$data['objcoop'] = $_POST['objcoop'];
			else
				$data['objcoop'] = '';
			
			if(isset($_POST['timcoop']))
				$data['timcoop'] = $_POST['timcoop'];
			else
				$data['timcoop'] = '';
			
			if(isset($_POST['durcoop']))
				$data['durcoop'] = $_POST['durcoop'];
			else
				$data['durcoop'] = '';
			
			if(isset($_POST['objsoca']))
				$data['objsoca'] = $_POST['objsoca'];
			else
				$data['objsoca'] = '';
			
			if(isset($_POST['codpost']))
				$data['codpost'] = $_POST['codpost'];
			else
				$data['codpost'] = '';
			
			if(isset($_POST['codpost']))
				$data['codpost'] = $_POST['codpost'];
			else
				$data['codpost'] = '';
			
			if(isset($_POST['dirfis']))
				$data['dirfis'] = $_POST['dirfis'];
			else
				$data['dirfis'] = '';

                   if(isset($_POST['capf'])){

            $data['capf'] = $_POST['capf'];
            }
		else{
			$data['capf'] = '';
        }

          $data['tipco'] = $_POST['tipco']; //tipo de contratista

     
			
			// Actualizar los combos.
			$data['ciu_ciudades_fk'] = $_POST['selCiudades'];
			
			$ciudadTmp = $this -> Model_insert -> consultar_ciudad($_POST['selCiudades']);
			$ciudad = $ciudadTmp -> row();
			
			$data['mun_municipio_fk'] = $_POST['menu1'];
			
			$municipioTmp = $this -> Model_insert -> consultar_municipio2($_POST['menu1']);
			$municipio = $municipioTmp -> row();
			
			$data['est_estados_fk'] = $_POST['selEstados'];
			
			$data['query_municipios'] = $this -> Model_insert -> consultar_estado_municipios($_POST['selEstados']);
			$data['query_ciudades'] = $this -> Model_insert -> consultar_municipio_ciudades($_POST['menu1']);
		}
		
		/*
		$data['select_selEstados']         = '';
		$data['select_selMunicipio']       = '';
		$data['select_selCiudades']        = '';
		*/
	   // $this->cap = $data['capf'];
		$this -> form_validation -> set_rules('rif','R.I.F','required');
		$this -> form_validation -> set_rules('nrnc','Número RNC','required');
		$this -> form_validation -> set_rules('nomraz','Razón Social','required');
		$this -> form_validation -> set_rules('dFecMenor','Fecha Inicio RNC','required');
		$this -> form_validation -> set_rules('dFecMayor','Fecha Final RNC','required');
		//$this -> form_validation -> set_rules('selMunicipio','Municipio','required');
		$this -> form_validation -> set_rules('selCiudades','Ciudad','required');
		$this -> form_validation -> set_rules('capf','Capacidad Financiera','required');//
		$this -> form_validation -> set_rules('dirmail','email','valid_email|required');
        $this -> form_validation -> set_rules('nivelf','Nivel Financiero','required|callback_capacidad_financiera');
        $this -> form_validation -> set_rules('indice_cap','indice capital','required');
        $this -> form_validation -> set_rules('tipof','Tipo de Firma','required');
        $this -> form_validation -> set_rules('tipco','Tipo de Contratista','required');
        $this -> form_validation -> set_rules('dirfis','Dirección','required');
        $this -> form_validation -> set_rules('codpost','Código Postal','required');

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



		if($this -> form_validation->run() == FALSE)
			$this -> load -> view('Registro/regcontratista_edit_1', $data);
		else{
			$result = $this -> Model_insert -> editar_contratista('contratistas', $data['valorpk']);
			//$row = $result -> row_array();
			$result_2 = $this -> Model_insert -> eliminar_telefono('numeros_telefonicos', $data['valorpk']);
			$result_3 = $this -> Model_insert -> modificar_numeros_telefonos('numeros_telefonicos', $data['valorpk']);
			
			redirect('con_consult_regco');
		}
	}


	function obtieneMunicipio($idEstado){
		/*
		$respuesta = new xajaxResponse(); //Creamos el objeto xajax
		$inputDestino = "divMunicipio"; //indicamos el ID del tag HTML de destino. en este caso el DIV que contiene el selector
		$propiedadInputDestino = "innerHTML"; //indicamos la propiedad que deseamos que se modifique. Colocaremos el selector dentro del DIV
		$valorAAsignar = ""; //indicamos el nuevo valor que este tendrá. Cadena HTML
		
		
		$query_municipio = $this -> Model_insert -> consultar_municipio_combo($idmunicipio);
		$valorAAsignar = "<select name='selMunicipio' class='textbox' onChange='xajax_obtieneCiudad(this.value);'><option value='0'>[Seleccione]</option>";
		
		foreach($query_municipio->result() as $row2)
			$valorAAsignar .= "<option value='".$row2->mun_municipio_pk."'>".$row2->mun_nombre."</option>";
		
		$valorAAsignar .= "</select>";
		
		$respuesta -> Assign($inputDestino, $propiedadInputDestino, $valorAAsignar);
		
		return $respuesta;
		*/
		
		
		
		
		$respuesta = new xajaxResponse(); //Creamos el objeto xajax
		$inputDestino = "divMunicipio"; //indicamos el ID del tag HTML de destino. en este caso el DIV que contiene el selector
		$propiedadInputDestino = "innerHTML"; //indicamos la propiedad que deseamos que se modifique. Colocaremos el selector dentro del DIV
		$valorAAsignar = ""; //indicamos el nuevo valor que este tendrá. Cadena HTML
		
		
		$query_municipio = $this -> Model_insert -> consultar_municipio_combo($idEstado);
		$valorAAsignar .= "<select name='selMunicipio' class='textbox' onChange='xajax_obtieneCiudad(this.value);'>";
		$valorAAsignar .= "<option value='0'>[Seleccione]</option>";
		
		foreach($query_municipio -> result() as $row)
			$valorAAsignar .= "<option value='" . $row -> mun_municipio_pk . "'>" . $row -> mun_nombre . "</option>";
		
		$valorAAsignar .= "</select>";
		
		$respuesta -> Assign($inputDestino, $propiedadInputDestino, $valorAAsignar);
		
		return $respuesta;
	}
	
	
	function obtieneCiudad($idMunicipio){
		/*
		$respuesta = new xajaxResponse(); //Creamos el objeto xajax
		$inputDestino = "divCiudad"; //indicamos el ID del tag HTML de destino. en este caso el DIV que contiene el selector
		$propiedadInputDestino = "innerHTML"; //indicamos la propiedad que deseamos que se modifique. Colocaremos el selector dentro del DIV
		$valorAAsignar = ""; //indicamos el nuevo valor que este tendrá. Cadena HTML
		
		
		$query_ciudad =  $this-> Model_insert -> consultar_ciudad($idciudad);
		$valorAAsignar = "<select name='selCiudades' class='textbox'><option value='0'>[Seleccione]</option>";
		
		foreach ($query_ciudad -> result() as $row2)
			$valorAAsignar .= "<option value='" . $row2 -> ciu_ciudades_pk . "'>" . $row2 -> ciu_nombre . "</option>";
		
		$valorAAsignar .= "</select>";
		
		$respuesta -> Assign($inputDestino, $propiedadInputDestino, $valorAAsignar);
		
		return $respuesta;
		*/
		
		
		
		
		$respuesta = new xajaxResponse(); //Creamos el objeto xajax
		$inputDestino = "divCiudad"; //indicamos el ID del tag HTML de destino. en este caso el DIV que contiene el selector
		$propiedadInputDestino = "innerHTML"; //indicamos la propiedad que deseamos que se modifique. Colocaremos el selector dentro del DIV
		$valorAAsignar = ""; //indicamos el nuevo valor que este tendrá. Cadena HTML
		
		$valorAAsignar .= "<select name='selCiudades' class='textbox'>";
		$valorAAsignar .= "<option value='0'>[Seleccione uno]</option>";
		
		$query_ciudades = $this -> Model_insert -> consultar_municipio_ciudades($idMunicipio);
		
		foreach ($query_ciudades -> result() as $row)
			$valorAAsignar .= "<option value='" . $row -> ciu_ciudades_pk . "'>" . $row -> ciu_nombre . "</option>";
		
		$valorAAsignar .= "</select>";
		
		$respuesta -> Assign($inputDestino, $propiedadInputDestino, $valorAAsignar);
		
		return $respuesta;
	}



     function capacidad_financiera($nivelf){

                    

                            $call = $this->Model_insert->consulta_cpf($nivelf);
                            //$fila_call = $call->result_array();

                        // print_r($call);

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