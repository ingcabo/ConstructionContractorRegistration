<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<?php $this->mod_usuario->en_session(); ?>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>Documento sin t&iacute;tulo</title>
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/css/mainstyle2.css" type="text/css" />

<!-- Inicio de: JS y CSS para el DataPick. -->
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/scripts.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar-es.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar-setup.js"></script>

<link media="screen" href="<?php echo base_url(); ?>system/application/js/calendario/styles/calendar-blue.css" rel="stylesheet" type="text/css" title="win2k-cold-1">
<link media="print" href="<?php echo base_url(); ?>system/application/js/calendario/styles/print.css" rel="stylesheet" type="text/css" title="win2k-cold-1">
<!--    Fin de: JS y CSS para el DataPick. -->

<script type="text/javascript" src="<?php  echo base_url(); ?>system/application/js/general.js"></script>
<script type="text/javascript" src="<?=base_url();?>system/application/views/js_menu/stmenu.js"></script>

</script>
<!-- Script para adaptar footer según resolución -->
<SCRIPT LANGUAGE="JavaScript">

//  End -->

 /* Da formato a un número para su visualización
 *
 * numero (Number o String) - Número que se mostrará
 * decimales (Number, opcional) - Nº de decimales (por defecto, auto)
 * separador_decimal (String, opcional) - Separador decimal (por defecto, coma)
 * separador_miles (String, opcional) - Separador de miles (por defecto, ninguno)
 */
function formato_numero(numero, decimales, separador_decimal, separador_miles){ // v2007-08-06
	numero=parseFloat(numero);
	if(isNaN(numero)){
		return "";
	}

	if(decimales!==undefined){
		// Redondeamos
		numero=numero.toFixed(decimales);
	}

	// Convertimos el punto en separador_decimal
	numero=numero.toString().replace(".", separador_decimal!==undefined ? separador_decimal : ",");

	if(separador_miles){
		// Añadimos los separadores de miles
		var miles=new RegExp("(-?[0-9]+)([0-9]{3})");
		while(miles.test(numero)) {
			numero=numero.replace(miles, "$1" + separador_miles + "$2");
		}
	}

	return numero;
}






</script>



<?php echo  $xajax_js; ?>
</head>

<body bgcolor="#FFFFFF" text="#000000" link="#0066FF" vlink="#9933FF" alink="#FF3333">
<div> <?php echo $this->vismenu; ?></div>
<!-- FIN DE COPIA !-->


<div class="bodywrap">
  <div class="bodyinfo"> 
  
<!-- Calendario -->

<!-- Calendario -->
  
  <?php $atributos = array('name' => 'form')?>
    <?php echo form_open('con_reg_1',$atributos ); ?>
<table width="800" border="0" cellspacing="0" cellpadding="0" style="text-align:left">
      <tr>
        <td colspan="3" align="center"><label>
         <strong>Registro de Contratistas</strong>
      
  
        </label></td>
      </tr>
      <tr>
        <td colspan="3" align="center">&nbsp;</td>
      </tr>
      <tr>
	   <?php 
		                        $cadenafecha = "%d-%m-%Y";
                                $tiempo = time();
                                $factual = mdate($cadenafecha, $tiempo); 
                                 
          ?>
        <td colspan="3"> <input type="hidden" name="factual" id="factual" maxlength="10" size="10" value="<?php echo $factual; ?>"/></td>
      </tr>
      <tr>
        <td width="219" class="bgtitle"><lable>Datos Generales  </lable></td>
        <td width="260" class="bgtitle"><font color="#FF0000">
        
           
        </font></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
  <td>&nbsp;</td>
      <td >&nbsp;</td>
      <td >&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><label><span class="fontnormal">R.I.F: </span> </label></td>
    <td height="30">
	
	<select name="persona" onchange=" xajax_alertarif(this.value,rif.value);" >
