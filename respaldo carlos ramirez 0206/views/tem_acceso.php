<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><?= $title ?></title>
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/css/mainstyle2.css" type="text/css" />
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/SNC.css" type="text/css">

<script type="text/javascript" src="<?php  echo base_url(); ?>system/application/js/general.js"></script>

<script type="text/javascript" src="<?php  echo base_url(); ?>system/application/menu/stmenu.js"></script>

<script type="text/javascript">
<!--
window.onerror=function(m,u,l)
{
	window.status = "Java Script Error: "+m;
	return true;
}

</script>

</head>

<body bgcolor="#FFFFFF" text="#000000" link="#0066FF" vlink="#9933FF" alink="#FF3333">
<div style=" min-height:100%; position:relative;">
<div> <iframe src="<?php  echo base_url(); ?>system/application/views/header_1.php" width="100%" height="245px" frameborder="0" scrolling="no"> </iframe></div>

<div class="bodywrap">
<div class="bodyinfo2">
<div class="titleacceso">
<?= $titulo ?>
</div>
<div class="headerbox3" style="margin:auto;">

<?php echo form_open('con_acceso/entrar'); ?>
<table width="300" border="0" align="center" cellpadding="0" cellspacing="0" class="tableacceso">
  <tr>
    <td colspan="2" scope="col"><div align="left"><span style="font-weight:bold;">Ingrese Usuario y Contraseña</span></div></td>
    </tr>
  <tr>
    <td>Usuario:</td>
    <td><input type="text" id="usuario" name="usuario" size="16" maxlength="14" value="" <?php echo set_value('usuario')?> /></td>
  </tr>
  <tr>
    <td></td>
    <td class="requerido"><?php echo form_error('usuario')?></td>
  </tr>
  <tr>
    <td>Contraseña:</td>
    <td><input type="password" id="clave" name="clave" size="16" maxlength="16" value="" <?php echo set_value('clave')?> /></td>
  </tr>
  <tr>
    <td></td>
    <td class="requerido"><?php echo form_error('clave')?></td>
  </tr>
  <tr>
   <td></td>
   <td class="requerido"><?=isset($claveerronea)?$claveerronea:'';?></td>
  </tr>
  <tr>
    <td></td>
    <td><input type="submit" name="ini2" value="Iniciar Sesión" align="right" onclick="enviar(3);" /></td>
  </tr>
  <tr>
    <td colspan="2"><div class="olvidecontrasena"><a href="<?=base_url();?>index.php/con_acceso/recuperarclave">¿Has olvidado la contraseña?</a></div></td>
  </tr>
  <tr>
    <td colspan="2">
      </td>
    </tr>
</table>
<div class="corner1_v2"> </div>
<div class="corner2_v2"> </div>
<div class="corner3_v2"> </div>
<div class="corner4_v2"> </div>

</div>

</div>

</div>



<div class="bgfooter_v2"> <div class="footerimage"> </div></div>
</div>
</body>
</html>
