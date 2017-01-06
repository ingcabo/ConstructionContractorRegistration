<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- INICIO DE COPIA !-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<?php $this->mod_usuario->en_session(); ?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>.:: REGCO ::.. Relación de Obras</title>
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/css/mainstyle2.css" type="text/css" />

<script type="text/javascript" src="<?php  echo base_url(); ?>system/application/js/general.js"></script>

<!-- Inicio de: JS y CSS para el DataPick. -->
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/scripts.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar-es.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar-setup.js"></script>
<link media="screen" href="<?php echo base_url(); ?>system/application/js/calendario/styles/calendar-blue.css" rel="stylesheet" type="text/css" title="win2k-cold-1">
<link media="print" href="<?php echo base_url(); ?>system/application/js/calendario/styles/print.css" rel="stylesheet" type="text/css" title="win2k-cold-1">
<!--    Fin de: JS y CSS para el DataPick. -->
<script type="text/javascript" src="<?=base_url();?>system/application/views/js_menu/stmenu.js"></script>

<style type="text/css">
<!--
.Estilo1 {font-family: Tahoma;
	font-size: 24px;
}
-->
</style>
<script type="text/javascript">
function enviar_obras(op,pk){
 
		switch (op){
			
			
			
			case 1:{

            //document.form_contratos.action = "http://idyt38/regco/index.php/Con_reportes/rep_inscripcion/"+pk+"";
               window.open("<?php echo base_url(); ?>index.php/Con_reportes/rep_inscripcion/"+pk+"");
               document.form_contratos.action = "<?php echo base_url(); ?>index.php/con_listview_Contratistas";
               document.form_contratos.submit();
			break;
			}

            case 2:{

			document.form_contratos.action = "<?php echo base_url(); ?>index.php/con_consult_regco";
			document.form_contratos.submit();
			break;
			}

        
             

		}	
			
}
</script>


</head>

<body bgcolor="#FFFFFF" text="#000000" link="#0066FF" vlink="#9933FF" alink="#FF3333">
<div>
<?php echo $this->vismenu; ?>
</div>


<div class="bodywrap">

<div class="bodyinfo">
<table width="800px" border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td colspan="4" align="center"><label><b>Relación de Obras de la Contratista</b></label></td>
	</tr>
	<tr>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <tr><td width="157">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><tr>
	<td>Número de Inscripción:</td>
	<td width="201"><div class="casilla" style=" width:200px"><?php echo $fila['con_codigo_siez']; ?></div></td>
	<td width="242" align="center">Siglas de la Contratista :</td>
	<td width="200"><div class="casilla" style=" width:200px"><?php echo $fila['con_siglas']; ?></div></td>
	</tr>
	</table>
	<br /> <br />


    <div class="headerbox">
      <div class="corner1"> </div>
<div class="corner2"> </div>
<div class="corner3"> </div>
<div class="corner4"> </div>

<?php $atributos = array('name' => 'form_contratos', 'method'=>'post')?>
 <?php echo form_open('con_reg_6/grabar',$atributos); ?>



<table width="900" height="419">
  <!--DWLayoutTable-->
  <tr>
    <td width="115" height="40"><?php   echo form_hidden('valorpk', $this->uri->segment(3));?>
      <input type="hidden" name="valorpk" value="<?php if($valorpk != '') {echo $valorpk;} else {echo '0';}; ?>">
	  <input type="hidden" name="valorid" value="<?php if($valorid != '') {echo $valorid;} else {echo '0';}; ?>">
	  
	  <input type="hidden" name="select_tipoact" value="<?php if($select_tipoact != '') {echo $select_tipoact;} else {echo '0';}; ?>">
      <input type="hidden" name="select_orga"    value="<?php if($select_orga != '')    {echo $select_orga;}    else {echo '0';}; ?>">
	  <input type="hidden" name="select_estatus" value="<?php if($select_estatus != '') {echo $select_estatus;} else {echo '0';}; ?>">
 	  <input type="hidden" name="select_rendimientos" value="<?php if($select_rendimientos != '') {echo $select_rendimientos;} else {echo '0';}; ?>">
	  <input type="hidden"  name="modo"   value="<?php if($modo != '')    {echo $modo;}    else {echo '0';}; ?>">  	      </td>
    <td width="1">&nbsp;</td>
    <td width="1">&nbsp;</td>
    <td width="399">&nbsp;</td>
    <td width="61">&nbsp;</td>
    <td width="143">&nbsp;</td>
    <td width="111">&nbsp;</td>
    <td width="1">&nbsp;</td>
    <td width="15"></td>
    </tr>

  <tr>
    <td height="21" colspan="6" valign="top" class="bgtitle"><strong>Relación de Obras</strong></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
    </tr>
  <tr>
    <td height="10">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
  </tr>