<option value="E" <?= $this->form_validation->set_select('persona', 'E'); ?>>E</option>
<option value="G" <?= $this->form_validation->set_select('persona', 'G'); ?>>G</option>
<option value="V" <?= $this->form_validation->set_select('persona', 'V'); ?>>V</option>
<option value="J" <?= $this->form_validation->set_select('persona', 'J'); ?>>J</option>
</select>
<input type="text" name="rif"  id="rif" maxlength="13"  size="13" value="<?php echo set_value('rif',isset($rif)?$rif:'');?>" onkeypress="return SoloNumero(event)" onblur=" xajax_alertarif(persona.value,this.value);" />    </td>

    <td height="30"></td>
  </tr>
  <tr>
    <td height="30"><label> <span class="fontnormal"> R.N.C: </span></label>    </td>
    <td height="30"><input type="text" name="nrnc" id="nrnc" maxlength="20" value="<?php echo set_value('nrnc',isset($nrnc)?$nrnc:''); ?>"  onkeypress="return SoloNumero(event)" />
        <font color="#FF0000">&nbsp; </font></td>
    <td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('nrnc'); ?> </font></span></td>
  </tr>
 
  <tr>
    <td height="30"><label><span class="fontnormal">Fecha Inscripción: </span></label></td>
    <td><input type="text" name="dFecMenor" id="dFecMenor" maxlength="10" readonly="readonly"  size="10" value="<?php echo set_value('dFecMenor',isset($dFecMenor)?$dFecMenor:'');?>" />
        <img name="dFecMenorCalendario" id="dFecMenorCalendario" src="<?php echo base_url(); ?>system/application/js/calendario/images/calendar.gif" width="16" height="16" />
        <!-- Inicio de: Iniciar DataPick. -->
        <script type="text/javascript">
		var campoId = 'dFecMenor';
		var imagenId = 'dFecMenorCalendario';
		
		
		iniciarCalendario(campoId, imagenId,'%d-%m-%Y',false);
		</script>
        <!--    Fin de: Iniciar DataPick. -->
        <!--
		<a href="javascript:NewCal('dFecMenor','mmddyyyy')" id="lin" ><img src="<?php  //echo base_url(); ?>system/application/imagenes/cal.gif" name="dtpFechaParalizacion" width="24" height="24" border="0" id="dtpFechaParalizacion" /></a> <span class="fontnormal"> (día/mes/año)</span>
		-->    </td>
    <td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('dFecMenor'); ?> </font></span></td>
  </tr>
  <tr>
    <td height="30"><span class="fontnormal">Fecha Vencimiento: </span></td>
    <td><input type="text" name="dFecMayor"  id="dFecMayor" maxlength="10" size="10" readonly="readonly" value="<?php echo set_value('dFecMayor',isset($dFecMayor)?$dFecMayor:'');?>" />
        <img name="dFecdFecMayorCalendario" id="dFecdFecMayorCalendario" src="<?php echo base_url(); ?>system/application/js/calendario/images/calendar.gif" width="16" height="16" />
        <script type="text/javascript">
		var campoId = 'dFecMayor';
		var imagenId = 'dFecdFecMayorCalendario';


		iniciarCalendario(campoId, imagenId,'%d-%m-%Y',false);
		</script>    </td>
    <td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('dFecMayor'); ?> </font></span></td>
  </tr>
  <td height="30"><lable> <span class="fontnormal">Nombre o Razón Social:</span></lable>  </td>
      <td><input type="text" name="nomraz"  id= "nomraz"   size="30"  maxlength="200"  value="<?php echo set_value('nomraz',isset($nomraz)?utf8_decode($nomraz):'');?>" onfocus="return validaFecha(this.form );"/> <!-- onKeyUp="Convertir(this.form.nomraz)"--> </td>
    <td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('nomraz'); ?> </font></span></td>
  <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
  <tr>
    <td height="30"><label><span class="fontnormal">Siglas: </span></label></td>
    <td><input type="text" name="siglas" id="siglas" onKeyUp="upperCase(this.value)" value= "<?php echo $siglas; ?>" maxlength="40" onblur= "upperCase(this.id)" />
        <span class="fontnormal"><font color="#FF0000"> </font></span></td><td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('siglas'); ?> </font></span></td>
  </tr>
  <!-- <tr>
    <td height="30"><label> <span class="fontnormal">Objeto de la Contratista:</span></label></td>
    <td height="30"><input type="text" name="objcoop" id="objcoop" maxlength="15" onblur="upperCase(this.id)" /></td>    
    <td>&nbsp;</td>
  </tr> !-->
  <tr>
    <td height="30"><label> <span class="fontnormal">Calificación Financiera:</span></label></td>
    <td><input type="text" name="clf" id="clf" size="5" maxlength="5" onKeyUp="upperCase(this.value)" value="<?php echo $clf; ?>" onblur= "upperCase(this.id)" />    </td>
    <td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('clf'); ?> </font></span></td>
  </tr>
  <tr>
  <td>
  </td>
  <td>
  </td>
  <td>
  </td>
  </tr>
  <tr>
    <td height="30"><label><span class="fontnormal">Capacidad Financiera:</span></label></td> <td>
