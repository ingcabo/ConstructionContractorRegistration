<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- INICIO DE COPIA !-->
<html xmlns="http://www.w3.org/1999/xhtml">

<?php $this->mod_usuario->en_session(); ?>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>..::Ingreso de Personas::..</title>
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/css/mainstyle2.css" type="text/css" />

<script type="text/javascript" src="<?php  echo base_url(); ?>system/application/js/general.js"></script>
<script type="text/javascript" src="<?=base_url();?>system/application/views/js_menu/stmenu.js"></script>

<!-- Inicio de: JS y CSS para el DataPick. -->
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/scripts.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar-es.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar-setup.js"></script>

<link media="screen" href="<?php echo base_url(); ?>system/application/js/calendario/styles/calendar-blue.css" rel="stylesheet" type="text/css" title="win2k-cold-1">
<link media="print" href="<?php echo base_url(); ?>system/application/js/calendario/styles/print.css" rel="stylesheet" type="text/css" title="win2k-cold-1">
<!--    Fin de: JS y CSS para el DataPick. -->










<script languaje="javascript">
/*
function limpiar(){

form.valorid.value=0;

}

/*
window.onerror=function(m,u,l)
{
	window.status = "Java Script Error: "+m;
	return true;
}*/

/*
function muestra_oculta(id){
if (document.getElementById){ //se obtiene el id
var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
el.style.display = (el.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div
}
}
window.onload = function(){/*hace que se cargue la función lo que predetermina que div estará oculto hasta llamar a la función nuevamente*//*
muestra_oculta('contenido_a_mostrar');/* "contenido_a_mostrar" es el nombre de la etiqueta DIV que deseamos mostrar *//*
muestra_oculta('cont')
}*/
//-->




function habilitaDeshabilita(form)

{

    if (form.comisario.checked == true)

    {

     form.acc.disabled         = true;
     form.rp.disabled          = true;
     form.JDir.disabled        = true;
	 form.porc.disabled        = true;
	 form.cargac.disabled      = true;
	
	 form.profesion.disabled   = false;
	 form.numcole.disabled     = false;
	 form.vigen.disabled       = false;
	
	
	//s1.disabled = true; 
	
	

    }

 

    if (form.comisario.checked == false)

    {

    form.acc.disabled = false;
    form.rp.disabled = false;
    form.JDir.disabled = false;
	form.cargac.disabled = false;

	form.profesion.disabled= true;
	form.numcole.disabled = true;
	form.vigen.disabled = true;
	
	
	
	

    }

 

}


function habilitaselect(form)

{

    if (form.acc.checked == false)

    {

    form.porc.disabled = true;
    
	
	//s1.disabled = true; 
	
	
    }

 

    if (form.acc.checked == true )

    {

    form.porc.disabled = false;
    	

    }
	
	

 

}


function enviar_persona(op,pk){
 
		switch (op){
			
			
			case 1:{
			document.form_personas.action ="<?php  echo base_url(); ?>index.php/con_consult_regco";
			document.form_personas.submit();
			break;
			}
			case 2:{
			document.form_personas.action = "<?php  echo base_url(); ?>index.php/con_reg_5/index/"+pk+"/0/new";
			document.form_personas.submit();
			break;
			}

		}	
			
}
</script>
<?php   echo  $xajax_js; ?>
</head>
<body>



<div>
  <?php echo $this->vismenu; ?>
</div>

<div class="bodywrap">
<div class="bodyinfo">