<tr>
    <td height="24" colspan="3" valign="top">Número de Contrato:</td>
    <td  valign="top"><input type="text" name="numero" id="numero" value="<?php echo $numero; ?>" size="38" maxlength="100" /></td>
    <td colspan="3" valign="top"><span class="fontnormal"><font color="#FF0000"><?php echo form_error('numero'); ?></font></span></td>
	</tr>
<tr>
  <td height="24" colspan="3" valign="top">Cliente u Organismo:</td>
    <td valign="top">
  
      <select name="orga"  value="<?php echo $orga;?>" style="width:500px">
        <option value="<?php echo ""; ?>">Seleccione uno</option>
        <?php foreach ($query_organismos->result() as $row): ?>
        <?php if($row->org_organismos_pk == $select_orga){ ?>
        <option value="<?php echo $row->org_organismos_pk; ?>" <?php $this->form_validation->set_select('orga', $row->org_organismos_pk); ?>  selected="selected"> <?php echo $row->org_nombre; ?> </option>
        <?php   }else{ ?>
        <option value="<?php echo $row->org_organismos_pk; ?>" <?php $this->form_validation->set_select('orga', $row->org_organismos_pk); ?> > <?php echo $row->org_nombre; ?> </option>
        <?php  }  ?>
        <?php endforeach; ?>
      </select>     </td>
    <td colspan="3" valign="top"><span class="fontnormal"><font color="#FF0000"><?php echo form_error('orga'); ?></font></span></td>
	</tr>
<tr>
  <td height="15" colspan="3" valign="top">Tipo de Actividad:</td>
  <td  valign="top">

   <select  name="tipoact"   value="<?php echo $tipoact;?>" style="width:500px">
     <option value="<?php echo ""; ?>">Seleccione uno</option>
     <?php foreach ($query_tipo_actividad->result() as $row): ?>
     <?php if($row->tpa_tipo_actividad_pk == $select_tipoact){ ?>
     <option value="<?php echo $row->tpa_tipo_actividad_pk; ?>" <?php $this->form_validation->set_select('tipoact', $row->tpa_tipo_actividad_pk); ?> selected="selected"><?php echo $row->tpa_nombre; ?> </option>
     <?php   }else{ ?>
     <option value="<?php echo $row->tpa_tipo_actividad_pk; ?>" <?php $this->form_validation->set_select('tipoact', $row->tpa_tipo_actividad_pk); ?>><?php echo $row->tpa_nombre; ?> </option>
     <?php  }  ?>
     <?php endforeach; ?>
   </select>        </td>
  <td colspan="3" valign="top"><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('tipoact'); ?> </font></span></td>
  </tr>
<tr>
  <td height="24" colspan="3" valign="top">Fecha de Contrato:</td>
  <td colspan="3" valign="top"><input type="text" name="fecha" id ="fecha" size="12" maxlength="8" value="<?php echo $fecha; ?>" readonly="readonly">  
    <img name="dFC" id="dFC" src="<?php echo base_url(); ?>system/application/js/calendario/images/calendar.gif" width="16" height="16">
		<!-- Inicio de: Iniciar DataPick. -->
		<script type="text/javascript">
		var campoId = 'fecha';
		var imagenId = 'dFC';
		
		iniciarCalendario(campoId, imagenId,'%d-%m-%Y',false);
		</script> </td>
  <td>&nbsp;</td>
  <td></td>
  <td></td>
</tr>
<tr>
  <td height="24" colspan="2" valign="top">Rendimiento:</td>
  <td>&nbsp;</td>
  <td  valign="top"><select name="rendimiento" value="<?php echo $rendimiento; ?>" style="width:200px">
    <option value="<?php echo ""; ?>">Seleccione uno</option>
    <?php foreach ($query_rendimientos->result() as $row_rend): ?>
    <?php if($row_rend->ren_rendimientos_pk == $select_rendimientos){ ?>
    <option value="<?php echo $row_rend->ren_rendimientos_pk; ?>" <?php $this->form_validation->set_select('rendimiento', $row_rend->ren_rendimientos_pk); ?> selected="selected"> <?php echo $row_rend->ren_descripcion; ?> </option>
    <?php   }else{ ?>	
    <option value="<?php echo $row_rend->ren_rendimientos_pk; ?>"<?php $this->form_validation->set_select('rendimiento', $row_rend->ren_rendimientos_pk); ?> > <?php echo $row_rend->ren_descripcion ?> </option>
    <?php  }  ?>   
    <?php endforeach; ?>    		    
  </select></td>
  <td colspan="3" valign="top"><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('rendimiento'); ?> </font></span></td>
  </tr>
