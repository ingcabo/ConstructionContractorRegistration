<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- INICIO DE COPIA !-->


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/views/select_dependientes.js"></script>


<?php $this->mod_usuario->en_session(); ?>
<?php echo  $xajax_js; ?>

		  
		  
		  

</head>

<body bgcolor="#FFFFFF" text="#000000" link="#0066FF" vlink="#9933FF" alink="#FF3333">
<div>
  <!-- $this->vismenu  !-->
  
  <?php echo $this->vismenu; ?>
  
  <!-- FIN DE Menu !-->
</div>



<div class="bodywrap">
  <div class="bodyinfo"> 
  
<!-- Calendario -->

<!-- Calendario -->
  
  
    <?php echo form_open('con_reg_1'); ?>
	
    <table width="800px" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th width="989" scope="col"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="text-align:left">
	<tr><td></td><td><label>Registro de Contratistas</label></td><td></td></tr>
      <tr>
        <td><br /></td>
      </tr>
      <tr>
        <td width="219" class="bgtitle"><lable>Datos Generales </lable></td>
        <td width="260" class="bgtitle"><font color="#FF0000">
          <?php //echo validation_errors(); ?>
		  
		   <?php 
		                        $cadenafecha = "%d-%m-%Y";
                                $tiempo = time();
                                $factual = mdate($cadenafecha, $tiempo); 
								
								
                                 
          ?>
		  <input type="hidden" name="factual" id="factual" maxlength="10" size="10" value="<?php echo $factual; ?>"/> 
        </font></td>
      </tr>
      <tr>
        <td></td>
      </tr>
  <td width="219">&nbsp;</td>
      <td width="260">&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><label><span class="fontnormal">R.I.F: </span> </label></td>
    <td height="30"><select name="persona" class="textbox" onchange="">
      <option value="J">J</option>
      <option value="G">G</option>
      <option value="V">V</option>
      <option value="E">E</option>
    </select>
        <input type="text" name="rif"  id="rif" maxlength="13"  size="13" value="<?php echo set_value('rif');?>" onkeypress="return SoloNumero(event)" />    </td>
    <td width="312"><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('rif'); ?> </font></span></td>
  </tr>
  <tr>
    <td height="30"><label> <span class="fontnormal"> R.N.C: </span></label>    </td>
    <td height="30"><input type="text" name="nrnc" id="nrnc" maxlength="20" value="<?php echo set_value('nrnc'); ?>"  onkeypress="return SoloNumero(event)" />
        <font color="#FF0000">&nbsp; </font></td>
    <td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('nrnc'); ?> </font></span></td>
  </tr>
  <tr>
    <td height="30"><label><span class="fontnormal">Fecha Inscripción: </span></label></td>
    <td>
		<input type="text" name="dFecMenor" id="dFecMenor" maxlength="10" readonly="readonly"  size="10" value="<?php echo set_value('dFecMenor');?>" />
      	<img name="dFecMenorCalendario" id="dFecMenorCalendario" src="<?php echo base_url(); ?>system/application/js/calendario/images/calendar.gif" width="16" height="16">
		<!-- Inicio de: Iniciar DataPick. -->
		<script type="text/javascript">
		var campoId = 'dFecMenor';
		var imagenId = 'dFecMenorCalendario';
		
		
		iniciarCalendario(campoId, imagenId,'%d/%m/%Y',false);
		</script>
		<!--    Fin de: Iniciar DataPick. -->
		<!--
		<a href="javascript:NewCal('dFecMenor','mmddyyyy')" id="lin" ><img src="<?php  //echo base_url(); ?>system/application/imagenes/cal.gif" name="dtpFechaParalizacion" width="24" height="24" border="0" id="dtpFechaParalizacion" /></a> <span class="fontnormal"> (día/mes/año)</span>
		-->
	</td>
    <td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('dFecMenor'); ?> </font></span></td>
  </tr>
  <tr>
    <td height="30"><span class="fontnormal">Fecha Vencimiento: </span></td>
    <td><input type="text" name="dFecMayor"  id="dFecMayor" maxlength="10" size="10" readonly="readonly" value="<?php echo set_value('dFecMayor');?>" />
        <img name="dFecdFecMayorCalendario" id="dFecdFecMayorCalendario" src="<?php echo base_url(); ?>system/application/js/calendario/images/calendar.gif" width="16" height="16">

        <script type="text/javascript">
		var campoId = 'dFecMayor';
		var imagenId = 'dFecdFecMayorCalendario';


		iniciarCalendario(campoId, imagenId,'%d/%m/%Y',false);
		</script>


        </td>
    <td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('dFecMayor'); ?> </font></span></td>
  </tr>
  <td height="30"><lable> <span class="fontnormal">Nombre o Razón Social:</span></lable>  </td>
      <td><input type="text" name="nomraz"  id= "nomraz"   size="30"  maxlength="200" onblur= "cambiar(this)"  value="<?php echo set_value('nomraz');?>" onfocus="return validaFecha(this.form );"/></td>
    <td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('nomraz'); ?> </font></span></td>
  <tr>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td height="30"><label><span class="fontnormal">Siglas: </span></label></td>
    <td colspan="2"><input type="text" name="siglas" id="siglas"  maxlength="40" value="<?php echo $siglas; ?>" onblur= "upperCase(this.id)" />
        <span class="fontnormal"><font color="#FF0000"> </font></span></td>
  </tr>
  <tr>
    <td height="30"><label> <span class="fontnormal">Calificación Financiera:</span></label></td>
    <td>
	
		<input type="text" name="clf" id="clf"  maxlength="5" valor= "<?php  echo $clf; ?>" onblur= "upperCase(this.id)" />
	
	
	</td>
    <td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('clf'); ?> </font></span></td>
  </tr>
  <tr>
    <td height="30"><label><span class="fontnormal">Capacidad Financiera:</span></label></td>
    <td><input type="text" name="capf"  id="capf" maxlength="14" zise="5" onblur= "upperCase(this.id)" value="<?php echo set_value('capf');?>" onkeypress="return SoloNumero(event)" />    </td>
    <td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('capf'); ?> </font></span></td>
  </tr>
  <tr>
  <td><label><span class="fontnormal">Indice Capital Social: </span></label></td>
  <td>
  
  
  
  
  <select name="indice_cap" value="<?php echo $indice_cap;?>" >
               <option value="<?php echo 0; ?>">[Seleccione uno]</option>
			   
			    <?php foreach ($query_indice_capital->result() as $row): ?>
			            	   <?php if($row->ics_indice_capital_social_pk == $select_indice_cap){ ?>
                                <option value="<?php echo $row->ics_indice_capital_social_pk; ?>" selected="selected"><?php echo $row->descripcion_indice; ?></option>
			           <?php   }else{ ?>
			        			      <option value="<?php echo $row->ics_indice_capital_social_pk; ?>" ><?php echo $row->descripcion_indice; ?></option>	
			  	             
							 <?php  }  ?> 
				       
              <?php endforeach; ?>
        
		    </select>
  
  
  </td>
  <td>&nbsp;</td>
  
  </tr>
  <tr>
    <td height="30"><label><span class="fontnormal"> Nivel Financiero:</span></label>    </td>
    <td height="30">
	
	
	
	
	<select name="nivelf" value="<?php echo $nivelf;?>" >
               <option value="<?php echo 0; ?>">[Seleccione uno]</option>
			   
			    <?php foreach ($query_nivel_financiero->result() as $row): ?>
			            	   <?php if($row->nfs_nivel_financiero_snc_pk == $select_nivelf){ ?>
                                <option value="<?php echo $row->nfs_nivel_financiero_snc_pk; ?>" selected="selected"><?php echo $row->descripcion_nf; ?></option>
			           <?php   }else{ ?>
			        			      <option value="<?php echo $row->nfs_nivel_financiero_snc_pk; ?>" ><?php echo $row->descripcion_nf; ?></option>	
			  	             
							 <?php  }  ?> 
				       
              <?php endforeach; ?>
        
		    </select>
	
	
		
	
	
	</td>
    <td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('nivelf'); ?> </font></span></td>
  </tr>
  <tr>
    <td height="30"><label><span class="fontnormal">Tipo de Firma:</span></label></td>
    <td>
	
	<select name="tipof" value="<?php echo $tipof;?>" >
               <option value="<?php echo 0; ?>">[Seleccione uno]</option>
			   
			    <?php foreach ($query_tipo_firma->result() as $row): ?>
			            	   <?php if($row->tpf_tipo_firma_pk == $select_tipof){ ?>
                                <option value="<?php echo $row->tpf_tipo_firma_pk; ?>" selected="selected"><?php echo $row->tpf_descripcion; ?></option>
			           <?php   }else{ ?>
			        			      <option value="<?php echo $row->tpf_tipo_firma_pk; ?>" ><?php echo $row->tpf_descripcion; ?></option>	
			  	             
							 <?php  }  ?> 
				       
              <?php endforeach; ?>
        
		    </select>
	
	</td>
  </tr>
  <tr>
    <td height="30"><span class="fontnormal">Tipo de Empresa </span></td>
    <td height="30">
	
	
	
	
	
	<select name="tipco" id="tipco" size="1" style="width:130px"   onchange="div_mostrar();" >
               <option value="<?php echo 0; ?>">[Seleccione uno]</option>
			   
			    <?php foreach ($query_contratista_tipo->result() as $row): ?>
			            	   <?php if($row->ctp_contratistas_tipo_pk == $select_tipco){ ?>
                                <option value="<?php echo $row->ctp_contratistas_tipo_pk; ?>" selected="selected"><?php echo $row->ctp_descripcion; ?></option>
			           <?php   }else{ ?>
			        			      <option value="<?php echo $row->ctp_contratistas_tipo_pk; ?>" ><?php echo $row->ctp_descripcion; ?></option>	
			  	             
							 <?php  }  ?> 
				       
              <?php endforeach; ?>
        
		    </select>
			
			
			
			
			
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	</td>
  </tr>

  <!--espacio-->
  <tr>
    <td height="10px">&nbsp;</td>
  </tr>
  <!--espacio-->
    </table>
      <span class="fontnormal"><font color="#FF0000"> </font></span></th>
    <th width="11" scope="col"> 
		
       
          <p>&nbsp;</p></th>
  </tr>
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
              <td height="30"> <label>Objeto de la Contratista:</label></td>
            
          <td>
		  <input type="text" name="objcoop" id="objcoop" maxlength="15" value="<?php echo $objcoop; ?>" onblur="upperCase(this.id)" />
		  </td>
            </tr>
            <tr> 
              <td height="30"><label>Tiempo de la Cooperativa:</label></td>
              <td><input type="text" name="timcoop" value="<?php echo $timcoop; ?>" maxlength="15" /></td>
            </tr>
            <tr> 
              <td height="30"><label>Duración de la Cooperativa:</label></td>
              <td><input type="text" name="durcoop" value="<?php echo $durcoop; ?>" maxlength="15"  onkeypress="return SoloNumero(event)" /> </td>
            </tr>
			<tr>
          <td height="30">Objeto Social de la Cooperativa:</td>
          <td><input type="text" name="objsoca" value="<?php echo $objsoca; ?>"   maxlength="15" /></td></tr>
			<tr><td><br></td></tr>
      </table>
	 
    </div>
			<!--    Tabla hidden --> 
			<br />  
			
			
			
		  
		  	  
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
			
			
			
			
			
    <table width="375" height="26">
      <tr> 
        <td width="314" class="bgtitle"><label><b>Números Contacto</b></label></td>
      <tr><td height="20"></td><td width="56"></td>
      </tr>
        </tr>
		
		  <?php foreach ($query_telef->result() as $row2): ?>
           <?php echo "<tr>"; ?>
		   <?php  echo "<td>"; ?> <?php echo $row2->ntt_descripcion.":"; ?>  <?php  echo "</td>"; ?>    
		   <?php  echo "<td>"; ?> <input type="text" name="pre_<?php echo $row2->ntt_numeros_telefonicos_tipo_pk; ?>"  value="<?php if(isset($a[$row2->ntt_numeros_telefonicos_tipo_pk])){ echo $a[$row2->ntt_numeros_telefonicos_tipo_pk];}elseif(isset($_POST["pre_$row2->ntt_numeros_telefonicos_tipo_pk"])){ echo $_POST["pre_$row2->ntt_numeros_telefonicos_tipo_pk"];}else {echo '';} ?>" maxlength="4"  size="4" onkeypress="return SoloNumero(event)"/><?php  echo "</td>"; ?>
		   <?php  echo "<td>"; ?> <input type="text" name="num_<?php echo $row2->ntt_numeros_telefonicos_tipo_pk; ?>"  value="<?php if(isset($b[$row2->ntt_numeros_telefonicos_tipo_pk])){ echo $b[$row2->ntt_numeros_telefonicos_tipo_pk];}elseif(isset($_POST["num_$row2->ntt_numeros_telefonicos_tipo_pk"])){ echo $_POST["num_$row2->ntt_numeros_telefonicos_tipo_pk"];}else {echo '';} ?>" maxlength="9"  size="10" onkeypress="return SoloNumero(event)"/><?php  echo "</td>"; ?>
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
      <td width="38%" ><div class="div_texbox" id="divEstados">
          
		  
		  
		  
		  
		    
			  
	<select name="selEstados" class="textbox"   onchange="xajax_obtieneMunicipio(this.value);" >
               <option value="<?php echo 0; ?>">[Seleccione uno]</option>
			   
			    <?php foreach ($query_estados->result() as $row): ?>
			            	   <?php if($row->est_estados_pk == $select_selEstados){ ?>
                                <option value="<?php echo $row->est_estados_pk; ?>" selected="selected"><?php echo $row->est_nombre; ?></option>
			           <?php   }else{ ?>
			        			      <option value="<?php echo $row->est_estados_pk; ?>"  <?php echo set_select('selEstados', $row->est_estados_pk, TRUE); ?>><?php echo $row->est_nombre; ?></option>	
			  	             
							 <?php  }  ?> 
				       
              <?php endforeach; ?>
		  
		  
		   </select>
		  
		  
            
         
		  
		  
		  
		  
		  
      </div></td>
  <tr>
    <td height="30">Municipio:</td>
    <td><div class="div_texbox" id="divMunicipio">
      <select name="menu1" class="textbox" onchange="">
        <option value="0">[Seleccione]</option>
      </select>
    </div></td>
    <td><span class="fontnormal"><font color="#FF0000"><?php echo form_error('selMunicipio'); ?></font></span></td>
  </tr>
  <tr>
    <td height="30">Ciudad:</td>
    <td><div class="div_texbox" id="divCiudad">
      <select name="menu2" class="textbox" onchange=""  >
        <option value="0">[Seleccione]</option>
      </select>
    </div></td>
    <td><span class="fontnormal"><font color="#FF0000"><?php echo form_error('selCiudades'); ?></font></span></td>
  </tr>
  <tr>
    <td height="30"></td>
    <td></td>
  </tr>
  <tr>
    <td height="30"><label>Dirección de Correo: </label>    </td>
    <td><input type="text" name="dirmail" size="25" maxlength="80"  value="<?php echo set_value('dirmail');?>" />    </td>
    <td width="32%"><font color="#FF0000"><?php echo form_error('dirmail'); ?></font></td>
  </tr>
  <tr>
    <td height="30"><label>Código Postal: </label>    </td>
    <td><input type="text" name="codpost" maxlength="12" size="8" value="<?php echo $codpost; ?>" onkeypress="return SoloNumero(event)" />    </td>
  </tr>
  <tr>
    <td height="30"><label>Dirección: </label></td>
    <td></td>
  </tr>
  <tr>
    <td colspan="3"><textarea rows="4" cols="60" name="dirfis"> <?php echo $dirfis; ?> </textarea></td>
  </tr>
  <tr>
    <td colspan="3"><br />
        <br /></td>
  </tr>
  <tr>
    <td colspan="3" align="center"><p>
      <input type="submit" name="boton" value="Guardar y Continuar"  />
    </p></td>
  </tr>
  <tr>
    <td></td>
  </tr>
  <tr>
    <td></td>
  </tr>
    </table>
  <?php echo form_close(); ?>    </div>
<table><tr><td> <?php   // $this->db->select_max('ntt_numeros_telefonicos_tipo_pk');
                       // $consulta = $this->db->get('numeros_telefonicos_tipo');

                     
	 
	// echo  $this->db->query($consulta);

	 ?>
</td></tr></table>

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

//-->

/*
function muestra_oculta(id){
if (document.getElementById){ //se obtiene el id
var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
el.style.display = (el.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div
}
}
window.onload = function(){//hace que se cargue la función lo que predetermina que div estará oculto hasta llamar a la función nuevamente
muestra_oculta('contenido_a_mostrar'); //"contenido_a_mostrar" es el nombre de la etiqueta DIV que deseamos mostrar 
}
*///-->
</script>



<script type="text/javascript">
div_mostrar();
</script> 



<div class="bgfooter"> <div class="footerimage"> </div></div>

</body>
</html>
