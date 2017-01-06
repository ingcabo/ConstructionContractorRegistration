<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Observaciones del Contratista</title>
<style type="text/css">

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

.Estilo1 {color: #FFFFFF}
.Estilo3 {
	color: #FFFFFF;
	font-family: "Times New Roman", Times, serif;
	font-weight: bold;
}
</style>
</head>

<body>

<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <th><img src="<?=base_url();?>system/application/imagenes/logogoberzulia.jpg" width="137" height="45" /></th>
    <th><div align="center" class="style1 Estilo1">REPÚBLICA BOLIVARIANA DE VENEZUELA<br />
      GOBERNACIÓN DEL ESTADO ZULIA<br />
    SECRETARÍA DE INFRAESTRUCTURA</div></th>
    <th><img src="<?=base_url();?>system/application/imagenes/logosiez.jpg" width="141" height="48" /></th>
  </tr>
</table>
<br />
<table width="600" border="0" cellspacing="0" cellpadding="0">
  <!--DWLayoutTable-->
  <tr>
    <th height="14" colspan="2" bgcolor="#CCCCCC" scope="col"><div align="center" class="style1"><strong>OBSERVACIONES RECAUDOS </strong></div></th>
  </tr>
  <tr>
    <td height="140" colspan="2" class="style2"><br />El Certificado de Solvencia de la Contratista <em><strong><?=isset($obser[0]['con_nombre'])?$obser[0]['con_nombre']:'';?></strong></em>,
	cuyo Nro. de RIF <em><strong><?=isset($obser[0]['con_numero_rif'])?$obser[0]['con_numero_rif']:'';?></strong></em>, no ha podido ser emitido por falta o no
	vigencia de los siguientes recaudos:<br /> </td>
  </tr>
  <tr>
  <td height="19" colspan="2" valign="top" bgcolor="#0066FF"><span class="Estilo3">Descripción del Recaudo</span> </td>
  </tr>
  <?php
   foreach($obser as $fobser){
  ?>
  <tr>
    <td height="17" colspan="2" valign="top"><font color="#FF0000" face="Times New Roman, Times, serif"><?=$fobser['svr_descripcion']?></font></td>
  </tr>
  <?php }?>
  <tr>
    <td width="344" height="41">&nbsp;</td>
    <td width="256"></td>
  </tr>
  <tr>
    <td height="19">&nbsp;</td>
    <td valign="top">________________________________</td>
  </tr>
    
    <tr>
      <td height="28">&nbsp;</td>
      <td valign="top"><div align="center" class="style1">Firma Autorizada y Sello<br />
      Gerencia de Contrataciones</div></td>
  </tr>
</table>
</body>
</html>
