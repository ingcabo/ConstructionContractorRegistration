<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<?php $this->mod_usuario->en_session(); ?>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>..::.. REGCO ..::.. Cambiar Contrase&ntilde;a</title>
<link rel="stylesheet" href="<?=base_url();?>system/application/css/mainstyle2.css" type="text/css" />
<script type="text/javascript" src="<?=base_url();?>system/application/views/js_menu/stmenu.js"></script>
</head>

<body>

<?php echo $this->vismenu;?>
<div class="bodywrap">
<div class="bodyinfo">
<div class="headerbox">
<?php echo form_open('con_acceso/cambio_password');?>
<table width="408" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td width="87" height="26">&nbsp;</td>
    <td width="48">&nbsp;</td>
    <td width="9">&nbsp;</td>
    <td width="13">&nbsp;</td>
    <td width="78">&nbsp;</td>
    <td width="57">&nbsp;</td>
    <td width="49">&nbsp;</td>
    <td width="67">&nbsp;</td>
  </tr>
  <tr>
    <td height="28">&nbsp;</td>
    <td colspan="5" align="center" valign="middle"><strong>Cambiar Contrase&ntilde;a </strong></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="40">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="22" colspan="3" valign="top"><strong>Contrase&ntilde;a actual : </strong></td>
    <td>&nbsp;</td>
    <td colspan="3" valign="top"><label>
      <input name="txt_anterior" type="password" id="txt_anterior" value="" <?=set_value('txt_anterior');?>/>
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="19"></td>
    <td></td>
    <td></td>
    <td></td>
    <td colspan="4" valign="top"><?=form_error('txt_anterior');?></td>
  </tr>
  <tr>
    <td height="5"></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  
  <tr>
    <td height="22" colspan="3" valign="top"><strong>Nueva contrase&ntilde;a : </strong></td>
    <td>&nbsp;</td>
    <td colspan="3" valign="top"><label>
      <input name="txt_passnuevo" type="password" id="txt_passnuevo" value="" <?=set_value('txt_passnuevo');?>/>
    </label></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="19"></td>
    <td></td>
    <td></td>
    <td></td>
    <td colspan="4" valign="top"><?=form_error('txt_passnuevo');?></td>
  </tr>
  <tr>
    <td height="2"></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td height="22" colspan="3" valign="top"><p><strong>Confirmar contrase&ntilde;a </strong>: </p></td>
    <td></td>
    <td colspan="3" valign="top"><label>
      <input name="txt_passconfirma" type="password" id="txt_passconfirma" value="" <?=set_value('txt_passconfirma');?> />
    </label></td>
    <td></td>
  </tr>
  <tr>
    <td height="16"></td>
    <td></td>
    <td></td>
    <td></td>
    <td colspan="4" valign="top"><?=form_error('txt_passconfirma');?></td>
  </tr>
  <tr>
    <td height="41"></td>
    <td></td>
    <td></td>
    <td></td>
    <td>&nbsp;</td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  
  
  <tr>
    <td height="26">&nbsp;</td>
    <td>&nbsp;</td>
    <td colspan="3" align="center" valign="middle"><label>
      <input name="bto_aceptar" type="submit" id="bto_aceptar" value="Procesar" />
    </label></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
 
</table>
</form>
<div class="corner1"> </div>
<div class="corner2"> </div>
<div class="corner3"> </div>
<div class="corner4"> </div>
</div>
</div>
</div>

<div class="bgfooter"> <div class="footerimage"> </div></div>
</body>
</html>