<table width="800px" border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td colspan="4"  align="center"><label><b>Registro de Representantes de la Contratista</b></label></td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <tr><td width="157">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><tr>
	<td>Número de Inscripción:</td>
	<td width="201"><div class="casilla" style=" width:200px"><?php echo $fila['con_codigo_siez']; ?></div></td>
	<td width="242" align="center">Siglas de la Empresa :</td>
	<td width="200"><div class="casilla" style=" width:200px"><?php echo $fila['con_siglas']; ?></div></td>
	</tr>
	  <tr>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td align="center">&nbsp;</td>
	    <td>&nbsp;</td>
      </tr>
	</table>
	<br>


  <div class="headerbox">
      <?php $atributos = array('name' => 'form_personas', 'method'=>'POST', 'accept-charset'=>'UTF-8')?>
      <?php echo form_open('con_reg_4/grabar',$atributos); ?>
	 <input type="hidden"     name="valorpk"  value="<?php if($valorpk != '')   {echo $valorpk;} else {echo '0';}; ?>">
	 <input type="hidden"     name="valorid"  value="<?php if($valorid != '') {echo $valorid;} else {echo '0';}; ?>">
	 <input type="hidden"     name="cedula"   value="<?php if($cedula = '')   {echo $ced;}     else {echo '0';}; ?>">
	 <input type="hidden"       name="modo"     value="<?php if($modo != '')    {echo $modo;}    else {echo '0';}; ?>">
	   
	

	  <input type="hidden" name="dis" value="<?php if($dis != '') {echo $dis;} else {echo '';}; ?>">
	  <input type="hidden" name="dis_comisario" value="<?php if($dis_comisario != '') {echo $dis_comisario;} else {echo '';}; ?>">
	  <input type="hidden" name="chk_comisario" value="<?php if($chk_comisario != '') {echo $chk_comisario;} else {echo '';}; ?>">
	   
	 
	  <table width="764">
        <tr>
          <td colspan="2">
          </td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td class="bgtitle"><label><b>Datos Personales</b></label></td>
          <td ></td>
          <td class="bgtitle"><b>Cargo Actual</b></td>
          <td></td>
        </tr>
        <tr>
         
          <td width="168" height="30"><label>Nombre:</label></td>
          <td width="201"><input type="text" name="nomb" id="nomb" size="20" maxlength="20"  value="<?php echo $nomb; ?>"/></td>
          <td><input type="text" name="cargac" id="cargac" size="25" maxlength="35"  value="<?php echo $cargac; ?>"/></td>
          <td width="179"><?php $checked = "checked";?></td>
        </tr>
        <tr>
          <td height="30"><label>Apellido:</label></td>
          <td><input type="text" name="apdo"  size="20" maxlength="20"   value="<?php  echo $apdo; ?>"/></td>
          <td width="196"><input type="checkbox" name="comisario"  <?php echo $dis_comisario; ?>  id ="comisario"   <?php  echo $chk_comisario;?> <?php //if($acc === "t" and  $rp === "t" and $rp === "t") {echo 'checked disabled="true"';} else {echo 'disabled="true"';}?>         onclick="habilitaDeshabilita(this.form)" value="<?php echo $comisario;?>"/>
            Comisario</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="30"><label>Cédula de Identidad:</label></td>
          <td><?php  if ($this->uri->segment(4) > 0 or $this->uri->segment(2) == "grabar"  and($this->uri->segment(5) > 0)){ ?>
              <?php echo ""; ?>
              <?php  }else{  ?>
              <select name="persona" onchange=" xajax_alertacedula(this.value,ced.value,<?php echo $valorpk ?>);" >
                <option value="V" <?= $this->form_validation->set_select('persona', 'V'); ?>>V</option>
                <option value="E" <?= $this->form_validation->set_select('persona', 'E'); ?>>E</option>
              </select>
              <?php }    ?>
              <input type="text" name="ced"  size="14" maxlength="20" <?php  echo $bk_cedula; ?> value="<?php  echo $ced; ?>"  onblur=" xajax_alertacedula(persona.value,this.value,<?php echo $valorpk ?>,modo.value);"  onkeypress="return SoloNumero(event)" />
          </td>
          <td><input type="checkbox" name="acc"    <?php echo $dis; ?> onclick="habilitaselect(this.form)"  <?php if($acc === "t"){ echo $checked; }else{echo "";}    ?>    value="<?php echo $acc;?>"/>
            Accionista
            <input type="text" name="porc" id= "porc" value="<?php echo number_format($porc, 2, ",","."); ?>" size="2"  maxlength="6" onblur="puntitos(this,this.value.charAt(this.value.length-1),'2')" />
        <label>%</label>
          </td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="30"><label>Rif:</label></td>
          <td><input type="text" name="nrif"  size="20" maxlength="20" value="<?php  echo $nrif; ?>" onkeypress="return SoloNumero(event)" /></td>
          <td><input type="checkbox" <?php echo $dis; ?> name="rp"  <?php if($rp === "t"){ echo $checked; }else{echo "";}    ?>  value="<?php echo $rp;?>"/>
            Representante Legal </td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="30"><label>Correo Electrónico:</label></td>
          <td><input type="text" name="email"  size="20" maxlength="100" value="<?php  echo $email; ?>" /></td>
          <td><input type="checkbox" <?php echo $dis; ?> name="JDir" <?php if($JDir === "t"){ echo $checked; }else{echo "";}    ?>  value="<?php  echo $JDir; ?>"/>
            Junta Directiva</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2" ></td>
        </tr>
        <tr>
          <td colspan="3"><table  width="381" height="51"  style="text-align:left">
              <tr>
                <td width="169" class="bgtitle"><label><b>Datos Comisario</b></label></td>
                <td width="200">&nbsp;</td>
              </tr>
              <tr>
                <td height="30"><label>Profesión:</label></td>
                <td><input type="text" name="profesion" id="profesion" maxlength="20" size="20"  value="<?php  echo $profesion; ?>"/></td>
              </tr>
              <tr>
                <td height="30"><label>Número Colegiado:</label></td>
                <td><input type="text" name="numcole" id ="numcole" maxlength="20" size="20"  value="<?php  echo $numcole; ?>"/></td>
              </tr>
              <tr>
                <td height="30"><label>Vigencia de Solvencia:</label></td>
                <td><input type="text" name="vigen" id="vigen" maxlength="12"  size="12" readonly="readonly" value="<?php  echo $vigen; ?>"/>
                    <img name="dFCalendario2" id="dFCalendario2" src="<?php echo base_url(); ?>system/application/js/calendario/images/calendar.gif" width="16" height="16" />
                    <!-- Inicio de: Iniciar DataPick. -->
                    <script type="text/javascript">
		var campoId = 'vigen';
		var imagenId = 'dFCalendario2';
		
		
		iniciarCalendario(campoId, imagenId,'%d-%m-%Y',false);
		</script></td>
              </tr>
              <tr>
                <td><br/></td>
              </tr>
          </table></td>
        </tr>
        <tr>
          <td height="26">&nbsp;</td>
          <td></td>
          <td width="196"></td>
        </tr>
      </table>
	  <table width="913" border="0" cellpadding="0" cellspacing="0" >
      <tr><td width="246"></td>
        <th width="360" align="right" scope="col">
	
		  
		
		<div id="resp_cedula">
		<?php if ($valorid > 0){ ?>
    	<input type="submit" name="boton" value="Guardar" onclick=""/>&nbsp;&nbsp;&nbsp;
	   <?php }else{ ?>
		                
        <?php     } ?>
												  
		 </div>
			 
		 
		</th>
		
		 <td width="307">
		 
		<div>
      <?php if ($modo == 'new'){ ?>
		    
		      <?php   $modo = 'new';  ?>
			  &nbsp;&nbsp;&nbsp;<input type="button" name="accion" value="Siguiente" onclick="enviar_persona(2,<?php echo $valorpk; ?>)" />      
				
	<?php	 }else{  
		 		
		  $modo = 'edit'; 	
		
		       } ?>

		 &nbsp;&nbsp;&nbsp; 
	

	 	  <input type="button" name="fin" value="Finalizar" onclick="enviar_persona(1)" />
		</div>
		  </td>
      </tr>
	  <tr>
	  <td></td><td></td><td width="307"></td>
	  </tr>
    </table>
	 <?php echo form_close(); ?>
