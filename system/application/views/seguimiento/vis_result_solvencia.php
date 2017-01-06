
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- INICIO DE COPIA !-->


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<?php $this->mod_usuario->en_session(); ?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin t&iacute;tulo</title>
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/css/mainstyle2.css" type="text/css" />

<!-- Inicio de: JS y CSS para el DataPick. -->
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/scripts.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar-es.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar-setup.js"></script>

<link media="screen" href="<?php echo base_url(); ?>system/application/js/calendario/styles/calendar-blue.css" rel="stylesheet" type="text/css" title="win2k-cold-1">
<link media="print" href="<?php echo base_url(); ?>system/application/js/calendario/styles/print.css" rel="stylesheet" type="text/css" title="win2k-cold-1">
<!--    Fin de: JS y CSS para el DataPick. -->


<script type="text/javascript" src="<?php  echo base_url(); ?>system/application/js/general.js"></script>

<script type="text/javascript" src="<?=base_url();?>system/application/views/js_menu/stmenu.js"></script>



 
<?php   echo  $xajax_js; ?>		  
		  

</head>







<body bgcolor="#FFFFFF" text="#000000" link="#0066FF" vlink="#9933FF" alink="#FF3333">
<div>
<?php echo $this->vismenu; ?>
</div>

<div class="bodywrap">
<div class="bodyinfo">
<?php echo form_open('con_result_solvencia/solvencia'); ?>
<?php 
		                        $cadenafecha = "%Y-%m-%d";
                                $tiempo = time();
                                $factual = mdate($cadenafecha, $tiempo); 
                                 
          ?>
 <input type="hidden" name="factual" maxlength="10" size="10" value="<?php echo $factual; ?>"/>
<input type="hidden" name="valorpk" value="<?php if($valorpk != '') {echo $valorpk;} else {echo '0';}; ?>">

<?php $consulta = $this->db->query('select * from vis_recaudos_transito where con_contratistas_fk = '.$valorpk.'and (eva_estatus = 3 or eva_estatus = 5)'); ?>

<?php if ($consulta->num_rows() > 0){ ?>
<table width="800" align="center" cellpadding="0" cellspacing="0" bordercolor="0">

	<tr>
	<td colspan="4" align="center"><label><b>Observaci&oacute;n de Recaudos de la Contratista</b></label></td>
	</tr>
	<tr><td width="157">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
	<tr>
		<td>Número de Inscripción:</td>
	<td width="201"><div class="casilla" style=" width:200px"><?php echo $fila_c['con_codigo_siez']; ?></div></td>
	<td width="242" align="center">Siglas de la Contratista :</td>
	<td width="200"><div class="casilla" style=" width:200px"><?php echo $fila_c['con_siglas']; ?></div></td>
	</tr>
	 <tr>
	<td>&nbsp;<br /></td>
	<td width="201">&nbsp;</td>
	<td width="242" align="center">&nbsp;</td>
	<td width="200">&nbsp;</td>
	</tr>
	  <tr>
	<td>&nbsp;<br /></td>
	<td width="201">&nbsp;</td>
	<td width="242" align="center">&nbsp;</td>
	<td width="200"><?php echo anchor('con_reportes/rep_observaciones/'.$valorpk, '<img alt="Datos Legales" src="'.base_url().'system/application/imagenes/boton_print.gif" width="100" height="20" border="0" title="Datos Legales">' );  ?></td>
	</tr>
	</table>

<br />
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#eaeaea" class="tableform" >
  
  <tr>
  <td class="bgtitle">
  Documentos Faltantes
  </td>
  <tr>
  <?php foreach($query_recaudo_transito_pass->result() as $row): ?>
 <tr>
 <td>
<font color="#FF0000"><?php echo $row->svr_descripcion; ?></font><font color="#000000">&nbsp;<?php echo "*";  ?>
 </td>
 </tr>
 
 <?php endforeach; ?>
 <tr>
 <td>

 
 </td>
 </tr>
  
</table>
<?php  }else{   ?>


<table width="300" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#eaeaea" class="tableform" >
  <?php   
             $cadenafecha = "%Y";
             $tiempo = time();
             $periodo = mdate($cadenafecha, $tiempo); 
              
			       
			
						        
          ?>
		  <input type="hidden" name="periodo" id="periodo" maxlength="10"  size="10" value="<?php echo set_value('periodo',isset($periodo)?$periodo:'');?>" />
  <tr>
    <td class="bgtitle" align="center"> <div id="2" align="center"> Aviso</div></td>
    </tr> 
  <tr>
    <td><div align="center">La Contratista está Solvente </div></td>
	
    </tr>
	<tr>
	
	<td>Fecha de Vencimiento:
	  <input type="text" name="dFecMenor" id="dFecMenor" maxlength="10" size="10" value="<?php echo set_value('dFecMenor',isset($dFecMenor)?$dFecMenor:'');?>"   onblur=" xajax_alerta(this.value);" />
	  
        <img name="dFecMenorCalendario" id="dFecMenorCalendario" src="<?php echo base_url(); ?>system/application/js/calendario/images/calendar.gif" width="16" height="16" />
        <!-- Inicio de: Iniciar DataPick. -->
        <script type="text/javascript">
		var campoId = 'dFecMenor';
		var imagenId = 'dFecMenorCalendario';
		
		
		iniciarCalendario(campoId, imagenId,'%d-%m-%Y', false);
		</script><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('dFecMenor'); ?> </font></span>
	</td>
	</tr>
  <tr>
    <td><div align="center"><input type="submit" value="Generar Certificado de Solvencia" class="botontemp" /></div></td>
    </tr>
  <tr>
    <td><div align="center">
      <?php echo anchor('Con_consult_solv', '<img alt="Salir" src="'.base_url().'system/application/imagenes/back_menu.gif" width="125" height="18" border="0" title="Salir">' );  ?>
    </div></td>
    </tr>
	<tr>
	<td>
	
	</td>
	</tr>
</table>


<?php  } ?>

<?php echo form_close(); ?>

<?php
    	/*  	  
		  $a = array();
		  		   	 */  
			  
		   ?>
		  
		  	  
		     <?php     
			/* 
			 
			$consulta = $this->db->query('select * from vis_recaudos_transito where con_contratistas_fk = '.$valorpk.'and (eva_estatus = 4 )'); 
				
						
			  if ($consulta->num_rows() < 0){
							         
                  
			
					
			    }else{
                        $consulta_para = $this->db->query('select * from vis_recaudos_transito where con_contratistas_fk = '.$valorpk );
			            foreach ($consulta_para->result() as $row_2){
					    
						if($row_2->eva_fecha_vencimiento <= 0 ){
						$a[$row_2->svr_solvencias_recaudos_fk] = '2020-12-01';
						}else{
						$a[$row_2->svr_solvencias_recaudos_fk] = $row_2->eva_fecha_vencimiento;
						}
						 
						
				             	                    
	    	                                                       }
      		   
			     $count =  count($a);	
				 
				if ($count <= 0){
				
				return false;
				
				}else{
				
           
                   $Valor_Maximo_Numero = min($a); //Obtengo el valor más alto


                 //    echo $Valor_Maximo_Numero; 					
						
				
				

				
				      } 		    
			}
			
			    
		 */
		  
		      ?>




</div>
</div>
</body>
</html>


