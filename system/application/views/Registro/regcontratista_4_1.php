<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- INICIO DE COPIA !-->
<?php $this->mod_usuario->en_session(); ?>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>..::Ingreso de Personas::..</title>
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/css/mainstyle2.css" type="text/css" />
<script type="text/javascript" src="<?=base_url(); ?>system/application/views/js_menu/stmenu.js"></script>
<!-- Inicio de: JS y CSS para el DataPick. -->
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/scripts.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar-es.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar-setup.js"></script>
<link media="screen" href="<?php echo base_url(); ?>system/application/js/calendario/styles/calendar-blue.css" rel="stylesheet" type="text/css" title="win2k-cold-1">
<link media="print" href="<?php echo base_url(); ?>system/application/js/calendario/styles/print.css" rel="stylesheet" type="text/css" title="win2k-cold-1">
<!--    Fin de: JS y CSS para el DataPick. -->
<script type="text/javascript" src="<?=base_url(); ?>system/application/js/general.js"></script>


<script languaje="javascript">

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


<body bgcolor="#FFFFFF" text="#000000" link="#0066FF" vlink="#9933FF" alink="#FF3333">
<div>
  <?php echo $this->vismenu; ?>
</div>

<div class="bodywrap">
<div class="bodyinfo">
<table width="800px" border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td colspan="4" align="center"><label><b>Registro de Datos Personas</b></label></td>
	</tr>
	<tr><td width="157">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><tr>
	<td>Codigo de Inscripción:</td>
	<td width="201"><div class="casilla" style=" width:200px"><?php echo $fila['con_codigo_siez']; ?></div></td>
	<td width="242" align="center">Siglas de la Empresa :</td>
	<td width="200"><div class="casilla" style=" width:200px"><?php echo $fila['con_siglas']; ?></div></td>
	</tr>
	</table>
	<br>
<div class="headerbox"> 
    
	  
	  <?php $atributos = array('name' => 'form_personas_4', 'method'=>'POST', 'accept-charset'=>'UTF-8')?>
      <?php echo form_open('con_reg_4_1/grabar',$atributos); ?>
	 <input type="hidden" name="valorpk" value="<?php if($valorpk != '') {echo $valorpk;} else {echo '0';}; ?>">
	  <input type="hidden" name="valorid" value="<?php if($valorid != '') {echo $valorid;} else {echo '0';}; ?>">
	  <input type="hidden" name="dis" value="<?php if($dis != '') {echo $dis;} else {echo '';}; ?>">
	  <input type="hidden" name="dis_comisario" value="<?php if($dis_comisario != '') {echo $dis_comisario;} else {echo '';}; ?>">
	  <input type="hidden" name="chk_comisario" value="<?php if($chk_comisario != '') {echo $chk_comisario;} else {echo '';}; ?>">
	  <input type="hidden" name="modo" value="<?php if($modo != '') {echo $modo;} else {echo '0';}; ?>">
	   
	  <?php // $ddddd= 'disabled="true"';?>
	  
	  
	  <table width="815">
        <tr>
          <td colspan="2"><?php // echo "numero de Registro:".$valorpk;?> </td>
          <td><?php //echo "id de persona:".$valorid;?></td><td></td>
        </tr>
        <tr>
          <td class="bgtitle"><label><b>Datos Persona</b></label></td>
          <td><?php //echo $modo;?></td>
          <td class="bgtitle"><b>Cargo Actual</b></td><td></td>
        </tr>
        <tr>
          <!--<?php// echo set_value('nomb');?>-->
          <td width="172" height="30"><label>Nombre:</label></td>
<td width="184"><input type="text" name="nomb" id="nomb" size="20" maxlength="20"  value="<?php echo $nomb; ?>" READONLY /></td>
          <td><input type="text" name="cargac" id="cargac" size="25" maxlength="35"  value="<?php echo $cargac; ?>"/></td>
          <td width="280"><?php $checked = "checked";?></td>
        </tr>
        <tr>
          <td height="30"><label>Apellido:</label></td>
          <td><input type="text" name="apdo"  size="20" maxlength="20"   value="<?php  echo $apdo; ?>" READONLY /></td>
