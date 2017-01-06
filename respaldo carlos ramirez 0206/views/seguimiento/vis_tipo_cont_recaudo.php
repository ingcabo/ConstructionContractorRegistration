

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- INICIO DE COPIA !-->


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<?php //$this->mod_usuario->en_session(); ?>
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

</head>


<body bgcolor="#FFFFFF" text="#000000" link="#0066FF" vlink="#9933FF" alink="#FF3333">
<div>
<?php echo $this->vismenu; ?>
</div>

<div class="bodywrap">
<div class="bodyinfo">



<?php echo form_open('Con_tipo_cont_recaudo/grabar'); ?>

 <table width="800px" border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td colspan="4" align="center"><label><b>Actualización de Recaudos de la Contratista </b></label></td>
	</tr>
	<tr><td width="157">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
	<tr>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <tr>
	<td>Número de Inscripción:</td>
	<td width="201"><div class="casilla" style=" width:200px"><?php echo $fila_c['con_codigo_siez']; ?></div></td>
	<td width="242" align="center">Siglas de la Contratista :</td>
	<td width="200"><div class="casilla" style=" width:200px"><?php echo $fila_c['con_siglas']; ?></div></td>
	</tr>
	</table>
 
 
<table class="tableform3" width="800px;">
<tr>
    <th colspan="3">Listado de Recaudos </th>
	
	<?php   
             $cadenafecha = "%d-%m-%Y";
             $tiempo = time();
             $factual = mdate($cadenafecha, $tiempo); 
              
			       
			  
			 
						        
          ?>
		  <?php   
             $cadenafecha = "%Y-%m-%d";
             $tiempo = time();
             $fact = mdate($cadenafecha, $tiempo); 
              
			       
			
						        
          ?>
		  <input type="hidden" name="factual" value="<?php echo $factual; ?>" />
		  <input type="hidden" name="fact"    value="<?php echo $fact; ?>" />
		  <?php $valorpk = $this->uri->segment(3); ?>
		  
		  <input type="hidden" name="valorpk" value="<?php if($valorpk != '') {echo $valorpk;} else {echo '0'; }; ?>">
		  
		
		   <?php 
		     	   	  
		  $a = array();
		  		   	   
		  $b = array();
		  
		  $c = array();
		  
		   ?>
		  
		  	  
		     <?php     
			 
			 
			$consulta = $this->db->query('select * from vis_recaudos_transito where con_contratistas_fk = '.$valorpk.'and (eva_estatus = 3 or eva_estatus = 5)');
				
						
			  if ($consulta->num_rows() < 0){
							         
                   $fecha_emi = '0';
			
					
			  }else{
                        $consulta_para = $this->db->query('select * from vis_recaudos_transito where con_contratistas_fk = '.$valorpk );
			            foreach ($consulta_para->result() as $row_2){
					 
				             	if($row_2->eva_estatus == '2' or $row_2->eva_estatus == '3' or $row_2->eva_estatus == '6'){
					
				                     	$a[$row_2->svr_solvencias_recaudos_fk] = $row_2->eva_fecha_vencimiento;
				                        $b[$row_2->svr_solvencias_recaudos_fk] = 'checked';
					                    $c[$row_2->svr_solvencias_recaudos_fk] = $row_2->eva_fecha_emision;
					                    
					 
					            }else{
					
				                     	$b[$row_2->svr_solvencias_recaudos_fk] = '';
					
					                  }
                   
	    	      
				           }

                       

          
	
			     
			    
			}

            if ($consulta->num_rows() < 0){
                 $fecha_emi = min($c);
            }else{

                  $fecha_emi = $fact;

            }
          //  echo $fecha_emi;
		     	
			 // if (isset($c)){$fecha_emi = $c[1];}else{ $fecha_emi ='0';}
			    
		  
		      ?>
		  <?php // $fecha_emi = now(); ?>
		 <input type="hidden" name="fecha_emi" value="<?php if($fecha_emi != '') {echo $fecha_emi; } else {echo $fact; }; ?>" />
    </tr>
	
<?php foreach ($query->result() as $row): ?>

<tr>
<td width="669"><?php // echo "chk_".$row->svr_solvencias_recaudos_fk; ?><input type="checkbox" name="<?php echo "chk_".$row->svr_solvencias_recaudos_fk; ?>"  value="<?php echo $row->svr_solvencias_recaudos_fk; ?>" <?php if(isset($b[$row->svr_solvencias_recaudos_fk])) echo $b[$row->svr_solvencias_recaudos_fk]; else  echo ''; ?>  />


<?php if ($row->srt_obligatorio == 't'){ $ast= '*';}else{$ast= '';}?>
<?php echo $row->svr_descripcion; ?><span class="fontnormal"><font color="#FF0000"><?php echo $ast;  ?></font></span>
</td>
<td width="119"> 
<?php if($row->svr_tiene_vencimiento== 't' ){ ?>
   Vencimiento:      
<input type="text" name="<?php echo "fcv_".$row->svr_solvencias_recaudos_fk; ?>" id="<?php echo "fcv_".$row->svr_solvencias_recaudos_fk; ?>"  maxlength="10" readonly="readonly"  size="10"  
 value= "<?php if(isset($a[$row->svr_solvencias_recaudos_fk])){ echo $this->mylib_base->pg_to_human($a[$row->svr_solvencias_recaudos_fk]);}elseif(isset($_POST["fcv_$row->svr_solvencias_recaudos_fk"])){ echo $this->mylib_base->pg_to_human($_POST["fcv_$row->svr_solvencias_recaudos_fk"]);}else {echo '';} ?>"  />
 <img name="<?php echo "img_".$row->svr_solvencias_recaudos_fk; ?>" id="<?php echo "img_".$row->svr_solvencias_recaudos_fk; ?>" src="<?php echo base_url(); ?>system/application/js/calendario/images/calendar.gif" width="16" height="16">
   
 <script type="text/javascript">
 iniciarCalendario('<?php echo "fcv_"; ?><?php echo $row->svr_solvencias_recaudos_fk; ?>', '<?php echo "img_".$row->svr_solvencias_recaudos_fk; ?>','%d-%m-%Y',false);
  </script>
	

	     <?php }else{
		        
				
				} ?>

</td>
</tr>	  

<?php endforeach; ?> 
<tr>
  <td>
 
</td>
  <td> <input name="submit" type="submit"  value="Aplicar"/></td></tr>
<tr>
    <th colspan="2"  class="bgtitle" style="text-align:center">(<span class="important">*</span>) Recaudos Obligatorio</th>
  </tr>
</table>


  <?php echo form_close(); ?>    






</div>
</div>
</body>
</html>


