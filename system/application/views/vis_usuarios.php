<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<?php $this->mod_usuario->en_session(); ?>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="javascript">

    function estado(control){
        if(control.checked)
           control.value = 'f';
       else
           control.value = 't';
    }

    

</script>
<title>..:: REGCO ::.. Registro de Usuarios</title>
<!-- Inicio de: JS y CSS para el DataPick. -->
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/scripts.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar-es.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar-setup.js"></script>

<link media="screen" href="<?php echo base_url(); ?>system/application/js/calendario/styles/calendar-blue.css" rel="stylesheet" type="text/css" title="win2k-cold-1">
<link media="print" href="<?php echo base_url(); ?>system/application/js/calendario/styles/print.css" rel="stylesheet" type="text/css" title="win2k-cold-1">
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/css/mainstyle2.css" type="text/css" />
<script type="text/javascript" src="<?=base_url();?>system/application/views/js_menu/stmenu.js"></script>
<!--    Fin de: JS y CSS para el DataPick. -->
</head>

<body bgcolor="#FFFFFF" text="#000000" link="#0066FF" vlink="#9933FF" alink="#FF3333">

<div> <?=$this->vismenu;?> </div>

<div class="bodywrap">
<div class="bodyinfo">

<div style="width:800px; margin-bottom:20px; clear: both;">
<div style="float:left;"><strong> Usuarios del Sistema </strong></div>
<div style="float:right;"> MODO: <?=$this->modo_actual;?></div>
</div>
<?php echo form_open($envia);?>
<div class="headerbox">
<table width="790" border="0" cellspacing="0" cellpadding="0" class="table_usuarios">
  <tr>
    <td width="160">Usuario:</td>
    <td width="200" >
      <input name="txt_usuario" type="text" id="txt_usuario" <?=isset($noeditar)?$noeditar:'';?> value="<?=set_value('txt_usuario',isset($this->campos->usr_nombre)?$this->campos->usr_nombre:'');?>"  size="22"/>  </td>
    <td width="440"><span style="color:#ff0000;">
      <?=form_error('txt_usuario');?>
    </span>    </td>
  </tr>
  
  <tr>
  <td colspan="3">
<?php if($this->modo_actual === MODO_INCLUIR):?>  </td>
  </tr>
  
  <tr>
    <td>Contraseña:</td>
    <td><input name="txt_password" type="password"  size="23" id="txt_password" value="" <?=set_value('txt_password');?>/>    </td>
    <td><span style="color:#ff0000">
      <?=form_error('txt_password');?>
    </span></td>
    </tr>
  <tr>
    <td>Confirmar Contrase&ntilde;a:</td>
    <td>
      <input name="txt_confirma" type="password" id="txt_confirma" value="" size="23" <?=set_value('txt_confirma');?>/>    </td>
    <td><span style="color:#ff0000">
      <?=form_error('txt_confirma');?> </span><?php endif;?>    </td>
  </tr>
  <tr>
    <td>Correo Electr&oacute;nico:</td>
    <td>
      <input name="txt_email" type="text" id="txt_email" size="22" value="<?=set_value('txt_email',isset($this->campos->usr_correo_electronico)?$this->campos->usr_correo_electronico:'');?>"/>   </td>
    <td ><span style="color:#ff0000">
      <?=form_error('txt_email');?>
    </span></td>
  </tr>
  <tr>
    <td><span style="float:left; margin-right:10px;">Fecha Expiraci&oacute;n:</span></td>
    <td><span style="float:left; margin-right:10px;">
      <input name="txt_fecha" type="text" size="22" id="txt_fecha" value="<?=set_value('txt_fecha',isset($this->campos->usr_fecha_expira)?$this->mylib_base->pg_to_human($this->campos->usr_fecha_expira):'');?>"/>
    </span>
        <img name="txt_fecha_img" id="txt_fecha_img" src="<?php echo base_url(); ?>system/application/js/calendario/images/calendar.gif" width="16" height="16"><!-- Inicio de: Iniciar DataPick. -->
<script type="text/javascript">
		var campoId = 'txt_fecha';
		var imagenId = 'txt_fecha_img';
		iniciarCalendario(campoId, imagenId,'%d-%m-%Y',false);
		</script>    </td>
    <td><span style="color:#ff0000">
      <?=form_error('txt_fecha');?>
    </span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td><div style="float:right;">
      <input name="bto_procesar" type="submit" id="bto_procesar" value="Guardar" />
    <input name="bto_limpiar"  type="button" id="bto_cancelar" value="Cancelar" onclick="location.href = '<?=base_url();?>index.php/con_listview_Usuarios'"/>
    </div></td>
  </tr>
</table>

<div class="corner1"> </div>
<div class="corner2"> </div>
<div class="corner3"> </div>
<div class="corner4"> </div>

</div>

<br /> <br />

<div class="tabla_usuarios_2">
<?=$this->opciones_menu;?></form>
</div>


</div>
<div class="bgfooter"> <div class="footerimage"> </div></div>
</div>


</body>
</html>
