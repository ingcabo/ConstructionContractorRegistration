<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<?php $this->mod_usuario->en_session(); ?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>..::Registro de Sucursales</title>
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/css/mainstyle2.css" type="text/css" />
<script type="text/javascript" src="<?=base_url();?>system/application/views/js_menu/stmenu.js"></script>
<script type="text/javascript" src="<?php  echo base_url(); ?>system/application/js/general.js"></script>

<script type="text/javascript">


function enviar_sucursal(op,pk){
 
		switch (op){
			
			
			
			case 1:{
			document.form_sucursal.action = "<?php echo base_url(); ?>index.php/con_consult_regco";
			document.form_sucursal.submit();
			break;
			}
			
			
			case 2:{
			document.form_sucursal.action ="<?php echo base_url(); ?>index.php/con_reg_6/index/"+pk+"/0/new";
			document.form_sucursal.submit();
			break;
			}
			
			case 3:{

            //document.form_contratos.action = "http://idyt38/regco/index.php/Con_reportes/rep_inscripcion/"+pk+"";
               window.open("<?php echo base_url(); ?>index.php/Con_reportes/rep_inscripcion/"+pk+"");
               document.form_sucursal.action = "<?php echo base_url(); ?>index.php/con_listview_Contratistas";
               document.form_sucursal.submit();
			break;
			}

        
             

		}	
			
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
<div>

<?php echo $this->vismenu; ?>
</div>

<div class="bodywrap">
<div class="bodyinfo">

<table width="800" border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td colspan="4" align="center"><label><b>Registro de las Sucursales de la Contratista</b></label></td>
	</tr>
	<tr><td width="157">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
	<tr>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <tr>
	<td>Número de Inscripción:</td>
	<td width="201"><div class="casilla" style=" width:200px"><?php echo $general['con_codigo_siez']; ?></div></td>
	<td width="242" align="center">Siglas de la Contratista :</td>
	<td width="200"><div class="casilla" style=" width:200px"><?php echo $general['con_siglas']; ?></div></td>
	</tr>
	</table>
	<br /><br />
<div class="headerbox"> 
      <?php $atributos = array('name' => 'form_sucursal')?>
      <?php echo form_open('con_reg_5/grabar',$atributos); ?>
      <?php   echo form_hidden('valorpk', $this->uri->segment(3));?>
      <input type="hidden" name="valorpk" value="<?php if($valorpk != '') {echo $valorpk;} else {echo '0';}; ?>">
	  <input type="hidden" name="valorid" value="<?php if($valorid != '') {echo $valorid;} else {echo '0';}; ?>">
	  <input type="hidden"  name="modo"   value="<?php if($modo != '')    {echo $modo;}    else {echo '0';}; ?>">
	 
      
	  <table  width="790" style="text-align:left" class="">
   
        <tr> 
          <td colspan="2" class="bgtitle"><label><b>Dirección</b></label> </td>
        </tr>
        <tr> 
          <td width="118" height="25"><label></label></td>
          <td width="272" height="25"> 
            <?php //echo "numero de Registro:".$valorpk;?>
			 <?php //echo "numero de Sucursal:".$valorid;?>
          <input type="hidden" name="valorpk" value="<?php if($valorpk != '') {echo $valorpk;} else {echo '0';}; ?>">          </td>
        </tr>
        <tr> 
          <td height="30"><label>Nombre Sucursal :</label></td>
          <td><input type="text" name="sucu" id="sucu" size="33" maxlength="50" value= "<?php echo $sucu; ?>"  />
         </td>
        <td width="316"><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('sucu'); ?> </font></span></td>
		<td width="64">&nbsp;</td>
		</tr>
        <tr> 
          <td height="21"><label></label></td>
          <td>&nbsp;</td>
		  <td>&nbsp;</td>
		  <td>&nbsp;</td>
        </tr>
        <tr> 
          <td height="30"><label>Dirección:</label></td>
          <td rowspan="2"><textarea rows="4" cols="30" name="dir"><?php echo $dir; ?></textarea>          </td>
		  <td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('dir'); ?> </font></span></td>
		  <td>&nbsp;</td>
        </tr>
        <tr> 
          <td height="30">&nbsp;</td>
        </tr>
        <tr> 
          <td></td>
        </tr>
      </table>
	  
	  <table width="465"> 
      <tr>
      <td class="bgtitle"><b>Números Contacto </b>      </td>
      </tr>
      </table>
<table width="710" height="26">
   
        <td width="137"></tr>

		 <?php 
		     	   	  
		  $a = array();
		  		   	   
		  $b = array();
		   ?>
		  
		  	  
		     <?php     
			 
			 
			$consulta = $this->db->query('select * from vis_contratistas_sucursales_telefonos where csu_contratistas_sucursales_pk ='.$valorid.'');
				
						
			if ($this->uri->segment(4) <= 0){
							         
                   
			
					
			}else{
			
			        foreach ($consulta->result() as $row_2){

				      $a[$row_2->ntt_numeros_telefonicos_tipo_fk] = $row_2->tls_codigo_area;
                      $b[$row_2->ntt_numeros_telefonicos_tipo_fk] = $row_2->tls_numero;



	    	       }
			 
			}
			
			    
		  
		  
		      ?>  
		
		
		 

		  
		  
		  
		  
		
		  
		
		  
		  <?php $consulta_tp = $this->db->query('select * from numeros_telefonicos_tipo order by ntt_numeros_telefonicos_tipo_pk') ?>
		  <?php  foreach ($consulta_tp->result() as $row): ?>
            
		   <?php  echo "<tr>"; ?>
		   <?php  echo "<td>"; ?> <?php echo $row->ntt_descripcion.":"; ?>  <?php  echo "</td>"; ?>    
		   <!--<?php // echo "<td>"; ?> <input type="text" name="pre_<?php //echo $row->ntt_numeros_telefonicos_tipo_pk; ?>" maxlength="4"  size="4"  value= "<?php //  if  (isset ($a[$row->ntt_numeros_telefonicos_tipo_pk])) {  echo $a[$row->ntt_numeros_telefonicos_tipo_pk]; } ?> "    onKeyPress="return SoloNumero(event)"/><?php // echo "</td>"; ?>-->
           <?php  echo "<td>"; ?> <input type="text" name="pre_<?=$row->ntt_numeros_telefonicos_tipo_pk; ?>" maxlength="5"  size="4"  value= "<?php if(isset($a[$row->ntt_numeros_telefonicos_tipo_pk])){ echo $a[$row->ntt_numeros_telefonicos_tipo_pk];}elseif(isset($_POST["pre_$row->ntt_numeros_telefonicos_tipo_pk"])){ echo $_POST["pre_$row->ntt_numeros_telefonicos_tipo_pk"];}else {echo '';} ?>"  onKeyPress="return SoloNumero(event)"/><?php  echo "</td>"; ?>
           <?php  echo "<td>"; ?> <input type="text" name="num_<?=$row->ntt_numeros_telefonicos_tipo_pk; ?>" maxlength="15"  size="9"  value= "<?php if(isset($b[$row->ntt_numeros_telefonicos_tipo_pk])){ echo $b[$row->ntt_numeros_telefonicos_tipo_pk];}elseif(isset($_POST["num_$row->ntt_numeros_telefonicos_tipo_pk"])){ echo $_POST["num_$row->ntt_numeros_telefonicos_tipo_pk"];}else {echo '';} ?>"  onKeyPress="return SoloNumero(event)"/><?php  echo "</td>"; ?>
		
		 
           
		   
		   <td colspan="2"> </td>
		   <td width="62">  </td>
		   <td width="118"> </td>
		   <td width="333"><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('num_'.$row->ntt_numeros_telefonicos_tipo_pk); ?> </font></span></td>
		   <td width="35">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
		   </tr>
           <?php endforeach; ?>  
		  
		   </tr>
	</table>     
<table width="479px"> 
    <tr>
    <td class="bgtitle"><b></b></td>   
    </tr>
    </table>
	  
	     <table width="800" border="0" cellpadding="0" cellspacing="0" >
      <tr>
        <th scope="col" align="right"><input type="submit" name="boton2" value="Guardar" onclick=""/>&nbsp;&nbsp;&nbsp;
		<?php if ($modo == 'edit'){?>
		
		
		<?php $modo = '/edit'; ?>
		
		
		<?php }else{ ?>
		<?php $modo = '/new'; ?>
		
		<input type="button" name="accion" value="Siguiente" onclick="enviar_sucursal(2,<?php echo $valorpk; ?>)" />&nbsp;&nbsp;&nbsp;
		<input type="button" name="imp" value="Finalizar" onclick="enviar_sucursal(3,<?php echo $valorpk; ?>)" />
		<?php // echo  anchor('con_reg_6/index/'.$valorpk.'/0/new', '<img alt="Siguiente" src="'.base_url().'system/application/imagenes/boton_continuar.gif" border="0">' );  ?>
		<?php } ?>		<!--	<input type="button" name="fin" value="Finalizar" onclick="enviar_sucursal(1)" /> -->		</th>
      </tr>
    </table>
	  
	  
	  
	  
	  
	  <div class="corner1"> </div>
	  <div class="corner2"> </div>
      <div class="corner3"> </div>
      <div class="corner4"> </div>



</div>


<div class="tablein_1">

	  <table width="860" class="bgceldas">
	  
<tr class="bgtitle">
<th width="166">Nombre</th>
<th width="325"><frame name="compose" src="http://BY2M6-WM5.webmessenger.msn.com/session//compose.aspx?s=b49e488f406dd61cd05dd69e7080c707000000050021d514&amp;ChatID=2238533&amp;focus=false" noresize="noresize" scrolling="no">
  Dirección</th>
<th width="208">Teléfonos</th>
<th width="40"></th>

</tr>

  <?php 
	
	
	$consulta = $this->db->query('select * from vis_max_min_vis_contratistas_sucursales_telefonos');
$fila2 = $consulta->row_array();    	

$can_areas = $fila2['max'];
$parametro = $fila2['min'];
	

	
	
	//$can_areas = $this->db->count_all('vis_contratistas_sucursales_telefonos'); //cantidad de tipos de especialidades es un  numerico
    $parametro = 0;

                    while ($parametro <= $can_areas){
                           $this->db->where('csu_contratistas_sucursales_pk',$parametro);
						   $this->db->where('con_contratistas_fk',$valorpk);
						   $this->db->where('csu_activo','t');
						   
                           $query_areas = $this->db->get('vis_contratistas_sucursales_telefonos');
				           $area = $query_areas->row();
				     
					       if($area == true){ 
					  
					            echo "<tr>"."<td>".$area->csu_descripcion."</td>";				
					            echo "<td>".$area->csu_direccion."</td>";
								
								
				 		        $consulta = $this->db->query('select * from vis_contratistas_sucursales_telefonos where csu_contratistas_sucursales_pk ='.$area->csu_contratistas_sucursales_pk.' and con_contratistas_fk='.$valorpk);
						
					           	echo "<td>";
						        foreach ($consulta->result() as $fila){
                                       if($fila->tls_codigo_area > 0){
                                          echo "(".$fila->tls_codigo_area.")"." ";
								       }else{
								               echo "";
								            }   
                                      echo $fila->tls_numero."<br>";
                                          
                               }
							   
							   
							   
			                      echo "</td>";

                                  echo "<td>";
						        //foreach ($consulta->result() as $fila){


                             echo anchor('con_reg_5/grabar/'.$valorpk.'/'.$fila->csu_contratistas_sucursales_pk.$modo, '<img alt="Modificar" src="'.base_url().'system/application/imagenes/edit.png" border="0">');
                               echo "  ";
							    $attr = array('onclick'=>"return confirm('¿Esta seguro de borrar este registro?');"); 

                              echo anchor('con_reg_5/eliminar/'.$valorpk.'/'.$fila->csu_contratistas_sucursales_pk.$modo, '<img alt="Eliminar" src="'.base_url().'system/application/imagenes/delete.png" border="0">',$attr)."<br>";

                             //  }
			                      echo "</td>";

					
				        	      echo "</tr>";
					        }else{
				                   echo "";
				                 }
				    $parametro++;
				   }//fin del while
                    
	
		     
	
	
	
	
	
		     
                      ?>   
	
	
                  
  
  
</table>
</div>

</div>
<div class="bgfooter"> <div class="footerimage"> </div></div>
</div>


</body>
</html>