<input type="text" name="capf"  maxlength="20" zise="15"  style="text-align:right;"  onblur="puntitos(this,this.value.charAt(this.value.length-1),'2')"  value="<?php echo set_value('capf',isset($capf)?number_format($capf, 2, ",","."):'');?>"  onkeypress="return SoloNumero(event)" />    </td>
    <td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('capf'); ?> </font></span></td>
  </tr>
  <tr>
    <td><label><span class="fontnormal">Indice Capital Social: </span></label></td>
    <td><select name="indice_cap" value="<?php echo $indice_cap; ?>" >
      <option value="<?php echo ""; ?>">[Seleccione uno]</option>
      <?php foreach ($query_indice_capital->result() as $row): ?>
      <?php if($row->ics_indice_capital_social_pk == $select_indice_cap){ ?>
      <option value="<?php echo $row->ics_indice_capital_social_pk; ?>" <?php $this->form_validation->set_select('indice_cap', $row->ics_indice_capital_social_pk); ?> selected="selected"><?php echo $row->descripcion_indice; ?></option>
      <?php   }else{ ?>
      <option value="<?php echo $row->ics_indice_capital_social_pk; ?>" <?php $this->form_validation->set_select('indice_cap', $row->ics_indice_capital_social_pk); ?> ><?php echo $row->descripcion_indice; ?></option>
      <?php  }  ?>
      <?php endforeach; ?>
    </select>    </td>
    <td><span class="fontnormal"><font color="#FF0000"><?php echo form_error('indice_cap'); ?></font></span></td>
  </tr>
  <tr>
    <td height="30"><label><span class="fontnormal"> Nivel Financiero:</span></label>    </td>
    <td height="30"><select name="nivelf" value="<?php echo $nivelf;?>" >
      <option value="<?php echo " "; ?>">[Seleccione uno]</option>
      <?php foreach ($query_nivel_financiero->result() as $row): ?>
      <?php if($row->nfs_nivel_financiero_snc_pk == $select_nivelf){ ?>
      <option value="<?php echo $row->nfs_nivel_financiero_snc_pk; ?>" selected="selected"><?php echo $row->descripcion_nf; ?></option>
      <?php   }else{ ?>
      <option value="<?php echo $row->nfs_nivel_financiero_snc_pk; ?>" ><?php echo $row->descripcion_nf; ?></option>
      <?php  }  ?>
      <?php endforeach; ?>
    </select>    </td>
    <td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('nivelf'); ?> </font></span></td>
  </tr>
  <tr>
    <td height="30"><label><span class="fontnormal">Tipo de Firma:</span></label></td>
    <td><select name="tipof" value="<?php echo $tipof;?>" >
      <option value="<?php echo ""; ?>">[Seleccione uno]</option>
      <?php foreach ($query_tipo_firma->result() as $row): ?>
      <?php if($row->tpf_tipo_firma_pk == $select_tipof){ ?>
      <option value="<?php echo $row->tpf_tipo_firma_pk; ?>" selected="selected"><?php echo $row->tpf_descripcion; ?></option>
      <?php   }else{ ?>
      <option value="<?php echo $row->tpf_tipo_firma_pk; ?>" ><?php echo $row->tpf_descripcion; ?></option>
      <?php  }  ?>
      <?php endforeach; ?>
    </select>    </td>
    <td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('tipof'); ?> </font></span></td>
  </tr>
  <tr>
    <td height="30"><span class="fontnormal">Tipo de Contratista: </span></td>
	<td height="30">
		<select name="tipco" id="tipco" size="1" style="width:130px"  onchange="div_mostrar();" >
			<option value="<?php echo ""; ?>">[Seleccione uno]</option>
			<?php foreach($query_contratista_tipo -> result() as $row): ?>
			<?php if($row -> ctp_contratistas_tipo_pk == $tipco): ?>
			<option value="<?php echo $row -> ctp_contratistas_tipo_pk; ?>" selected="selected"><?php echo $row -> ctp_descripcion; ?></option>
			<?php else: ?>
			<option value="<?php echo $row -> ctp_contratistas_tipo_pk; ?>" ><?php echo $row -> ctp_descripcion; ?></option>
			<?php endif; ?>
			<?php endforeach; ?>
		</select>	</td>
    <td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('tipco'); ?> </font></span></td>
  </tr>
  <!--espacio-->

  <!--espacio-->
    </table>
  
      
