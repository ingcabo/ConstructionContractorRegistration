<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- INICIO DE COPIA !-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin t&iacute;tulo</title>
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/css/mainstyle2.css" type="text/css" />
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/SNC.css" type="text/css">
<script type="text/javascript" src="<?php  echo base_url(); ?>system/application/js/general.js"></script>

<script type="text/javascript" src="<?php  echo base_url(); ?>system/application/menu/stmenu.js"></script>

<script type="text/javascript">
<!--
window.onerror=function(m,u,l)
{
	window.status = "Java Script Error: "+m;
	return true;
}






</script>




<style type="text/css">
<!--
.Estilo1 {font-family: Tahoma;
	font-size: 24px;
}
-->
</style>
</head>

<body bgcolor="#FFFFFF" text="#000000" link="#0066FF" vlink="#9933FF" alink="#FF3333">
<div> <iframe src="<?php  echo base_url(); ?>system/application/views/header.php" width="100%" height="245px" frameborder="0" scrolling="no"> </iframe></div>


  
  
  
<script type="text/javascript">


	var strOrderby = "";
	var strGroupby = "";
	var blnPrimera = true;
	
function agregar_o()
{
	if(document.frmsolvencia.cmbsele.selectedIndex >= 0)
	{
		var optNuevo = document.createElement('option');
		optNuevo.text = document.frmsolvencia.cmbsele.options[document.frmsolvencia.cmbsele.selectedIndex].text;
		optNuevo.value = document.frmsolvencia.cmbsele.options[document.frmsolvencia.cmbsele.selectedIndex].value;

		var elSel = document.frmsolvencia.cmbselected;
		try 
		{
    		elSel.add(optNuevo, null); // standards compliant; doesn't work in IE
            document.frmsolvencia.cmbsele.remove(document.frmsolvencia.cmbsele.selectedIndex);
  		}
  		catch(ex) 
		{
    		elSel.add(optNuevo); // IE only
			document.frmsolvencia.cmbsele.remove(document.frmsolvencia.cmbsele.selectedIndex);
		
			//Formar la cadena del Ordenar
			strOrderby+=String(optNuevo.value)+", ";
  		}
		blnPrimera = true;
	}
	else alert("No hay ningun elemento seleccionado");
	
}

function eliminar_o()
{
	
	if(document.frmsolvencia.cmbselected.selectedIndex >= 0)
	{
		var optNuevo = document.createElement('option');

		optNuevo.text = document.frmsolvencia.cmbselected.options[document.frmsolvencia.cmbselected.selectedIndex].text;
		optNuevo.value = document.frmsolvencia.cmbselected.options[document.frmsolvencia.cmbselected.selectedIndex].value;
	
		var elSel = document.frmsolvencia.cmbsele;
		//var elSelAgrupar = document.frmsolvencia.cmbDisAgrupar;
		try 
		{
    		elSel.add(optNuevo, null); // standards compliant; doesn't work in IE
            document.frmsolvencia.cmbselected.remove(document.frmsolvencia.cmbselected.selectedIndex);
  		}
  		catch(ex) 
		{
    		elSel.add(optNuevo); // IE only
			document.frmsolvencia.cmbselected.remove(document.frmsolvencia.cmbselected.selectedIndex);
			//Formar la cadena del Ordenar
			strOrderby=strOrderby.replace(optNuevo.value+", ", "");
  		}
		blnPrimera = true;
	}
	else alert("No hay ningun elemento seleccionado");
}


//-->
</script>
</head>
<div class="bodywrap">
<div class="bodyinfo">
<div class="headerbox">
<body class="f">
<form name="frmsolvencia" id="frmsolvencia" method="post">

<div align="center">
<table width="950px" border="0" cellpadding="0" cellspacing="0">
  
</table>

  </div></td>
	</tr>
	<table width="602" cellpadding="0" cellspacing="0" >
	<tr>
	  <td width="300" >&nbsp;</td>
	  <td width="300" >&nbsp;</td>
	  </tr>
	<tr bordercolor="#999999">
	  <td bgcolor="#DDDDDD"><div align="left"><strong><font size="4" >Campos  </font></strong></div></td>
	  <td bgcolor="#DDDDDD"><div align="left"><strong><font size="4" >Seleccion</font></strong></div></td>
	</tr>
	<tr bgcolor="#DDDDDD">
	  <td style="height:154px" bgcolor="#DDDDDD">
	  <select name="cmbsele" id="cmbsele" size="9" style="width:300px">
        <option value="1" id="1">UNo</option>
        <option value="2" id="2">Dos</option>
        <option value="3" id="3">Tres</option>
        <option value="4" id="4">Cuatrao</option>
        <option value="5" id="5">cinco</option>
        <option value="6" id="6">Seis</option>
        <option value="7" id="7">Siete</option>
      </select></td>

        <td style="height:154px" bgcolor="#DDDDDD">

     <select name="cmbselected" id="cmbselected" size="9" style="width:300px">

     </select></td>
	  </tr>
	<tr bgcolor="#DDDDDD">
	  <td colspan="2" bordercolor="#CCCCCC" bgcolor="#CCCCCC"><div align="center">
	      <input type="button" name="btnagregar" value="Agregar" style="width:100px" onClick="agregar_o()">
	      <input type="button" name="btneliminar" value="Eliminar" style="width:100px" onClick="eliminar_o()">
	  </div></td>
	  </tr>
  </table>
  
  
  <br />
  </td>
  
    <p>&nbsp;</p>
    <p>&nbsp;</p>
</form>
  
  
  
 




</body>
</html>

  
