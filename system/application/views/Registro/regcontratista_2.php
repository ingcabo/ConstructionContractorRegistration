<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- INICIO DE COPIA !-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>.::Ingreso Documentos Legales::.</title>
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

<?php $this->mod_usuario->en_session(); ?>


<script type="text/javascript">
<!--
<!--
window.onerror=function(m,u,l)
{
	window.status = "Java Script Error: "+m;
	return true;
}

function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
}
//-->
function enviar_legal(op,pk){
 
		switch (op){
			case 1:{ 
                     alert('Operación Exitosa!!');
          
			document.form_legal.action =  "<?php echo base_url(); ?>index.php/con_consult_regco";
            document.form_legal.submit();
			break;
			}
			
			case 2:{
			document.form_legal.action = "<?php echo base_url(); ?>index.php/con_reg_3/index/"+pk+"/0/new";
			document.form_legal.submit();
			break;
			}

		}	
			
}

</script>



<style type="text/css">
<!--
.Estilo1 {	font-family: Tahoma;
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
   <?php $atributos = array('name' => 'form_legal')?>
  <?php echo form_open('con_reg_2/grabar',$atributos); ?>
    <input type="hidden" name="valorpk" value="<?php if($valorpk != '') {echo $valorpk;} else {echo '0';}; ?>">
	<input type="hidden" name="valorid" value="<?php if($valorid != '') {echo $valorid;} else {echo '0';}; ?>">
	<input type="hidden" name="campo" value="<?php if($campo != '') {echo $campo;} else {echo '0';}; ?>">
	<input type="hidden" name="var3" value="<?php if($var3 != '') {echo $var3;} else {echo '0';}; ?>">

	<input type="hidden"   name="modo"    value="<?php echo $modo; ?>">
   <input type="hidden" name="select_iddenomi" value="<?php if($select_iddenomi != '') {echo $select_iddenomi;} else {echo '0';}; ?>">

	<table width="800px" border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td colspan="4" align="center"><label><b>Registro de Datos Legales de la Contratista</b></label></td>
	</tr>
	<tr><td width="157">&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
	<tr>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <td>&nbsp;</td>
	  <tr>
	<td>Número de Inscripción:</td>
	<td width="201"><div class="casilla" style=" width:200px"><?php echo $fila['con_codigo_siez']; ?></div></td>
	<td width="242" align="center">Siglas de la Contratista :</td>
	<td width="200"><div class="casilla" style=" width:200px"><?php echo $fila['con_siglas']; ?></div></td>
	</tr>
	</table>
	
	<br />
	<table width="92%" border="0" cellspacing="0" cellpadding="0" height="10">
      <tr>
        <td></td>
        <th style="text-align:left"><label></label></th>
        <td width="0%"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="44%"><br /></td>
      </tr>
      <tr>
        <td class="bgtitle" ><lable><b>Información Legal de la Empresa</b></lable>
        </td>
        <td width="56%"></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td></td>
      </tr>
      <tr>
        <td><font color="#FF0000">
          <?php //echo validation_errors(); ?>
        </font></td>
      </tr>
<tr></tr>
	</table>
		
    
      
		
    <table width="88%" border="0" cellspacing="0" cellpadding="0" height="656">
      <tr>
        <td width="422"><?php // echo "numero de Registro:".$valorpk;?>        </td>
        <td width="261" ><?php 
		                        $cadenafecha = "%d-%m-%Y";
                                $tiempo = time();
                                $factual = mdate($cadenafecha, $tiempo); 
                                 
          ?>
            <input type="hidden" name="factual" maxlength="10" size="10" value="<?php echo $factual; ?>"/>
        <?php // echo "numero de Registro:".$valorid;?>        </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <?php
	        
		  $consulta_1 = $this->db->query('select * from vis_contratistas_legal  where  con_contratistas_fk = '.$valorpk.' and clg_modificacion =  false  and clg_contratistas_legal_pk = '.$valorid);
		  $consulta_2 = $this->db->query('select * from vis_contratistas_legal  where  con_contratistas_fk = '.$valorpk.' and clg_modificacion = false ');
		  if($consulta_1->num_rows() > 0){
		                  $var1='checked';
                          $var2='disabled';
		  
		  }else{
		          if($consulta_2->num_rows() > 0){
				           $var2='checked';
                           $var1='disabled';
				  }else{
				         
						  $var1='checked';
                          $var2='disabled';
				  }            
						  
						  
		       }
		                
	
			
			
	 ?>
     
  
<tr>
<td></td>
<td colspan="2">
 Registro Principal
  <input type="radio" name="radio" <?php echo $var1; ?>   value="1" <?php echo $this->form_validation->set_radio('radio', '1'); ?>   />
      Modificación
  <input type="radio" name="radio"  <?php echo $var2; ?>  value="2" <?php echo $this->form_validation->set_radio('radio', '2'); ?> /></td>
</tr>
  <tr>
    <td height="34"><label>Número Reg. Mercantil: </label></td>
    <td><input type="text" name="nummregm"  id="nummregm" maxlength="60" size="30"  value="<?php echo $nummregm; ?>"  <?php echo $var3; ?> /></td>
    <td colspan="3"><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('nummregm'); ?> </font></span> </td>
	 </tr>
  <tr>
  <td height="30">Circunscripción Judicial:  </td>
  <td><input type="text" name="idcrjud"  id="idcrjud" maxlength="40" size="25"  value="<?php echo $idcrjud;?>"  <?php echo $var3; ?> />  </td>
  <td colspan="3"><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('idcrjud'); ?>
            <!--  mensag individual de la validacion -->
    </font></span>  </td>
	 <td width="19">&nbsp;</td>
  </tr>
    <tr>
  <td height="30">Fecha Constitutiva:  </td>
  <td><input type="text" name="fchconsti" id="fchconsti" maxlength="12" size="12" value="<?php echo $fchconsti; ?>"   <?php echo $var3; ?> />
    <img name="Calendario" id="Calendario" src="<?php echo base_url(); ?>system/application/js/calendario/images/calendar.gif" width="16" height="16" />
            <!-- Inicio de: Iniciar DataPick. -->
            <script type="text/javascript">
		var campoId = '<?php echo $campo; ?>';
		var imagenId = 'Calendario';
		iniciarCalendario(campoId, imagenId,'%d-%m-%Y',false);
		</script>  </td>
  <td colspan="3"><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('fchconsti'); ?> </font></span>  </td>
   <td>&nbsp;</td>
  </tr>
 
  <tr>
    <td height="30"><label>Denominación Comercial:</label></td>
    <td><select name="iddenomi" value="<?php echo $iddenomi;?>" >
      <option value="<?php echo " "; ?>">Seleccione uno</option>
      <?php foreach ($query_denominacion->result() as $row): ?>
      <?php if($row->dec_denominacion_comercial_pk == $select_iddenomi){ ?>
      <option value="<?php echo $row->dec_denominacion_comercial_pk; ?>" selected="selected"><?php echo $row->dec_abreviatura; ?></option>
      <?php   }else{ ?>
      <option value="<?php echo $row->dec_denominacion_comercial_pk; ?>" ><?php echo $row->dec_abreviatura; ?></option>
      <?php  }  ?>
      <?php endforeach; ?>
    </select></td>
    <td colspan="3"><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('iddenomi'); ?> </font></span></td>
	 <td>&nbsp;</td>
  </tr>
 
  <tr>
    <td>Fecha Inscrip. Registro Mercantil: </td>
    <td><input type="text" name="finscrmer" id="finscrmer" maxlength="10" size="10"  value="<?php echo $finscrmer; ?>"   readonly="readonly" />
        <img name="dFCalendario" id="dFCalendario" src="<?php echo base_url(); ?>system/application/js/calendario/images/calendar.gif" width="16" height="16" />
        <!-- Inicio de: Iniciar DataPick. -->
        <script type="text/javascript">
		var campoId = 'finscrmer';
		var imagenId = 'dFCalendario';
		
		
		iniciarCalendario(campoId, imagenId,'%d-%m-%Y',false);
		</script></td>
    <td colspan="3"><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('finscrmer'); ?> </font></span></td>
	 <td>&nbsp;</td>
  </tr>
  <td height="30"><lable>Número Inscrip. Reg. Mercantil:</lable></td>
      <td><input type="text" name="numinsr" id="numinsr" maxlength="10" size="10" value="<?php echo $numinsr; ?>"  onkeypress="return SoloNumero(event)"  />      </td>
    <td colspan="3"><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('numinsr'); ?> </font></span></td>
	 <td>&nbsp;</td>
  <tr>
    <td></td>
    <td></td>
  </tr>
  <tr>
    <td height="30"><label>Número de Tomo:</label></td>
    <td><input type="text" name="tomo" id="tomo" maxlength="10" size="10"  value="<?php echo $tomo; ?>" /></td>
    <td colspan="3"><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('tomo'); ?> </font></span></td>
	<td>&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><label>Folio:</label></td>
    <td><input type="text" name="folio" id="folio" value="<?php echo $folio; ?>" maxlength="10" size="10"   /></td>
	
	  
    <td colspan="3"><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('folio'); ?> </font></span></td>
	 <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
       
      <tr>
        <td width="422"></td>
      </tr>
  <td height="31"><label>Cierre Fiscal: </label>  </td>
      <td width="261"><input type="text" name="ciefisc" id="ciefisc" value="<?php echo $ciefisc; ?>" maxlength="12" size="12" readonly="readonly" />
          <img name="fCalendario" id="fCalendario" src="<?php echo base_url(); ?>system/application/js/calendario/images/calendar.gif" width="16" height="16" />
          <!-- Inicio de: Iniciar DataPick. -->
        <script type="text/javascript">
		var campoId = 'ciefisc';
		var imagenId = 'fCalendario';
		iniciarCalendario(campoId, imagenId,'%d-%m-%Y',false);
		</script>      </td>
    <td colspan="3"></td>
  <tr>
    <td height="30">Capital Social Suscrito:</td>
    <td  height="30"><input type="text" name="capsocsuc" id="capsocsuc" style="text-align:right;"  maxlength="20" zise="15" onblur="puntitos(this,this.value.charAt(this.value.length-1),'2')"  value="<?php echo set_value('capsocsuc',isset($capsocsuc)?(number_format($capsocsuc, 0, "",".")):''); ?>"   onkeypress="return SoloNumero(event)" /></td>
    <td colspan="3"><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('capsocsuc'); ?> </font></span></td>
  </tr>
  <tr>
    <td height="30">Capital Social Pagado:</td>
    <td height="30"><input type="text" name="capsocpg" maxlength="20" zise="15" style="text-align:right;"   value="<?php echo set_value('capsocpg',isset($capsocpg)?(number_format($capsocpg, 0, "",".")):''); ?>"  onkeypress="return SoloNumero(event)"   onblur="puntitos(this,this.value.charAt(this.value.length-1),'2')" /></td>
    <td colspan="3"><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('capsocpg'); ?> </font></span></td>
  </tr>
  <tr>
    <td height="30">Número de Modificación: </td>
    <td><input type="text" name="nmodif" id="nmodif" maxlength="12" size="12"   value="<?php echo $nmodif; ?>" onkeypress="return SoloNumero(event)" /></td>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td height="30"></td>
    <td>&nbsp;</td>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><label>Objeto Social:</label>    </td>
    <td height="30" colspan="4" rowspan="2"><textarea name="objsc" id="objsc" cols="40" rows="4" ><?php if(isset($objsc)){echo $objsc;}else{echo '';} ?></textarea></td>
    </tr>
  <tr>
    <td height="33">&nbsp;</td>
    </tr>
  <tr>
    <td>&nbsp;</td>
	<td><span class="fontnormal"><font color="#FF0000"><?php echo form_error('objsc'); ?></font></span></td>
	<td colspan="3">&nbsp;</td>
	</tr>
  <tr>
    <td height="30"><label>Domicilio Legal:</label></td>
    <td colspan="4"><textarea name="dirleg" id="dirleg" cols="40" rows="4" class="countdown limit_300_"><?php echo $dirleg; ?></textarea></td>
    </tr>
  <tr>
    <td><br /></td>
    <td><span class="fontnormal"><font color="#FF0000"> <?php echo form_error('dirleg'); ?></font></span></td>
    <td width="89">&nbsp;</td>
    <td width="101">&nbsp;</td>
    <td width="176">&nbsp;</td>
  </tr>
  <tr>
    <td height="30">Observaciones:</td>
    <td colspan="4" rowspan="2" ><textarea name="obs" id="obs" cols="40" rows="4" class="countdown limit_300_"><?php echo $obs; ?></textarea></td>
    </tr>
  <tr>
    <td height="33">&nbsp;</td>
    </tr>
  <tr>
    <td height="33">&nbsp;</td>
    <td>&nbsp;</td>
	<td>&nbsp;</td>
  </tr>
    </table>    
                   
    <table width="800" border="0" cellpadding="0" cellspacing="0" >
      <tr>
        <th width="258" align="right" scope="col">&nbsp;</th><td><div align="right" >&nbsp;&nbsp;&nbsp; 
            <input type="submit" name="boton" value="Guardar" />&nbsp;&nbsp;&nbsp; <?php if ($modo == 'edit'){?>
		
		
		<?php $modo = '/edit'; ?>
		
		
		<?php }else{ ?>
		<?php $modo = ''; ?>
		<input type="button" name="accion" value="Siguiente" onclick="enviar_legal(2,<?php echo $valorpk; ?>)" />
		<?php // echo anchor('con_reg_3/index/'.$valorpk.'/new', '<img alt="Modificar" src="'.base_url().'system/application/imagenes/boton_continuar.gif" border="0">' );  ?>
		
		<?php } ?>
		<?php   $bse = base_url(); ?>
		<input type="button" name="fin" value="Finalizar" onclick="enviar_legal(1)" />
</div>        
		
			</td>
      </tr>
    </table>
    <p><?php echo form_close(); ?></p>
				   <div class="tablein_1">
				   
  <table width="800" class="bgceldas">
    <tr class="bgtitle">
	  
      <th width="106" style="font-size:10px">Nº. Reg.Mercantil </th>
      <th width="132" style="font-size:10px">F. Ins. Reg Mercantil</th>
      <th width="85" style="font-size:10px">Nº. Inscrip</th>
      <th width="128" style="font-size:10px">Capital Soc. Suscrito</th>
      <th width="136" style="font-size:10px">Capital Soc. Pagado</th>
      <th width="27" style="font-size:10px">Tipo</th>
	  <th width="8" style="font-size:10px"></th>
    </tr>
	
	<?php foreach($consulta_contratista_legal->result() as $row): ?>
<?php echo "<tr>"; ?>
<?php echo "<td>"; ?> <?php echo $row->clg_numero_registro; ?> <?php echo "</td>"; ?> 
<?php echo "<td>"; ?> <?php echo $this->mylib_base->pg_to_human($row->clg_fecha_inscripcion); ?> <?php echo "</td>"; ?>
<?php echo "<td>"; ?> <?php echo $row->clg_numero_inscripcion; ?> <?php echo "</td>"; ?> 
<?php echo "<td>"; ?> <?php echo number_format($row->clg_capital_social_suscrito, 2, ",","."); ?> <?php echo "</td>"; ?>
<?php echo "<td>"; ?> <?php echo number_format($row->clg_capital_social_pagado, 2, ",","."); ?> <?php echo "</td>"; ?>
<?php echo "<td>"; ?> <?php if($row->clg_modificacion == 'f'){echo "Registro Principal";}else{echo "Modificación"; } ?> <?php echo "</td>"; ?>

<?php $attr = array(
'onclick'=>"return confirm('¿Esta seguro de borrar este registro?');"
); ?>

<?php echo "<td style=\"width:40px\">"; ?><?php echo anchor('con_reg_2/grabar/'.$valorpk.'/'.$row->clg_contratistas_legal_pk.$modo, '<img alt="Modificar" src="'.base_url().'system/application/imagenes/edit.png" border="0">');?>&nbsp;<?php echo anchor('con_reg_2/eliminar/'.$valorpk.'/'.$row->clg_contratistas_legal_pk.$modo, '<img alt="Eliminar" src="'.base_url().'system/application/imagenes/delete.png" border="0">',$attr) ?> <?php echo "</td>"; ?>

<?php  echo "</tr>"; ?>
<?php endforeach; ?>

		</table>		     
                </div>                                                                               </div>
  <div class="bgfooter"> <div class="footerimage"> </div></div>
</div>

</body>
</html>