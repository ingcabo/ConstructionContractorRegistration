<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Mantenimiento del Sistema</title>
<link rel="stylesheet" href="<?=base_url();?>system/application/css/mainstyle2.css" type="text/css" />
<script type="text/javascript" src="<?=base_url();?>system/application/views/js_menu/stmenu.js"></script>
<script type="text/javascript">

function opcion(valor){
    if(valor == 1)
      window.location = "<?=base_url();?>index.php/con_listview_Estados";
    if(valor == 2)
      window.location = "<?=base_url();?>index.php/con_listview_Municipios";
    if(valor == 3)
      window.location = "<?=base_url();?>index.php/con_listview_Ciudades";
    if(valor == 4)
      window.location = "<?=base_url();?>index.php/con_listview_Denominacion";
    if(valor == 5)
      window.location = "<?=base_url();?>index.php/con_listview_EstatusContratos";
    if(valor == 6)
      window.location = "<?=base_url();?>index.php/con_listview_EstatusEmpresa";
    if(valor == 7)
      window.location = "<?=base_url();?>index.php/con_listview_NumTelefonicosTipos";
    if(valor == 8)
      window.location = "<?=base_url();?>index.php/con_listview_Usuarios";
}

</script>
</head>

<body>
<?=$this->vismenu;?>

<div class="bodywrap">
<div class="bodyinfo">
<div class="mantenimientodiv">
  <p>&nbsp;</p>
  <div align="left" style=" text-align:center;"><strong>Mantenimiento</strong><br />
    <br />
    <br />
  </div>
  <table width="500" border="0" align="center" cellpadding="2" cellspacing="0">
  <tr>
    <th scope="col"><div class="boton_div"><input class="boton_usuarios" type="button" name="bto_usuarios" onclick="opcion(1);" style="cursor:pointer; border:none; background:url(<?=base_url();?>system/application/imagenes/state.jpg); width:32px; height:32px;"/>
    Estado</div></th>
    <th scope="col"><div class="boton_div"><input class="boton_usuarios" type="button" name="bto_usuarios" onclick="opcion(5);" style="cursor:pointer; border:none; background:url(<?=base_url();?>system/application/imagenes/doc1.jpg); width:32px; height:32px;"/>
    Estatus del Contrato</div></th>
  </tr>
  <tr>
    <th><div class="boton_div"><input class="boton_usuarios" type="button" name="bto_usuarios" onclick="opcion(2);"  style="cursor:pointer; border:none; background:url(<?=base_url();?>system/application/imagenes/municipio.jpg); width:32px; height:32px;"/>
    Municipio</div></th>
    <th><div class="boton_div"><input class="boton_usuarios" type="button" name="bto_usuarios" onclick="opcion(6);"  style="cursor:pointer; border:none; background:url(<?=base_url();?>system/application/imagenes/status.jpg); width:32px; height:32px;"/>
    Estatus de la Contratista</div></th>
  </tr>
  <tr>
    <th><div class="boton_div"><input class="boton_usuarios" type="button" name="bto_usuarios" onclick="opcion(3);"  style="cursor:pointer; border:none; background:url(<?=base_url();?>system/application/imagenes/city.jpg); width:32px; height:32px;"/>
    Ciudad</div></th>
    <th><div class="boton_div"><input class="boton_usuarios" type="button" name="bto_usuarios" onclick="opcion(7);"  style="cursor:pointer; border:none; background:url(<?=base_url();?>system/application/imagenes/phone.jpg); width:32px; height:32px;"/>
    Tipos de Números Telefónicos</div></th>
  </tr>
  <tr>
    <th><div class="boton_div"><input class="boton_usuarios" type="button" name="bto_usuarios" onclick="opcion(4);"  style="cursor:pointer; border:none; background:url(<?=base_url();?>system/application/imagenes/denominacion.jpg); width:32px; height:32px;"/>
    Denominación Comercial</div></th>
    <th><div class="boton_div"><input class="boton_usuarios" type="button" name="bto_usuarios" onclick="opcion(8);"  style="cursor:pointer; border:none; background:url(<?=base_url();?>system/application/imagenes/users.jpg); width:32px; height:32px;"/> Usuarios</div></th>
  </tr>
</table>



</div>
</div>
</div>
<div class="bgfooter"> <div class="footerimage"> </div></div>

</body>
</html>