<!--    Tabla hidden -->  
    <div id="contenido_a_mostrar" style="display: none;"> 
    <table width="800px;" border="0" cellspacing="0" cellpadding="0" class="bgtitle">
  <tr>
    <th scope="col">Datos de Cooperativa </th>
  </tr>
	</table>
      
      <table  width="800" height="51"  style="text-align:left" class="bgtabledown">
        <tr><td></td></tr>
		<tr><td height="20"></td><td></td></tr>
            <tr> 
              <td width="255" height="30"><label>Tipo de Cooperativa:</label> </td>
              <td width="727" height="30">
	<select name="ticoo" value="<?php echo $ticoo;?>" >
               <option value="<?php echo 0; ?>">[Seleccione uno]</option>
			   
			    <?php foreach ($query_tipo_coop->result() as $row): ?>
			            	   <?php if($row->tpc_tipo_cooperativa_pk == $select_ticoo){ ?>
                              <option value="<?php echo $row->tpc_tipo_cooperativa_pk; ?>" selected="selected"><?php echo $row->tpc_nombre; ?></option>
			           <?php   }else{ ?>
			        		 <option value="<?php echo $row->tpc_tipo_cooperativa_pk; ?>" ><?php echo $row->tpc_nombre; ?></option>	
			  	             
							 <?php  }  ?> 
				       
              <?php endforeach; ?>
		    </select>
			  </td>
            </tr>
            
            <tr> 
              <td height="30"><label>Tiempo de la Cooperativa:</label></td>
              <td><input type="text" name="timcoop" maxlength="15" onkeypress="return SoloNumero(event)"  value="<?php echo $timcoop; ?>"/><label>Aproximado en Días</label></td>
            </tr>
            <tr> 
              <td height="30"><label>Duración de la Cooperativa:</label></td>
              <td><input type="text" name="durcoop" maxlength="15"  onkeypress="return SoloNumero(event)" value="<?php echo $durcoop; ?>"/> <label>Aproximado en Días</label></td>
            </tr>
			<tr>
          <td height="30">Objeto Social de la Cooperativa:</td>
          <td><input type="text" name="objsoca" maxlength="100" value="<?php echo $objsoca; ?>"/></td></tr>
			<tr><td><br></td></tr>
      </table>
	 
    </div>
			<!--    Tabla hidden --> 
			<br />  
			
    <table width="388" height="26">
      <tr> 
        <td width="316" class="bgtitle"><label><b>Números Contacto</b></label></td>
      <tr><td height="20"></td><td width="71"></td>
      </tr>
        </tr>
		 <?php     
		      $a = array();
		     $b = array();
				?>
	<?php     
			if ($this->uri->segment(4) <= 0){
			}else{
			 $a = array();
		     $b = array();
			 $consulta = $this->db->query('select * from numeros_telefonicos where con_contratistas_fk ='.$valorpk.' and tel_activo = true');
			        foreach ($consulta->result() as $row_2){
				        $a[$row_2->ntt_numeros_telefonicos_tipo_fk] = $row_2->tel_codigo_area;
                        $b[$row_2->ntt_numeros_telefonicos_tipo_fk] = $row_2->tel_numero;
	    	       }
			}
		      ?>  
		
		  <?php foreach ($query_telef->result() as $row2): ?>
           <?php echo "<tr>"; ?>
		   <?php  echo "<td>"; ?> <?php echo $row2->ntt_descripcion.":"; ?>  <?php  echo "</td>"; ?>    
		   <?php  echo "<td>"; ?> <input type="text" name="pre_<?php echo $row2->ntt_numeros_telefonicos_tipo_pk; ?>"  value="<?php if(isset($a[$row2->ntt_numeros_telefonicos_tipo_pk])){ echo $a[$row2->ntt_numeros_telefonicos_tipo_pk];}elseif(isset($_POST["pre_$row2->ntt_numeros_telefonicos_tipo_pk"])){ echo $_POST["pre_$row2->ntt_numeros_telefonicos_tipo_pk"];}else {echo '';} ?>" maxlength="5"  size="4" onkeypress="return SoloNumero(event)"/><?php  echo "</td>"; ?>
		   <?php  echo "<td>"; ?> <input type="text" name="num_<?php echo $row2->ntt_numeros_telefonicos_tipo_pk; ?>"  value="<?php if(isset($b[$row2->ntt_numeros_telefonicos_tipo_pk])){ echo $b[$row2->ntt_numeros_telefonicos_tipo_pk];}elseif(isset($_POST["num_$row2->ntt_numeros_telefonicos_tipo_pk"])){ echo $_POST["num_$row2->ntt_numeros_telefonicos_tipo_pk"];}else {echo '';} ?>" maxlength="15"  size="10" onkeypress="return SoloNumero(event)"/><?php  echo "</td>"; ?>
		   <?php echo "</tr>"; ?>
           <?php endforeach; ?>  
		   <tr><td><br></td> <td></td></tr>
	</table>     
      
    <table width="88%" border="0" cellspacing="0" cellpadding="0" height="458" style="clear:both">
      <tr>
        <td width="30%" class="bgtitle"><label><b>Dirección Física</b></label></td>
      </tr>
      <tr>
        <td height="20"></td>
      </tr>
  <td height="30"><label>Estado:</label></td>
      <td width="38%" >
		<div class="div_texbox" id="divEstados">
			
			<select name="selEstados" class="textbox" onchange="xajax_obtieneMunicipio(this.value);" >
				<option value="0">[Seleccione uno]</option>
				<?php if(isset($query_estados)): ?>
				<?php foreach($query_estados -> result() as $row): ?>
				<?php if($row -> est_estados_pk == $est_estados_fk): ?>
				<option value="<?php echo $row -> est_estados_pk; ?>" selected="selected"><?php echo $row -> est_nombre; ?></option>
				<?php else: ?>
				<option value="<?php echo $row -> est_estados_pk; ?>" ><?php echo $row -> est_nombre; ?></option>
				<?php endif; ?>
				<?php endforeach; ?>
				<?php endif; ?>
			</select>
		</div>
		<td>
		</td>
	  </td>
  <tr>
    <td height="30">Municipio:</td>
    <td>
		<div class="div_texbox" id="divMunicipio">
			<select name="menu1" class="textbox" onChange='xajax_obtieneCiudad(this.value);'>
				<option value="0">[Seleccione]</option>
				<?php if(isset($query_municipios)): ?>
				<?php foreach($query_municipios -> result() as $row): ?>
				<?php if($row -> mun_municipio_pk == $mun_municipio_fk): ?>
				<option value="<?php echo $row -> mun_municipio_pk; ?>" selected="selected"><?php echo $row -> mun_nombre; ?></option>
				<?php else: ?>
				<option value="<?php echo $row -> mun_municipio_pk; ?>" ><?php echo $row -> mun_nombre; ?></option>
				<?php endif; ?>
				<?php endforeach; ?>
				<?php endif; ?>
			</select>
		</div>
	</td>
    <td><span class="fontnormal"><font color="#FF0000"><?php echo form_error('menu1'); ?></font></span></td>
  </tr>
  <tr>
    <td height="30">Ciudad:</td>
    <td>
		<div class="div_texbox" id="divCiudad">
			<!--
			<select name="menu2" class="textbox" onchange=""  >
				<option value="0">[Seleccione]</option>
			</select>
			-->
			<select name="selCiudades" class="textbox">
				<option value="<?php echo ""; ?>">[Seleccione uno]</option>
				<?php if(isset($query_ciudades)): ?>
				<?php foreach ($query_ciudades -> result() as $row): ?>
				<?php if($row -> ciu_ciudades_pk == '' . $ciu_ciudades_fk): ?>
				<option value="<?php echo $row -> ciu_ciudades_pk; ?>" selected="selected"><?php echo $row -> ciu_nombre; ?></option>
				<?php else: ?>
				<option value="<?php echo $row -> ciu_ciudades_pk; ?>" ><?php echo $row -> ciu_nombre; ?></option>
				<?php endif; ?>
				<?php endforeach; ?>
				<?php endif; ?>
			</select>
		</div>
	</td>
    <td><span class="fontnormal"><font color="#FF0000"><?php echo form_error('selCiudades'); ?></font></span></td>
  </tr>
  <tr>
    <td height="30"></td>
    <td></td>
  </tr>
  <tr>
    <td height="30"><label>Dirección de Correo: </label>    </td>
    <td><input type="text" name="dirmail" size="25" maxlength="80"  value="<?php echo set_value('dirmail',isset($dirmail)?$dirmail:'');?>" />    </td>
    <td width="32%"><font color="#FF0000"><?php echo form_error('dirmail'); ?></font></td>
  </tr>
  <tr>
    <td height="30"><label>Código Postal: </label>    </td>
    <td><input type="text" name="codpost" maxlength="12" size="8" value="<?php echo $codpost; ?>" onkeypress="return SoloNumero(event)" />    </td>
 <td><font color="#FF0000"><?php echo form_error('codpost'); ?></font></td>
  </tr>
  <tr>
    <td height="30"><label>Dirección Actual: </label></td>
    <td></td><td><font color="#FF0000"><?php echo form_error('dirfis'); ?></font></td>
  </tr>
  <tr>
    <td colspan="3"><textarea rows="4" cols="60" name="dirfis"><?php echo $dirfis; ?></textarea></td>
  </tr>
  <tr>
    <td colspan="3"><br />
        <br /></td>
  </tr>
  <tr>
    <td colspan="3" align="center"><p>	 <div id="resp"><font color="#0000FF"><strong>Debe Validar El campo R.I.F.</strong></font> </div>
   
    </p></td>
  </tr>
  <tr>
    <td></td>
  </tr>
  <tr>
    <td></td>
  </tr>
    </table>
  <?php echo form_close(); ?>    
  </div>
<div class="bgfooter"> <div class="footerimage"> </div></div>


</div>
<script type="text/javascript">
<!--
<!--
window.onerror=function(m,u,l)
{
	window.status = "Java Script Error: "+m;
	return true;
}

function div_mostrar(){


tipco=document.getElementById('tipco')
div= document.getElementById('contenido_a_mostrar')

if (tipco.value == '10' || tipco.value == 10)
{

div.style.display = ''
} 
else
{
div.style.display = 'none'
}

}

</script>

<script type="text/javascript">
div_mostrar();
</script> 

</body>
</html>