<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php $this->mod_usuario->en_session(); ?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<title>..:: REGCO ::.. Reporte de Inscripci&oacute;n</title>
<style>

.Estilo1 {
	font-size: 12px;
	font-weight: bold;
    font-family:Arial;
}

.Estilo2 {
	font-size: 12px;
    font-family:Arial;
    margin: 5px;
}
</style>
</head>

<body>
<table width="582" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td width="136" height="48" valign="top"><img src="<?=base_url();?>system/application/imagenes/logogoberzulia.jpg" width="136" height="45" /></td>
    <td width="314" valign="top"><div align="center" style="font-size:12px; font-family:Arial;" >REPÚBLICA BOLIVARIANA DE VENEZUELA<br />
      GOBERNACIÓN DEL ESTADO ZULIA<br />
    SECRETARÍA DE INFRAESTRUCTURA</div></td>
    <td width="132" valign="top"><img src="<?=base_url();?>system/application/imagenes/logosiez.jpg" width="132" height="43" /></td>
  </tr>
</table>
<br />
<table width="600" border="0" cellpadding="0" cellspacing="0"><tr><td width="50%"><table width="582" border="0" cellpadding="0" cellspacing="0" style="border:#666666 solid 1px; ">
  <!--DWLayoutTable-->
  <tr>
    <th height="20" colspan="5" valign="top" bgcolor="#CCCCCC" class="Estilo1">Certificado de Inscripción</th>
    <td width="5"></td>
  </tr>
  <tr>
    <td height="19"  colspan="3" valign="top"><span class="Estilo1">Nº Inscripción: &nbsp;&nbsp;</span>
    <span class="Estilo2"><?=isset($con_codigo_siez)?$con_codigo_siez:'';?></span></td>
    <td    colspan="2" valign="top"><span class="Estilo1">Fecha de Inscripci&oacute;n: &nbsp;&nbsp;</span>
    <span class="Estilo2"><?=isset($con_fecha_inscripcion)?$con_fecha_inscripcion:'';?></span></td>
    <td></td>
  </tr>
  <tr>
    <td height="19"  colspan="5" valign="top" bgcolor="#CCCCCC"><!--DWLayoutEmptyCell-->&nbsp;</td>
      <td></td>
  </tr>
  <tr>
    <td  height="30"  colspan="5" valign="top"><span class="Estilo1">Nombre:&nbsp;</span>
     <span class="Estilo2"> <?=isset($con_nombre)?trim($con_nombre):'';?></span></td>
    <td></td>
  </tr>
    
  <tr>
    <td  height="30" colspan="4" valign="top"><span class="Estilo1">Siglas: &nbsp;</span>
    <span class="Estilo2"> <?=isset($con_siglas)?trim($con_siglas):'';?></span></td>
    <td width="250" valign="top"><span class="Estilo1">Tipo de Firma:&nbsp;</span>
    <span class="Estilo2"><?=isset($tpf_descripcion)?trim($tpf_descripcion):'';?></span></td>
    <td></td>
  </tr>
  <tr>
    <td  height="30" colspan="4" valign="top"><span class="Estilo1">Especialidad:&nbsp;</span> 
    <span class="Estilo2"><?=isset($cod_especialidad)?trim($cod_especialidad):'';?></span></td>
    <td valign="middle"><span class="Estilo1">Nº RIF: </span>
      <span class="Estilo2"><?=isset($con_numero_rif)?trim($con_numero_rif):'';?></span></td>
    <td></td>
  </tr>
  
  <tr>
    <td  height="19" colspan="5" valign="top" bgcolor="#CCCCCC"><!--DWLayoutEmptyCell-->&nbsp;</td>
      <td></td>
  </tr>
  <tr>
    <td width="179"  height="22" valign="top" class="Estilo1">Representante (s) Legal (es):</td>
    <td width="93" valign="top" class="Estilo1">Cédula:</td>
    <td colspan="2" valign="top" class="Estilo1">Cargo:</td>
    
    <td rowspan="3" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td></td>
  </tr>
     <?php
     foreach($this->arr_rep_leg  as $filas){
	 ?>
  <tr>
    <td height="19" valign="top"><?=isset($filas['nombre'])?$filas['nombre']:'';?></td>
      <td valign="top"><?=isset($filas['pnt_cedula_de_identidad'])?$filas['pnt_cedula_de_identidad']:'';?></td>
      <td colspan="2" valign="top"><?=isset($filas['ajr_cargo_actual'])?$filas['ajr_cargo_actual']:'';?></td>
	  <td></td>
  </tr>
 <?php
     }
    ?>
	  <tr>
      <td height="34">&nbsp;</td>
      <td>&nbsp;</td>
      <td width="27">&nbsp;</td>
	  <td width="26">&nbsp;</td>
	  <td></td>
	  </tr>
	  <tr>
	    <td height="49">&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td>&nbsp;</td>
	    <td valign="bottom"><div align="center" class="Estilo1">Firma Autorizada y Sello<br />
        Gerencia de Contrataciones</div></td>
    <td></td>
      </tr>
	  
  


  
  
  
  
</table>
    <p>&nbsp;</p>
</body>

</html>
