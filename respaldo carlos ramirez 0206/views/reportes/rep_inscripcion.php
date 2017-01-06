<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<title>Untitled Document</title>
<style>

.Estilo1 {
	font-size: 12px;
	font-weight: bold;
}

</style>
</head>

<body>
<table width="574" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td width="136" height="48" valign="top"><img src="<?=base_url();?>system/application/imagenes/logogoberzulia.jpg" width="136" height="45" /></td>
    <td width="306" valign="top"><div align="center" style="font-size:12px; font-family:Arial, Helvetica, sans-serif" >REPÚBLICA BOLIVARIANA DE VENEZUELA<br />
      GOBERNACIÓN DEL ESTADO ZULIA<br />
    SECRETARÍA DE INFRAESTRUCTURA</div></td>
    <td width="132" valign="top"><img src="<?=base_url();?>system/application/imagenes/logosiez.jpg" width="132" height="43" /></td>
  </tr>
</table>
<br />
<table width="600" border="0" cellpadding="0" cellspacing="0"><tr><td width="50%"><table width="582" border="0" cellpadding="0" cellspacing="0" style="border:#666666 solid 1px; ">
  <!--DWLayoutTable-->
  <tr>
    <th height="20" colspan="5" valign="top" bgcolor="#CCCCCC" class="style1 style2">Certificado de Inscripción</th>
    <td width="5"></td>
  </tr>
  <tr>
    <td height="19"  colspan="3" valign="top"><span class="Estilo1">Nº Inscripción:&nbsp;</span>      <?=isset($con_codigo_siez)?$con_codigo_siez:'';?></td>

    <td    colspan="2" valign="top"><span class="Estilo1">Fecha de Inscripci&oacute;n:&nbsp; </span>     <?=isset($con_fecha_inscripcion)?$con_fecha_inscripcion:'';?></td>
    <td></td>
  </tr>
  <tr>
    <td height="19"  colspan="5" valign="top" bgcolor="#CCCCCC"><!--DWLayoutEmptyCell-->&nbsp;</td>
      <td></td>
  </tr>
  <tr>
    <td  height="30"  colspan="4" valign="top"><span class="Estilo1">Nombre: </span>
      <?=isset($con_nombre)?$con_nombre:'';?></td>
    <td width="250" rowspan="3" valign="middle"><span class="Estilo1">Nº RIF: </span>
      <?=isset($con_numero_rif)?$con_numero_rif:'';?></td>
    <td></td>
  </tr>
    
  <tr>
    <td  height="30" colspan="4" valign="top"><span class="Estilo1">Tipo de Firma:&nbsp;</span>  <?=isset($tpf_descripcion)?$tpf_descripcion:'';?></td>
    <td></td>
  </tr>
  <tr>
    <td  height="30" colspan="4" valign="top"><span class="Estilo1">Especialidad:&nbsp;</span> <?=isset($cod_especialidad)?$cod_especialidad:'';?></td>
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
	    <td valign="bottom"><div align="center">Firma Autorizada y Sello<br /> 
        Gerencia de Contrataciones</div></td>
    <td></td>
      </tr>
	  
  


  
  
  
  
</table>
    <p>&nbsp;</p>
</body>

</html>
