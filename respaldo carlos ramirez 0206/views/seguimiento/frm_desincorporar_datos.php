<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- INICIO DE COPIA !-->
<?php $this->mod_usuario->en_session(); ?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>..:: REGCO ::..Desincorporar Datos</title>
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/css/mainstyle2.css" type="text/css" />
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/SNC.css" type="text/css">
<script type="text/javascript" src="<?php  echo base_url(); ?>system/application/js/general.js"></script>
<script type="text/javascript" src="<?=base_url();?>system/application/views/js_menu/stmenu.js"></script>


<script type="text/javascript">
window.onerror=function(m,u,l)
{
	window.status = "Java Script Error: "+m;
	return true;
}

</script>
<style type="text/css">
.Estilo1 {
	font-size: 14px;
	font-weight: bold;
}
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000" link="#0066FF" vlink="#9933FF" alink="#FF3333">

<div> <?php echo $this->vismenu;?></div>

<div class="bodywrap">
<div class="bodyinfo">
<div class="headerbox">
<span class="Estilo1">Datos para generar Desincorporaci&oacute;n de Contratistas </span>
&nbsp;

<?php echo form_open('con_Desincorporacion/rep_desincorporar'); ?>

<h5>Descripci&oacute;n de Ley : </h5>
<?=form_error('txt_ley'); ?>
<input name="txt_ley" type="text" id="txt_ley" value="<?=set_value('txt_ley');?>" size="130" />

<h5>Art&iacute;culo(s) : </h5>
<?=form_error('txt_articulos'); ?>
<input name="txt_articulos" type="text" id="txt_articulos" value="<?=set_value('txt_articulos');?>" size="130" />

<h5>&nbsp;</h5>
<div><input name="bto_imprimir" type="submit" id="bto_imprimir" value="Imprimir Desincorporaci&oacute;n" />
  <label>
  <input name="bto_cancelar" type="submit" id="bto_cancelar" value="Cancelar" />
  </label>
</div>

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
