<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- INICIO DE COPIA !-->


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<?php $this->mod_usuario->en_session(); ?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Documento sin t&iacute;tulo</title>
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/css/mainstyle2.css" type="text/css" />




<script type="text/javascript" src="<?php  echo base_url(); ?>system/application/js/general.js"></script>

<script type="text/javascript" src="<?=base_url();?>system/application/views/js_menu/stmenu.js"></script>



 
		  
<script type="text/javascript">		  


window.onerror=function(m,u,l)
{
	window.status = "Java Script Error: "+m;
	return true;
}






</script>

<?PHP

// consulta para sacar los id de areas
$this->db->select('epo_especialidad_objeto_pk,epo_nombre');
//$this->db->where('aob_areas_objeto_fk', $row->aob_areas_objeto_pk);
$consultaid = $this->db->get('especialidad_objeto');



?>


<?php echo '<script type="text/javascript">';

      echo 'function  objClick(checkbox){';
			
	  echo 'if (!checkbox.checked)';
	  echo 'switch(checkbox.name)'; 
	  echo '{';


                     foreach ($consultaid->result() as $row_id):
                     //echo "<br>";
                     echo 'case "area_'.$row_id->epo_especialidad_objeto_pk;
                     echo '":';
                    // echo "<br>";
                    // echo 'alert(/"document.getElementById(radio_1)/")';
					 echo 'document.getElementById("radio_'.$row_id->epo_especialidad_objeto_pk;
                     echo '").checked = false;';
                     echo 'break;';
					 endforeach;

      echo '}';
      echo '}'; 
      echo '</script>'; ?>


<?php echo '<script type="text/javascript">';

				echo 'function objPrinClick(radio){';
					echo 'var f = document.form_area;';
					echo 'if (radio.checked)';
					echo 'switch (radio.value)';
					echo '{';
                    $this->db->select('epo_especialidad_objeto_pk,epo_nombre');
                   $consultaid = $this->db->get('especialidad_objeto');

                     foreach ($consultaid->result() as $row_id):
                     //echo "<br>";
							echo 'case "'.$row_id->epo_especialidad_objeto_pk;
                            echo '":';
							echo 'f.area_'.$row_id->epo_especialidad_objeto_pk;
                            echo '.checked = true;';
							echo 'break;';

                            endforeach;
								

            echo	'}';
			echo	'}';


echo '</script>'; ?>


</head>

<body bgcolor="#FFFFFF" text="#000000" link="#0066FF" vlink="#9933FF" alink="#FF3333">
<div>
 <?php echo $this->vismenu; ?>
</div>

<div class="bodywrap">
<div class="bodyinfo">

<table width="768" border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td colspan="4" align="center"><label><b>Registro de Actividades de la Contratista</b></label></td>
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
	<br>
    <?php $atributos = array('name' => 'form_area')?>
      <?php echo form_open('con_reg_3/ingreso_areas_contratista',$atributos); ?>
      <?php   echo form_hidden('valorpk', $this->uri->segment(3));?>
       <input type="hidden"   name="valorpk" value="<?php if($valorpk != '') {echo $valorpk;} else {echo '0';}; ?>">
	   <input type="hidden"   name="modo"    value="<?php echo $modo; ?>">
      <div class="headerbox"> 
	  
	  
	  <?php



			        $consulta = $this->db->query('select * from vis_contrstistas_areas_objeto where con_contratistas_pk ='.$valorpk.'');

						 $a = array();
				         $b= array();


			           foreach ($consulta->result() as $row_3){

                       if($row_3->epo_especialidad_objeto_pk > 0 ){

					         $a[$row_3->epo_especialidad_objeto_pk] = 'checked';
					  }else{

					         $a[$row_3->epo_especialidad_objeto_pk] = '';
					    }

					 // echo $a[$row_3->epo_especialidad_objeto_pk]."==".$row_3->epo_especialidad_objeto_pk."<br>";


					  if($row_3->epo_especialidad_objeto_pk > 0  and $row_3->eac_principal == 't'){

					  $b[$row_3->epo_especialidad_objeto_pk] = 'checked';

					  }else{

					  $b[$row_3->epo_especialidad_objeto_pk] = '';

					  }

					// echo $b[$row_3->epo_especialidad_objeto_pk]."==".$row_3->epo_especialidad_objeto_pk."<br>";

					  }


		      ?>  


	  
	  
	  

    <table width="800" border="0" cellspacing="0" cellpadding="0" style="line-height:22px">
  
  <tr>
    <td width="267">&nbsp;</td>
    <td colspan="2"><?php // echo "numero de Registro:".$valorpk;?></td>
    <td width="275">&nbsp;</td>
  </tr>
  
  <tr>
    <td colspan="4" class="bgtitle"><b>Áreas y Especialidades</b></td>
    </tr>
  <tr>
    <td><?php
                                                
     $this->db->select('aob_areas_objeto_pk,aob_nombre');
     $consulta = $this->db->get('areas_objeto');
       ?>
       
       </td>
    <td colspan="2"><b>Principal</b></td>
    <td>&nbsp;</td>
	
	
  </tr>
   
  										<?php foreach ($consulta->result() as $row): ?>

                                      
                                         <?PHP

                                        // consulta a especialidad de las areas objeto
                                           $this->db->select('epo_especialidad_objeto_pk,epo_nombre');
                                           $this->db->where('aob_areas_objeto_fk', $row->aob_areas_objeto_pk);
                                           $consulta2 = $this->db->get('especialidad_objeto');
                                           ?>
                                               
                      <tr>
                        <td><b><?php echo  $row->aob_nombre;?></b></td>
                        <td colspan="2">&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>

  
  
  
  
  
  
  
  
  
  
    <?php foreach ($consulta2->result() as $row2): ?>
  <tr>
    <td><input type="checkbox" name="<?php echo "area_".$row2->epo_especialidad_objeto_pk; ?>"   value="<?php echo $row2->epo_especialidad_objeto_pk; ?>" <?php if(isset($a[$row2->epo_especialidad_objeto_pk])) echo $a[$row2->epo_especialidad_objeto_pk]; else  echo ''; ?> onClick="objClick(this)" />
      
	  <?php echo $row2->epo_nombre; ?></td>
	  
    <td width="60" style="text-align:center"><input name="radio" align="center" id="radio_<?php  echo $row2->epo_especialidad_objeto_pk; ?>" value ="<?php  echo $row2->epo_especialidad_objeto_pk; ?>"  <?php if(isset($b[$row2->epo_especialidad_objeto_pk])) echo $b[$row2->epo_especialidad_objeto_pk]; else  echo ''; ?>  onclick="objPrinClick(this)" type="radio" /></td>
   
    <td width="198" style="text-align:center">&nbsp;</td>
    
	<td>&nbsp;</td>
 
  </tr>
    <?php endforeach; ?>            
                                    
    <?php endforeach; ?>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2">&nbsp;</td>
    <td><?php  //echo  // anchor('con_reg_4/reg_form/'.$valorpk, '<img alt="Siguiente" src="'.base_url().'system/application/imagenes/taza.gif" border="0">' );  ?></td>
  </tr>
</table>

<br>
<div align="right">
        <input name="submit" type="submit"  value="Guardar y Continuar"/>
      </div>
      <div class="corner1"> </div>
<div class="corner2"> </div>
<div class="corner3"> </div>
<div class="corner4"> </div>
</div>         
				
	
    
    	      <?php echo form_close(); ?></div>
              <div class="bgfooter"> <div class="footerimage"> </div></div>
</div>


</body>
</html>






