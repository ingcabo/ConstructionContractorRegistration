<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Reporte de Contratistas</title>
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
.style2 {color: #FFFFFF}
.tableborder th {
border:#FFFFFF solid 1px;
}
.tableborder td {
border: #999999 solid 1px;
}
.Estilo1 {color: #000000}
.Estilo2 {font-size: 10px}
</style></head>

<body>
<table width="1154" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td width="180" height="70"><img src="<?=base_url();?>system/application/imagenes/logogoberzulia.jpg" width="180" height="70" /></td>
    <td width="794" valign="middle"><div align="center" class="style1">REPÚBLICA BOLIVARIANA DE VENEZUELA<br />
      GOBERNACIÓN DEL ESTADO ZULIA<br />
    SECRETARÍA DE INFRAESTRUCTURA</div></td>
    <td width="180" valign="top"><img src="<?=base_url();?>system/application/imagenes/logosiez.jpg" width="180" height="70" /></td>
  </tr>
</table>
<br /><table width="1153" border="0" cellpadding="0" cellspacing="0" style="border:#666666 solid 1px;" class="tableborder">
  <!--DWLayoutTable-->
  <tr>
    <th height="20" colspan="6" valign="top"><div align="center" class="style1">Reporte de Contratistas</div> </th>
    <th colspan="5" valign="top" ><div align="center" class="style1">Fecha:&nbsp;<?php echo mdate('%d/%m/%Y',now());?> </div></th>
  </tr>
    <tr>
    <th width="94" height="30"  bgcolor="#466FD5" class="style1 style2 Estilo1">Nº Inscripción</th>
    <th width="132" bgcolor="#466FD5" class="style1 style2 Estilo1">Razón social</th>
    <th width="67" valign="top"  bgcolor="#466FD5" class="style1 style2 Estilo1">Siglas Empresa</th>
    <th width="63" valign="middle"  bgcolor="#466FD5" class="style1 style2 Estilo1">Nro. Rif</th>
    <th width="90" align="center" valign="middle"  bgcolor="#466FD5"  class="style1 style2 Estilo1">Nro. RNC</th>
    <th width="95" valign="top"  bgcolor="#466FD5"  class="style1 style2 Estilo1">Estatus Empresa</th>
    <th width="140" valign="top"  bgcolor="#466FD5"  class="style1 style2 Estilo1">Calificación Financiera</th>
    <th width="132" valign="top"   bgcolor="#466FD5"  class="style1 style2 Estilo1">Capacidad Financiera</th>
    <th width="91" valign="top"   bgcolor="#466FD5"  class="style1 style2 Estilo1">Nivel  Contratación</th>
    <th width="172" align="center" valign="middle"  bgcolor="#466FD5" class="style1 style2 Estilo1">Dirección</th>
    <th width="101" valign="middle"  bgcolor="#466FD5" class="style1 style2 Estilo1">Teléfonos</th>
    </tr>

   <?php
     foreach($query as $fila){
   ?>
    <tr>

      <td height="38" valign="top"  class="style1 style2 Estilo1 Estilo2"><a href="con_reportes/ficha" target="_blank"><a href="<?=base_url();?>index.php/con_RepConstructor/rep_ficha/<?=$fila['con_contratistas_pk'];?>" target="_blank"><?=$fila['con_codigo_siez'];?></a></td>
      <td valign="top"  class="style1 style2 Estilo1 Estilo2"><?=$fila['con_nombre'];?></td>
      <td valign="top"  class="style1 style2 Estilo1 Estilo2"><?=$fila['con_siglas'];?></td>
      <td valign="top"  class="style1 style2 Estilo1 Estilo2"><?=$fila['con_numero_rif'];?></td>
      <td valign="top"   class="style1 style2 Estilo1 Estilo2"><?=$fila['con_numero_rnc'];?></td>
      <td align="center" valign="top"   class="style1 style2 Estilo1 Estilo2"><?=$fila['ett_nombre'];?></td>
      <td align="center" valign="top"  class="style1 style2 Estilo1 Estilo2"><?=$fila['nfs_nivel'];?></td>
      <td align="center" valign="top"  class="style1 style2 Estilo1 Estilo2"><?=$fila['con_capacidad_financiera'];?></td>
      <td align="center" valign="top"  class="style1 style2 Estilo1 Estilo2"><?=$fila['con_calificacion_financiera'];?></td>
      <td valign="top"  class="style1 style2 Estilo1 Estilo2"><?=$fila['con_direccion_fiscal'];?></td>
      <td valign="top"  class="style1 style2 Estilo1 Estilo2"><?=isset($telefonos[$fila['con_contratistas_pk']])?$telefonos[$fila['con_contratistas_pk']]:'';?></td>
    </tr>
    <?php
     }
    ?>
    <tr>
      <td height="4"  class="style1 style2"></td>
      <td  class="style1 style2"></td>
      <td  class="style1 style2"></td>
      <td  class="style1 style2"></td>
      <td  class="style1 style2"></td>
      <td   class="style1 style2"></td>
      <td   class="style1 style2"></td>
      <td   class="style1 style2"></td>
      <td   class="style1 style2"></td>
      <td  class="style1 style2"></td>
      <td></td>
    </tr>
    

</table>
    <p>&nbsp;</p>
</body>

</html>
