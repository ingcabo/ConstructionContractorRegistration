<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php $this->mod_usuario->en_session(); ?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<title>..:: REGCO ::.. Solvencia</title>
<style>

.Estilo1 {
	font-size: 12px;
	font-weight: bold;
	font-family: Arial;
}


.Estilo2 {font-size: 12px;
          font-family: Arial;
          margin: 5px;
}

.Estilo3 {font-size: 12px;
          font-family: Arial; }

.Estilo4 {font-size: 6px;
          font-family: Arial; }

body,td,th {
	font-family: Arial;
	font-size: 12px;
}
</style>
</head>

<body>
<table width="616" border="0" cellpadding="0" cellspacing="0" >
  <!--DWLayoutTable-->
  <tr>
    <td width="136" height="48" valign="top"><img src="<?=base_url();?>system/application/imagenes/logogoberzulia.jpg" width="136" height="45" /></td>
    <td width="348" valign="top"><div align="center" stylo="font-size: 16px; font-weight: bold; font-family: Arial;">REPÚBLICA BOLIVARIANA DE VENEZUELA<br />
      GOBERNACIÓN DEL ESTADO ZULIA<br />
    SECRETARÍA DE INFRAESTRUCTURA</div></td>
    <td width="135" valign="top"><img src="<?=base_url();?>system/application/imagenes/logosiez.jpg" width="132" height="43" /></td>
  </tr>
  <tr>
  <td colspan="3" class="Estilo4">Código de Seguridad: <?php if(isset($con_codigo_siez)) {echo md5(substr($con_codigo_siez,4));}?></td>
  </tr>
</table>
<br />
<table width="598" border="0" cellpadding="0" cellspacing="0" style="border:#666666 solid 1px; ">
  <!--DWLayoutTable-->
  <tr>
    <th height="20" colspan="4" valign="top" bgcolor="#CCCCCC"><span class="Estilo1">Certificado de Solvencia</span></th>
  <th width="5">&nbsp;</th>
  </tr>
  <tr>
    <td width="238"  rowspan="2" valign="top"><span class="Estilo1">Nº Inscripción:&nbsp;&nbsp;</span>
    <span class="Estilo2"><?=isset($con_codigo_siez)?trim($con_codigo_siez):'';?>
    </span></td>

    <td width="66" height="19"></td>
    <td width="83">&nbsp;</td>
    <td width="214" align="left" valign="top"><span class="Estilo1">Fecha de Vencimiento:&nbsp;&nbsp;</span>
    <span class="Estilo2"><?=isset($fecha_vencimiento)?$this->mylib_base->pg_to_human($fecha_vencimiento):'';?>
    </span></td>
  <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="1"></td>
    <td></td>
    <td rowspan="2" align="left" valign="top"><span class="Estilo1">Fecha de Expedición:&nbsp;&nbsp;</span>
    <span class="Estilo2"><?=isset($date)?$this->mylib_base->pg_to_human($date):'';?>
    </span></td>
  <td></td>
  </tr>
  <tr>
    <td height="19"></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
  
  <tr>
    <td height="19"  colspan="4" valign="top" bgcolor="#CCCCCC"><!--DWLayoutEmptyCell-->&nbsp;</td>
  <td>&nbsp;</td>
  </tr>
  <tr>
    <td  height="20"  colspan="4" valign="top"><span class="Estilo1">Nombre: </span>
      <span class="Estilo2"><?=isset($con_nombre)?$con_nombre:'';?></span></td>
  <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="20" valign="top" ><span class="Estilo1">Siglas:&nbsp;&nbsp;</span>
    <span class="Estilo2"><?=isset($con_siglas)?$con_siglas:'';?></span></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td valign="middle"><span class="Estilo1">Nº RIF: </span>
      <span class="Estilo2"><?=isset($con_numero_rif)?$con_numero_rif:'';?></span></td>
  <td>&nbsp;</td>
  </tr>
  <tr>
    <td  height="20" valign="top"><span class="Estilo1">Tipo de Firma:&nbsp;</span>
    <span class="Estilo2"><?=isset($tpf_descripcion)?$tpf_descripcion:'';?></span></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td valign="top"><span class="Estilo1">Nivel:&nbsp;</span>
    <span class="Estilo2"><?=isset($nivel)?$nivel:'';?></span></td>
  <td>&nbsp;</td>
  </tr>
  <tr>
    <td  height="20" valign="top"><span class="Estilo1">Especialidad:&nbsp;</span>
    <span class="Estilo2"><?=isset($cod_especialidad)?$cod_especialidad:'';?></span></td>
  <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td  height="19"  colspan="4" valign="top" bgcolor="#CCCCCC"><!--DWLayoutEmptyCell-->&nbsp;</td>
  <td>&nbsp;</td>
  </tr>
  <tr>
    <td  height="19"  valign="middle" class="Estilo1">Representante (s) Legal (es):</td>
    <td width="50"  valign="middle" class="Estilo1">Cédula:</td>
    <td width="60"  valign="middle" class="Estilo1">Cargo:</td>
    <td>&nbsp;</td>
  </tr>
  
  
  <?php
     foreach($this->arr_rep_leg  as $filas){
	 ?>
  <tr>
    <td  height="19" valign="top"><?=isset($filas['nombre'])?$filas['nombre']:'';?></td>
    <td width="50" valign="top"><?=isset($filas['pnt_cedula_de_identidad'])?$filas['pnt_cedula_de_identidad']:'';?></td>
    <td width="60" colspan="2" valign="top"><?=isset($filas['ajr_cargo_actual'])?$filas['ajr_cargo_actual']:'';?></td>
    <td>&nbsp;</td>
  </tr>
  <?php
     }
    ?>
  
  <tr>
    <td  height="49"></td>
    <td></td>
    <td></td>
    <td valign="bottom"><div align="center" class="Estilo1">Firma Autorizada y Sello<br /> 
    Gerencia de Contrataciones</div></td>
  <td></td>
  </tr>
  <tr>
    <td  height="3"></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
</table>
    <p>&nbsp;</p>
</body>

</html>
