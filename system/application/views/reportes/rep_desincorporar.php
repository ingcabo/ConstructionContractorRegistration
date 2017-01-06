<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<?php $this->mod_usuario->en_session(); ?>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>..:: REGCO ::.. Acta de Desincorporación</title>
<style type="text/css">

body {
	margin-left: 5px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
}
.style1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-weight: bold;
	font-size: 12px;
}
.style2 {	
font-family: Verdana, Arial, Helvetica, sans-serif;

font-size: 12px;
line-height:20px;
text-align:center;
}

</style></head>

<body>
<table width="653" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td width="180" height="70"><img src="<?=base_url();?>system/application/imagenes/logogoberzulia.jpg" width="180" height="70" /></td>
    <td width="293" valign="middle"><div align="center" class="style1">REPÚBLICA BOLIVARIANA DE VENEZUELA<br />
      GOBERNACIÓN DEL ESTADO ZULIA<br />
    SECRETARÍA DE INFRAESTRUCTURA</div></td>
    <td width="180" valign="top"><img src="<?=base_url();?>system/application/imagenes/logosiez.jpg" width="180" height="70" /></td>
  </tr>
</table>
<br />
<table width="583" border="0" cellpadding="0" cellspacing="0" >
  <!--DWLayoutTable-->
  <tr>
    <th width="128" height="20">&nbsp;</th>
    <th width="181">&nbsp;</th>
    <th width="15">&nbsp;</th>
    <th width="113">&nbsp;</th>
    <th width="78">&nbsp;</th>
    <th width="64">&nbsp;</th>
    <th width="4">&nbsp;</th>
    </tr>
  <tr>
    <th height="24"  colspan="6" valign="middle"><div align="center"><strong>ACTA DE DESINCORPORACION</strong></div></th>
  <th>&nbsp;</th>
  </tr>
  
  
  
  
  <tr>
    <td height="174"  colspan="6" valign="middle" class="style2">Hoy de fecha <?=mdate('%d de %m de %Y',now())?> la Gobernación del Estado Zulia, por &Oacute;rgano de la Secretar&iacute;a de Infraestructura del Estado Zulia, SIEZ, procede a desincorporar las siguientes contratistas del Sistema de Registro y Seguimiento de Contratistas (REGCO) según lo establecido por: <?=isset($ley)?$ley:'';?>, en su(s) Artículo(s) <?=isset($articulos)?$articulos:'';?>.<br />      <br /></td>
    <td>&nbsp;</td>
  </tr>
  
    
    <tr >
      <th height="20" valign="top"  bgcolor="#466FD5" class="style1 style2" >Nº Inscripción</th>
    <th colspan="2" valign="top"  bgcolor="#466FD5" class="style1 style2" >Nombre o Razón social</th>
    <th valign="top"  bgcolor="#466FD5" class="style1 style2" >Siglas Empresa</th>
    <th valign="top"  bgcolor="#466FD5" class="style1 style2" >Nro. RIF</th>
    <th valign="top"  bgcolor="#466FD5" class="style1 style2" >Nro. RNC</th>
    <th >&nbsp;</th>
    </tr>
    <?php
     if(isset($conlista) and is_array($conlista))
      foreach($conlista as $fconlista){
    ?>
    <tr >
      <th height="20" valign="top" ><?=isset($fconlista['con_codigo_siez'])?$fconlista['con_codigo_siez']:'';?></th>
      <th colspan="2" valign="top" ><?=isset($fconlista['con_nombre'])?$fconlista['con_nombre']:'';?></th>
      <th valign="top" ><?=isset($fconlista['con_siglas'])?$fconlista['con_siglas']:'';?></th>
      <th valign="top" ><?=isset($fconlista['con_numero_rif'])?$fconlista['con_numero_rif']:'';?></th>
      <th valign="top" ><?=isset($fconlista['con_numero_rnc'])?$fconlista['con_numero_rnc']:'';?></th>
      <th >&nbsp;</th>
    </tr>
    <?php }?>
    <tr >
      <th height="29" >&nbsp;</th>
      <th >&nbsp;</th>
      <th >&nbsp;</th>
      <th ></th>
      <th >&nbsp;</th>
      <th >&nbsp;</th>
      <th ></th>
    </tr>
    <tr >
      <th height="21" >&nbsp;</th>
      <th >&nbsp;</th>
      <th colspan="3" valign="bottom" >___________________</th>
    <th >&nbsp;</th>
      <th ></th>
    </tr>
    
    
    
    <tr >
      <th height="42" class="style1 style2" ></th>
      <th class="style1 style2" ></th>
      <th colspan="3" valign="top" class="style1 style2" >Firma Autorizada y Sello<br />
      Gerencia de Contrataciones</th>
    <th >&nbsp;</th>
      <th >&nbsp;</th>
    </tr>
</table>
    <p>&nbsp;</p>
</body>

</html>
