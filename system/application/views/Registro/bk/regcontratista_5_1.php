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

<div class="bodywrap">
<div class="bodyinfo">
  <div class="headerbox"> 
      <?php $atributos = array('name' => 'form_sucursal')?>
      <?php echo form_open('con_reg_5/grabar',$atributos); ?>
      <?php   echo form_hidden('valorpk', $this->uri->segment(3));?>
      <input type="hidden" name="valorpk" value="<?php if($valorpk != '') {echo $valorpk;} else {echo '0';}; ?>">
	  <input type="hidden" name="valorid" value="<?php if($valorid != '') {echo $valorid;} else {echo '0';}; ?>">
 
 
 
 
 <table  width="465" height="223"  style="text-align:left" class="">
        <tr> 
          <td></td>
        </tr>
        <tr> 
          <td class="bgtitle"><label><b>Dirección</b></label></td>
          <td>&nbsp; </td>
        </tr>
        <tr> 
          <td width="138" height="25"><label></label></td>
          <td width="315" height="25"> 
            <?php echo "numero de Registro:".$valorpk;?>
            <input type="hidden" name="valorpk" value="<?php if($valorpk != '') {echo $valorpk;} else {echo '0';}; ?>"> 
          </td>
        </tr>
        <tr> 
          <td height="30"><label>Nombre Sucursal :</label></td>
          <td> <input type="text" name="sucu" id="sucu" maxlength="15" value= "<?php echo $sucu; ?>" onBlur="upperCase(this.id)" /> 
          </td>
        </tr>
        <tr> 
          <td height="21"><label></label></td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td height="30"><label>Direccion:</label></td>
          <td rowspan="2"><textarea rows="4" cols="30" name="dir"><?php echo $dir; ?> </textarea> 
          </td>
        </tr>
        <tr> 
          <td height="30">&nbsp;</td>
        </tr>
        <tr> 
          <td></td>
        </tr>
      </table>
      <table width="292" height="64">
        <tr> 
          <td width="280" class="bgtitle"><label><b>Números Contacto</b></label></td>
        <tr><td height="10"></td><td width="75"></td>
        </tr>
        </tr>
		
		
		
		
		
		
		  <?php 
		     	   	  
		  $a = array();
		  		   	   
		  $b = array();
		   ?>
		  
		  
		  
		     <?php     
			 
			 $consulta = $this->db->query('select * from vis_contratistas_sucursales_telefonos where csu_contratistas_sucursales_pk ='.$valorid.'');
			
			/*  foreach ($consulta->result() as $row_2){

				        $a[$row_2->ntt_numeros_telefonicos_tipo_fk] = $row_2->tls_codigo_area;
                        $b[$row_2->ntt_numeros_telefonicos_tipo_fk] = $row_2->tls_numero;

	    	   
	    	     }*/
		  
		      ?>  
		  
		  
		  
		  
		  <?php
		  
		   
		  
		  
		  foreach ($query_telef->result() as $row): ?>
            
		   <?php  echo "<tr>"; ?>
		   <?php  echo "<td>"; ?> <?php echo $row->ntt_descripcion.":"; ?>  <?php  echo "</td>"; ?>    
		   <?php  echo "<td>"; ?> <input type="text" name="pre_<?php echo $row->ntt_numeros_telefonicos_tipo_pk; ?>" maxlength="4"  size="4"  value= "<?php   if  (isset ($a[$row->ntt_numeros_telefonicos_tipo_pk])) {  echo $a[$row->ntt_numeros_telefonicos_tipo_pk]; } ?> "   onKeyPress="return SoloNumero(event)"/><?php  echo "</td>"; ?>
		   <?php  echo "<td>"; ?> <input type="text" name="num_<?php echo $row->ntt_numeros_telefonicos_tipo_pk; ?>" maxlength="9"  size="10"  value= "<?php  if (isset ($b[$row->ntt_numeros_telefonicos_tipo_pk])) { echo $b[$row->ntt_numeros_telefonicos_tipo_pk]; } ?> "    onKeyPress="return SoloNumero(event)"/><?php  echo "</td>"; ?>
		   <?php  echo "</tr>"; ?>
           <?php endforeach; ?>  
		   <tr><td><br></td> <td></td></tr>
	  </table>
	  <table width="392" height="29">
      <tr><td width="97"><input type="submit" name="boton" value="Agregar" onClick=""/>  </td>
      <td width="181">&nbsp;</td>
	  <td width="98">&nbsp;</td>
      </tr></table>
   
       <p>&nbsp;</p>
      <div class="corner1"> </div>

	  
<div class="corner2"> </div>

<div class="corner3"> </div>
<div class="corner4"> </div>



</div>


<div class="tablein_1">

	  <table width="681" class="bgceldas">
	  
<tr class="bgtitle">
<th width="100">Nombre</th>
<th width="200">Direccion</th>
<th width="100">Telefonos</th>
<th width="25"></th>

</tr>

  <?php 
	
	
	$consulta = $this->db->query('select * from vis_max_min_vis_contratistas_sucursales_telefonos');
$fila2 = $consulta->row_array();    	

$can_areas = $fila2['max'];
$parametro = $fila2['min'];
	

	
	
	//$can_areas = $this->db->count_all('vis_contratistas_sucursales_telefonos'); //cantidad de tipos de especialidades es un  numerico
    $parametro = 0;

                    while ($parametro < $can_areas){
                           $this->db->where('csu_contratistas_sucursales_pk',$parametro);
						   $this->db->where('con_contratistas_fk',$valorpk);
                           $query_areas = $this->db->get('vis_contratistas_sucursales_telefonos');
				           $area = $query_areas->row();
				     
					       if($area == true){ 
					  
					            echo "<tr>"."<td>".$area->csu_descripcion."</td>";				
					            echo "<td>".$area->csu_direccion."</td>";
								
								
				 		        $consulta = $this->db->query('select * from vis_contratistas_sucursales_telefonos where csu_contratistas_sucursales_pk ='.$area->csu_contratistas_sucursales_pk.' and con_contratistas_fk='.$valorpk.'');
						
					           	echo "<td>";
						        foreach ($consulta->result() as $fila){

                                echo "(".$fila->tls_codigo_area.")"." ";   
                                echo $fila->tls_numero."<br>";
                                          
                               }
							   
							   
							   
			                      echo "</td>";

                                  echo "<td>";
						        //foreach ($consulta->result() as $fila){


                             echo anchor('con_reg_5/grabar/'.$valorpk.'/'.$fila->csu_contratistas_sucursales_pk, '<img alt="Editar" src="'.base_url().'system/application/imagenes/edit.png" border="0">');
                               echo "  ";
							    $attr = array('onclick'=>"return confirm('¿Esta seguro de borrar este registro?');"); 

                              echo anchor('con_reg_5/eliminar/'.$valorpk.'/'.$fila->csu_contratistas_sucursales_pk, '<img alt="Eliminar" src="'.base_url().'system/application/imagenes/delete.png" border="0">',$attr)."<br>";

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

</div>


</body>
</html>