<div class="corner1"> </div>
<div class="corner2"> </div>
<div class="corner3"> </div>
<div class="corner4"> </div>
     
     
    </div>
	<table>
	<tr><td><span class="fontnormal"><font color="#FF0000"><?php echo validation_errors(); ?></font></span></td></tr>
	</table>
    <div class="tablein_1">
  <table width="860" class="bgceldas">
    <tr class="bgtitle">
      
      <th width="91">R.I.F</th>
      <th width="102">Cédula</th>
      <th width="217">Nombre</th>
      <th width="103">Cargo Actual</th>
      <th width="265">Descripción</th>
	  <th width="54">&nbsp;</th>
    </tr>
   
	<!-- inicio de consulta persona accionista -->
      <?php foreach($query->result() as $row): ?>
	 
	  
          <?php  echo "<tr>"; ?>
           <?php echo "</td>"; ?> <?php echo "<td>"; ?> <?php echo $row->pnt_rif_personal; ?> <?php echo "</td>"; ?> <?php echo "<td>"; ?> <?php echo $row->pnt_cedula_de_identidad; ?> <?php echo "</td>"; ?> <?php echo "<td>"; ?> <?php echo $row->pnt_nombres."  ".$row->pnt_apellidos; ?> <?php echo "</td>"; ?>
		  
		   <?php echo "<td>"; ?> 
		   <?php
		  	  
		  if ($row->comisario <> -1)
           { 
		   echo "Comisario";
		   
		   }else
		   {
		    echo $row->cargoac_id;
		   }
		   ?> <?php echo "</td>"; ?> 
		   <?php echo "<td>"; ?>
		  <?php
			 
			if ($row->accionista_id == 't'){
			 $cad1 = "Accionista,  ";}else{$cad1= "";}
			
			if ($row->rpl_id == 't'){
			 $cad2 = "Representante Legal,  ";} else{$cad2= "";}
			 
			if ($row->jdir_id  == 't'){
			 $cad3 = "Directivo,  ";}else{$cad3= "";} 
			
			  $string= $cad1.$cad2.$cad3; 
			  $cad = substr ($string, 0, strlen($string) -3);
		   
               echo $cad;
			 ?>
          <?php echo "</td>"; ?>
		  
          
               <?php $attr = array('onclick'=>"return confirm('¿Esta seguro de borrar este registro?');"); ?>
           <?php if ($row->pnt_personas_naturales_fk > 0){ ?>
		  
		 <?php echo "<td>"; ?> <?php echo anchor('con_reg_4/grabar/'.$valorpk.'/'.$row->pnt_personas_naturales_fk.'/'.$modo, '<img alt="Editar" src="'.base_url().'system/application/imagenes/edit.png" border="0">');?>&nbsp;&nbsp;&nbsp;<?php echo anchor('con_reg_4/eliminar_persona/'.$valorpk.'/'.$row->pnt_personas_naturales_fk.'/'.$modo, '<img alt="Eliminar" src="'.base_url().'system/application/imagenes/delete.png" border="0">',$attr) ?>
		
		 <?php echo "</td>"; ?>
		 <?php } ?>
          <?php  echo "</tr>"; ?>
		
		  <!--fin de persona accionista-->
	          <?php endforeach; ?>
      
	  
	  	  <!-- inicio de consulta comisario-->
		  
		  
		  <!--fin de consulta de comisario-->
	<tr><td></td></tr>
  </table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
    </div>
</div>
<div class="bgfooter"> <div class="footerimage"> </div></div>
</div>




</body>
</html>
