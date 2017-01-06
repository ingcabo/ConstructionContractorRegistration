

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- INICIO DE COPIA !-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin t&iacute;tulo</title>
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/css/mainstyle2.css" type="text/css" />
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/SNC.css" type="text/css">
<script type="text/javascript" src="<?php  echo base_url(); ?>system/application/js/general.js"></script>

<!-- Inicio de: JS y CSS para el DataPick. -->
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/scripts.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar-es.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar-setup.js"></script>

<link media="screen" href="<?php echo base_url(); ?>system/application/js/calendario/styles/calendar-blue.css" rel="stylesheet" type="text/css" title="win2k-cold-1">
<link media="print" href="<?php echo base_url(); ?>system/application/js/calendario/styles/print.css" rel="stylesheet" type="text/css" title="win2k-cold-1">
<!--    Fin de: JS y CSS para el DataPick. -->



<script type="text/javascript" src="<?php  echo base_url(); ?>system/application/menu/stmenu.js"></script>
<script type="text/javascript" src="<?php  echo base_url(); ?>system/application/views/select_dependientes.js"></script>
<script languaje="javascript">

function limpiar(){

form.valorid.value=0;

}


window.onerror=function(m,u,l)
{
	window.status = "Java Script Error: "+m;
	return true;
}