<td width="159"><input type="checkbox" name="comisario"  <?php echo $dis_comisario; ?>  id ="comisario"   <?php  echo $chk_comisario;?> <?php //if($acc === "t" and  $rp === "t" and $rp === "t") {echo 'checked disabled="true"';} else {echo 'disabled="true"';}?>         onclick="habilitaDeshabilita(this.form)" value="<?php echo $comisario;?>"/>
          Comisario</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="30"><label>Cédula de Identidad:</label></td>
          <td>
		      <?php  if ($this->uri->segment(4) > 0 or $this->uri->segment(4)<> ""){ ?>

               <?php echo ""; ?>

               <?php  }else{  ?>
		  
		  <select name="persona" onchange=" xajax_alertacedula(this.value,ced.value,<?php echo $valorpk ?>);" >
		  <option value="V" <?= $this->form_validation->set_select('persona', 'V'); ?>>V</option>
          <option value="E" <?= $this->form_validation->set_select('persona', 'E'); ?>>E</option>
          </select>

          <?php }    ?>
		  
		  
		  
		  <input type="text" name="ced"  size="14" maxlength="20" value="<?php  echo $ced; ?>"    READONLY />
               <div id="resp_cedula">  </div>   </td>
          <td><input type="checkbox" name="acc"    <?php echo $dis; ?> onclick="habilitaselect(this.form)"  <?php if($acc === "t"){ echo $checked; }else{echo "";}    ?>    value="<?php echo $acc;?>"/>
            Accionista
              <input type="text" name="porc" id= "porc" value="<?php echo number_format($porc, 2, ",","."); ?>" size="2"  maxlength="6" onblur="puntitos(this,this.value.charAt(this.value.length-1),'2')" />
			  <label>%</label>		   </td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="30"><label>Rif:</label></td>
          <td><input type="text" name="nrif"  size="20" maxlength="20" value="<?php  echo $nrif; ?>"  READONLY /></td>
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
                <td><input type="text" name="numcole" id ="numcole" maxlength="20" size="20"  value="<?php  echo $numcole; ?>"  /></td>
              </tr>
              <tr>
                <td height="30"><label>Vigencia de Solvencia:</label></td>
                <td><input type="text" name="vigen" id="vigen" maxlength="12"  size="12" readonly="readonly" value="<?php  echo $vigen; ?>"/>
                    <img name="dFCalendario2" id="dFCalendario2" src="<?php echo base_url(); ?>system/application/js/calendario/images/calendar.gif" width="16" height="16">
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
          <td> <div id="cont" align="right"> </div> </td>
          <td width="159">		</td>
		<td><div align="right">
		<?php if ($modo == 'new'){?><?php // echo anchor('con_reg_5/index/'.$valorpk.'/0/new', '<img alt="Siguiente" src="'.base_url().'system/application/imagenes/boton_continuar.gif" border="0">' );  ?>
		<?php $modo = '/new'; ?>
		
		
		
		<?php }else{ ?>
		
		<?php $modo = '/edit'; ?>
	
		
		<?php } ?>
		
		<input type="submit" name="boton" value="Guardar" onclick=""/> <input type="button" name="fin" value="Finalizar" onclick="enviar_persona(1)" /></div></td>
        </tr>             
      </table>
	  </form>
<div class="corner1"> </div>
<div class="corner2"> </div>
<div class="corner3"> </div>
<div class="corner4"> </div>
     
     
    </div>
	<table>
	<tr><td><span class="fontnormal"><font color="#FF0000"><?php echo validation_errors(); ?></font></span></td></tr>
	</table>
    <div class="tablein_1">
  <table width="750" class="bgceldas">
    <tr class="bgtitle">
      
      <th width="79">R.I.F</th>
      <th width="89">Cédula</th>
      <th width="189">Nombre</th>
      <th width="90">Cargo Actual</th>
      <th width="192">Descripción</th>
	  <th width="83">&nbsp;</th>
    </tr>
   
	<!-- inicio de consulta persona accionista -->
      <?php foreach($query->result() as $row): ?>
          <?php  echo "<tr>"; ?>
         <?php echo "<td>"; ?> <?php echo $row->pnt_rif_personal; ?> <?php echo "</td>"; ?> <?php echo "<td>"; ?> <?php echo $row->pnt_cedula_de_identidad; ?> <?php echo "</td>"; ?> <?php echo "<td>"; ?> <?php echo $row->pnt_nombres."  ".$row->pnt_apellidos; ?> <?php echo "</td>"; ?>
		  
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
			  
			
              $string = substr ($string, 0, strlen($string) - 1);

             echo $string; // esto muestra "Cadena a recorta"

			 ?>
          <?php echo "</td>"; ?>
		  
		  <?php $attr = array(
           'onclick'=>"return confirm('¿Esta seguro de borrar este registro?');"
           ); ?>
		  
		   <?php echo "<td>"; ?> <?php echo anchor('con_reg_4/grabar/'.$valorpk.'/'.$row->pnt_personas_naturales_fk.$modo, '<img alt="Editar" src="'.base_url().'system/application/imagenes/edit.png" border="0">');?>&nbsp;&nbsp;&nbsp;<?php echo anchor('con_reg_4/grabar/'.$valorpk.'/'.$row->pnt_personas_naturales_fk.$modo, '<img alt="Eliminar" src="'.base_url().'system/application/imagenes/delete.png" border="0">', $attr) ?> <?php echo "</td>"; ?> 
		  
          <?php  echo "</tr>"; ?>
		  <!--fin de persona accionista-->
	          <?php endforeach; ?>
      
	  
	  	  <!-- inicio de consulta comisario-->
		  
		  
		  <!--fin de consulta de comisario-->
	<tr><td></td></tr>
  </table>

    </div>
</div>
<div class="bgfooter"> <div class="footerimage"> </div></div>
</div>


</body>
</html>
