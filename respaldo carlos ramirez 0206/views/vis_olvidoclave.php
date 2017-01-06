<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>..:: REGCO ::.. Olvid&oacute; su contrase&ntilde;a</title>
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/css/mainstyle2.css" type="text/css" />
</head>

<body><div style=" min-height:100%; position:relative;">
<div><iframe src="<?php  echo base_url(); ?>system/application/views/header_1.php" width="100%" height="245px" frameborder="0" scrolling="no"> </iframe></div>
<div class="bodywrap">
<div class="bodyinfo" id="body">
  <p>Ingrese el correo electr&oacute;nico que utiliz&oacute; al momento de registrar su cuenta de usuario en el sistema REGCO </p>
  <?=form_open('con_acceso/recuperarclave');?>
    <div style="float:left; margin-right:10px;"><label>Correo Electr&oacute;nico :
      <input name="txt_email" type="text" id="txt_email" value="" <?=set_value('txt_email')?> /></div><div style="color:#ff0000"><?=form_error('txt_email')?></div>
    </label>
    <p>
      <label>
      <input name="bto_enviar" type="submit" id="bto_enviar" value="Enviar" />
      </label>
      <label>
      <input type="button" name="bto_cancelar" value="Cancelar" onclick="history.go(-1);" />
      </label>
    </p>
  </form>
  <p>&nbsp;</p>
</div>
</div>
<div class="bgfooter_v2"> <div class="footerimage"> </div></div>
</div>
</body>
</html>