function muestra_oculta(id){
if (document.getElementById){ //se obtiene el id
var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
el.style.display = (el.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div
}
}
window.onload = function(){/*hace que se cargue la función lo que predetermina que div estará oculto hasta llamar a la función nuevamente*/
muestra_oculta('contenido_a_mostrar');/* "contenido_a_mostrar" es el nombre de la etiqueta DIV que deseamos mostrar */
muestra_oculta('cont')
}
//-->




function habilitaDeshabilita(form)

{

    if (form.comisario.checked == true)

    {

     form.acc.disabled         = true;
     form.rp.disabled          = true;
     form.JDir.disabled        = true;
	 form.porc.disabled        = true;
	 form.cargac.disabled      = true;
	
	 form.profesion.disabled   = false;
	 form.numcole.disabled     = false;
	 form.vigen.disabled       = false;
	
	
	//s1.disabled = true; 
	
	

    }

 

    if (form.comisario.checked == false)

    {

    form.acc.disabled = false;
    form.rp.disabled = false;
    form.JDir.disabled = false;
	form.cargac.disabled = false;

	form.profesion.disabled= true;
	form.numcole.disabled = true;
	form.vigen.disabled = true;
	
	
	
	

    }

 

}


function habilitaselect(form)

{

    if (form.acc.checked == false)

    {

    form.porc.disabled = true;
    
	
	//s1.disabled = true; 
	
	
    }

 

    if (form.acc.checked == true )

    {

    form.porc.disabled = false;
    	

    }
	
	

 

}
</script>

</head>

<body bgcolor="#FFFFFF" text="#000000" link="#0066FF" vlink="#9933FF" alink="#FF3333">
<div> <iframe src="<?php  echo base_url(); ?>system/application/views/header.php" width="100%" height="245px" frameborder="0" scrolling="no"> </iframe></div>

<div class="bodywrap">
<div class="bodyinfo">
  
  <table width="764" height="227" border="1">
  <tr>
    <td width="171"><?php echo "numero de Registro:".$valorpk;?></td>
    <td width="185">&nbsp;</td>
    <td width="221">&nbsp;</td>
    <td width="95">&nbsp;</td>
    <td width="132">&nbsp;</td>
  </tr>
  <tr>
    <td><b>Datos Generales </b></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>R.I.F.</td>
    <td>R.N.C</td>
    <td>Nombre o Raz&oacute;n Social </td>
    <td>Siglas</td>
    <td>Tipo de Empresa</td>
  </tr>
  <tr>
    <td><?php echo $fila['con_numero_rif']; ?> </td>
    <td><?php echo $fila['con_numero_rnc']; ?> </td>
    <td><?php echo $fila['con_nombre']; ?></td>
    <td><?php echo $fila['con_siglas']; ?></td>
    <td><?php echo $fila['ctp_descripcion']; ?></td>
  </tr>
  <tr>
    <td>Fecha Inscripci&oacute;n R.N.C </td>
    <td>Fecha Vencimiento R.N.C </td>
    <td>Calificacion Financiera </td>
    <td>Tipo de Firma </td>
    <td>Nivel Financiero </td>
  </tr>
  <tr>
    <td><?php echo $fila['con_fecha_inscripcion_rnc']; ?></td>
    <td><?php echo $fila['con_fecha_vencimiento_rnc']; ?></td>
    <td><?php echo $fila['con_calificacion_financiera']; ?></td>
    <td><?php echo $fila['con_tipo_firma']; ?></td>
    <td><?php echo $fila['nfs_nivel']; ?></td>
  </tr>
  <tr>
    <td>Capacidad Financiera </td>
    <td>&nbsp; </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
  <td><?php echo $fila['con_capacidad_financiera']; ?></td>
  </tr>
</table>
<table width="764" height="152" border="1">
  <tr>
    <td width="208"><b>Datos Cooperativa y Empresa</b> </td>
    <td width="169">&nbsp;</td>
    <td width="182">&nbsp;</td>
    <td width="120">&nbsp;</td>
    <td width="50">&nbsp;</td>
  </tr>
  <tr>
    <td>Objeto de la Contratista </td>
    <td>Tiempo de la Cooperativa </td>
    <td>Duracion de la Cooperativa </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><?php echo $fila['con_objeto_cooperativa']; ?></td>
    <td><?php echo $fila['tpc_nombre']; ?></td>
    <td><?php echo $fila['con_duracion_cooperativa']; ?></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>Objeto Social </td>
    <td>Tipo de la Cooperativa </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><?php echo $fila['con_objeto_social_cooperativa']; ?></td>
    <td><?php echo $fila['con_tiempo_cooperativa']; ?></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="764" height="156" border="1">
  <tr>
    <td width="208"><b>Dirección</b></td>
    <td width="169">&nbsp;</td>
    <td width="182">&nbsp;</td>
    <td width="120">&nbsp;</td>
    <td width="49">&nbsp;</td>
  </tr>
  <tr>
    <td>Estado</td>
    <td>Municipio </td>
    <td>Ciudad </td>
    <td>Email</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><?php echo $fila['est_nombre']; ?></td>
    <td><?php echo $fila['mun_nombre']; ?></td>
    <td><?php echo $fila['ciu_nombre']; ?></td>
    <td><?php echo $fila['con_email']; ?></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="25">Codigo Postal </td>
    <td>Direccion </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td><?php echo $fila['con_codigo_postal']; ?></td>
    <td colspan="2" rowspan="2"><?php echo $fila['con_direccion_fiscal']; ?></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="764" height="70" border="1">
  <tr>
    <td width="298" height="32"><b>Numeros contactos</b> </td>
    <td width="79">&nbsp;</td>
    <td width="182">&nbsp;</td>
    <td width="120">&nbsp;</td>
    <td width="52">&nbsp;</td>
  </tr>
  <tr>
    <td height="30">Con una Funcion para que sean dinamicos!!!!!!! </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="764" height="230" border="1">
  <tr>
    <td width="208"><b>Datos Legales </b></td>
    <td width="169">&nbsp;</td>
    <td width="174">&nbsp;</td>
    <td width="122">&nbsp;</td>
    <td width="66">&nbsp;</td>
  </tr>
  <tr>
    <td>Número de Registro Mercantil </td>
    <td>Denominacion Comercia </td>
    <td>Circunscripción Judicial </td>
    <td>Fecha Inscripcion </td>
    <td>Número Inscripción</td>
  </tr>
  <tr>
    <td><?php echo $fila_lg['clg_numero_registro']; ?></td>
    <td><?php echo $fila_lg['dec_descripcion']; ?></td>
    <td><?php echo $fila_lg['clg_circunscripcion_judicial']; ?></td>
    <td><?php echo $fila_lg['clg_fecha_inscripcion']; ?></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="25">Numero de Tomo </td>
    <td>Folio</td>
    <td>Fecha Constitutiva </td>
    <td>Cierre Fiscal </td>
    <td>Capital Suscripto </td>
  </tr>
  <tr>
    <td><?php echo $fila_lg['clg_numero_tomo']; ?></td>
    <td ><?php echo $fila_lg['clg_numero_folio']; ?></td>
    <td><?php echo $fila_lg['clg_fecha_constitutiva']; ?></td>
    <td><?php echo $fila_lg['clg_cierre_fiscal_actual']; ?></td>
	<td><?php echo $fila_lg['clg_capital_social_suscrito']; ?></td>
  </tr>
  <tr>
    <td>Capital Social Pagado </td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
	<td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
   <tr>
    <td><?php echo $fila_lg['clg_capital_social_pagado']; ?></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
	<td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="23">Objeto Social </td>
    <td>&nbsp;</td>
    <td>Domicilio Legal </td>
	<td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><?php echo $fila_lg['clg_objeto_social']; ?></td>
    <td colspan="3"><?php echo $fila_lg['clg_domicilio_legal_actual']; ?></td>
	</tr>
</table>
<table width="764" height="28"  border="1">
  <tr>
    <td width="217"><b>Areas</b></td>
    <td width="542"><b>Especialidades</b></td>
   </tr>
   
   <tr>
    <td width="217">
	       
        </td>
			
    <td width="542">
	<?php 
	
	$can_areas = $this->db->count_all('areas_objeto'); //cantidad de tipos de especialidades es un  numerico
	 

$parametro = 0;


while ($parametro <= $can_areas) {
                    $this->db->where('aob_areas_objeto_pk',$parametro);
                    $query_areas = $this->db->get('vis_contrstistas_areas_objeto');
				    $area = $query_areas->row();
				     
					   if($area == true){ 
					  
					    echo "<tr>"."<td>".$area->aob_nombre."</td>";				
						
						
						$consulta = $this->db->query('select epo_nombre from vis_contrstistas_areas_objeto where aob_areas_objeto_pk ='.$area->aob_areas_objeto_pk.' and con_contratistas_pk='.$valorpk.'');
						
						echo "<td>";
						foreach ($consulta->result() as $fila)
                          {
                            echo $fila->epo_nombre.", ";

                            }
						
			                echo "</td>";
					
						echo "</tr>";
					   } 
				   else{
				   echo "";
				   }
				   $parametro++;
				   }
                    

   ?>   	</td>
	</tr>
  </table>
<table width="764" height="28"  border="1">
  <tr>
    <td width="109"><strong>Personas</strong></td>
    <td width="109">&nbsp;</td>
  </tr>
  <!-- una consulta -->
  <!--fin de la consulta-->
  <tr>
    <td width="109">R.I.F</td>
    <td width="109">Cedula</td>
	  <td width="202">Nombre</td>
    <td width="160">Cargo Actual</td>
	  <td width="164">Descripción</td>
    
	
  </tr>
   <tr>
    <?php foreach($query_persona_legal->result() as $row): ?>
          <?php  echo "<tr>"; ?>
<?php echo "<td>"; ?> <?php echo $row->pnt_rif_personal; ?> <?php echo "</td>"; ?> 
<?php echo "<td>"; ?> <?php echo $row->pnt_cedula_de_identidad; ?> <?php echo "</td>"; ?>
 <?php echo "<td>"; ?> <?php echo $row->pnt_nombres."  ".$row->pnt_apellidos; ?> <?php echo "</td>"; ?> 
 <?php echo "<td>"; ?> <?php echo $row->ajr_cargo_actual; ?> <?php echo "</td>"; ?> <?php echo "<td>"; ?>
 
 <?php
			
			if ($row->ajr_accionista == 't'){
			 $cad1 = "Accionista,  ";}else{$cad1= "";}
			
			if ($row->ajr_representante_legal == 't'){
			 $cad2 = "Representante Legal,  ";} else{$cad2= "";}
			 
			if ($row->ajr_miembro_junta_directiva  == 't'){
			 $cad3 = "Directivo,  ";}else{$cad3= "";} 
			
			  $string= $cad1.$cad2.$cad3;
			  
			
              $string = substr ($string, 0, strlen($string) - 1);

             echo $string; // esto muestra "Cadena a recorta"

			 ?>
          <?php echo "</td>"; ?>
          <?php  echo "</tr>"; ?>
		  <!--fin de persona accionista-->
	          <?php endforeach; ?>
      
	  
	  	  <!-- inicio de consulta comisario-->
		  
		  <?php foreach($query_comisario->result() as $row_comi): ?>
		    <?php  echo "<tr>"; ?>
           <?php echo "<td>"; ?> <?php echo $row_comi->pnt_rif_personal; ?> <?php echo "</td>"; ?> 
		   <?php echo "<td>"; ?> <?php echo $row_comi->pnt_cedula_de_identidad; ?> <?php echo "</td>"; ?> 
		   <?php echo "<td>"; ?> <?php echo $row_comi->pnt_nombres."  ".$row_comi->pnt_apellidos; ?> <?php echo "</td>"; ?>
		  <?php echo "<td>"; ?>
		  
		  <?php 
		     if ($row_comi->con_contratistas_fk <> ''){
			 $reslt = "Comisario  ";}else{$reslt= "";}
			 echo $reslt;
			
			 ?>
		  	  
		  <?php echo "</td>"; ?>
		  
		   <?php endforeach; ?>	
  </tr>
</table>

</div>

</div>


</body>
</html>
