<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<title>Untitled Document</title>
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
    <th height="20" colspan="2" valign="top" bgcolor="#CCCCCC" class="style1 style2">Recaudos a Consignar para <?=isset($tipo[0]['ctp_descripcion'])?$tipo[0]['ctp_descripcion']:''?></th>
    <td width="5"></td>
  </tr>
  <tr>
    <td width="438" height="19" align="center" valign="top" bgcolor="#00CCFF"><strong>Recaudos</strong></td>

    <td width="137" align="center" valign="top" bgcolor="#00CCFF"><strong>Obligatorio</strong></td>
    <td></td>
  </tr>
  <?php
     foreach($this->arr_rep_leg  as $filas){
	 ?>
  
  <tr>
    <td height="19" valign="top"><?=$filas['svr_descripcion'];?></td>
    <td align="center" valign="top"> <?php if($filas['srt_obligatorio']== 't') echo 'SI'; else echo 'NO'; ?> </td>
    <td></td>
  </tr>
   <?php
     }
    ?>

  <tr>
    <td height="234">&nbsp;</td>
    <td></td>
    <td></td>
  </tr>
     
	  

	  
  


  
  
  
</table>
    <p>&nbsp;</p>
</body>

</html>