<tr>
  <td height="24" colspan="2" valign="top">Estatus:</td>
  <td>&nbsp;</td>
  <td  valign="top"><select name="estatus"  value="<?php echo $estatus;?>" style="width:200px">
    <option value="<?php echo ""; ?>">Seleccione uno</option>
    <?php foreach ($query_estatus->result() as $row_est): ?>
    <?php if($row_est->ett_estatus_pk == $select_estatus){ ?>
    <option value="<?php echo $row_est->ett_estatus_pk; ?>" <?php $this->form_validation->set_select('estatus', $row_est->ett_estatus_pk); ?> selected="selected"> <?php echo $row_est->ett_nombre; ?> </option>
    <?php   }else{ ?>
    <option value="<?php echo $row_est->ett_estatus_pk; ?>" <?php $this->form_validation->set_select('estatus', $row_est->ett_estatus_pk); ?> > <?php echo $row_est->ett_nombre; ?> </option>
    <?php  }  ?>
    <?php endforeach; ?>
  </select></td>
  <td colspan="3" valign="top"><span class="fontnormal"><font color="#FF0000"><?php echo form_error('estatus'); ?></font></span></td>
  </tr>
<tr>
  <td height="21" colspan="2" valign="top">Descripción:</td>
    <td>&nbsp;</td>
    <td colspan="2" rowspan="2" valign="top"><textarea id="descrip" name="descrip" rows="4" cols="30"><?php echo $descrip; ?></textarea></td>
    <td></td>
    <td></td>
    <td></td>
  <td></td>
</tr>
<tr>
  <td height="46">&nbsp;</td>
  <td>&nbsp;</td>
  <td>&nbsp;</td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
</tr>

<tr>
  <td height="69" colspan="2" valign="top">Observaciones:</td>
    <td>&nbsp;</td>
    <td colspan="2" valign="top">
	  <textarea id="obsv" name="obsv" rows="4" cols="30"><?php echo $obsv; ?></textarea>	</td>
    <td></td>
    <td></td>
    <td></td>
  <td></td>
</tr>
<tr>
  <td height="50"></td>
  <td></td>
  <td></td>
  <td></td>
  <td valign="top"><div align="right"><input type="submit" name="boton" value="Guardar" />
  </div></td>
  <td colspan="2" valign="top"><?php if ($modo == 'edit'){?>
	<?php $modo = '/edit'; ?>
	<input type="button" name="imp" value="Finalizar" onclick="enviar_obras(2)" />
		
		<?php }else{ ?>
		<?php $modo = '/new'; ?>
		<input type="button" name="imp" value="Finalizar" onclick="enviar_obras(1,<?php echo $valorpk; ?>)" />	
		<?php // echo anchor('con_consult_regco', '<img alt="Finalizar" src="'.base_url().'system/application/imagenes/Finalizar.gif" border="0">' );  ?>
		
		<?php } ?>	</td>
  <td></td>
  <td></td>
</tr>
<tr>
  <td height="16"></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
  <td></td>
</tr>
</table>
 <p><?php echo form_close(); ?></p>
 </div>

<div class="tablein_1">
<table width="860" class="bgceldas">
<tr class="bgtitle">
  <th width="218">Organismo</th>
  <th width="168">Tipo de Actividad </th>
  <th width="129">Fecha</th>
  <th width="108">Estatus</th>
  <th width="166">Rendimiento</th>
  <th width="43">&nbsp;</th>
</tr>
 
<?php foreach($query_contratos->result() as $row): ?>
<?php echo "<tr>"; ?>
<?php echo "<td>"; ?> <?php echo $row->org_nombre; ?> <?php echo "</td>"; ?> 
<?php echo "<td>"; ?> <?php echo $row->tpa_nombre; ?> <?php echo "</td>"; ?>
<?php echo "<td>"; ?> <?php echo $this->mylib_base->pg_to_human($row->ctt_fecha); ?> <?php echo "</td>"; ?> 
<?php echo "<td>"; ?> <?php echo $row->ett_nombre; ?> <?php echo "</td>"; ?>
<?php echo "<td>"; ?> <?php echo $row->ren_descripcion; ?> <?php echo "</td>"; ?>

<?php $attr = array(
'onclick'=>"return confirm('¿Esta seguro de borrar este registro?');"); ?>
       
	   

<?php echo "<td>"; ?><?php echo anchor('con_reg_6/grabar/'.$valorpk.'/'.$row->ctt_contratistas_contratos_pk.$modo, '<img alt="Modificar" src="'.base_url().'system/application/imagenes/edit.png" border="0">');?>&nbsp;&nbsp;<?php echo anchor('con_reg_6/eliminar/'.$valorpk.'/'.$row->ctt_contratistas_contratos_pk.$modo, '<img alt="Eliminar" src="'.base_url().'system/application/imagenes/delete.png" border="0">',$attr )?> <?php echo "</td>"; ?>
<?php  echo "</tr>"; ?>
<?php endforeach; ?>
</table>
   </div>
</div>
<div class="bgfooter"> <div class="footerimage"> </div></div>
</div>

</body>
</html>
