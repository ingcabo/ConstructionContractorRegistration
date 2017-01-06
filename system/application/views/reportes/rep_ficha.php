<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<?php $this->mod_usuario->en_session(); ?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>..::.. REGCO ..::.. Ficha de la Contratista</title>
<style type="text/css">

body {
	margin-left: 5px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: Arial;
	font-size: 12px;
}
.style1 {
	font-family: Arial;
	font-weight: bold;
	font-size: 12px;
}
.style2 {color: #FFFFFF}

</style></head>

<body>
<table width="681" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td width="180" height="70"><img src="<?=base_url();?>system/application/imagenes/logogoberzulia.jpg" width="180" height="70" /></td>
    <td width="321" valign="top"><div align="center" class="style1">REPÚBLICA BOLIVARIANA DE VENEZUELA<br />
      GOBERNACIÓN DEL ESTADO ZULIA<br />
    SECRETARÍA DE INFRAESTRUCTURA</div></td>
    <td width="180" valign="top"><img src="<?=base_url();?>system/application/imagenes/logosiez.jpg" width="180" height="70" /></td>
  </tr>
</table>
<br />
<table width="681" border="0" cellpadding="0" cellspacing="0" >
  <!--DWLayoutTable-->
  <tr>
    <th height="20" colspan="21" valign="middle" bgcolor="#466FD5" class="style2">Datos Generales</th>
  </tr>
  <tr>
    <td  height="20" colspan="4" valign="top"><strong>Rif/Cédula de Identidad:</strong></td>
    <td colspan="17" valign="top"><?=isset($fila['con_numero_rif'])?$fila['con_numero_rif']:'';?></td>
  </tr>
  <tr>
    <td  height="20" colspan="4" valign="top"><strong>Nombre o Razón Social:</strong></td>
    <td colspan="17" valign="top"><?=isset($fila['con_numero_rif'])?$fila['con_nombre']:'';?></td>
  </tr>
  
  <tr>
    <td  height="20" colspan="4" valign="top"><strong>Denominación Comercial:</strong></td>
    <td colspan="17" valign="top"><?=isset($legal[0]['dec_descripcion'])?$legal[0]['dec_descripcion']:'S/N';?></td>
  </tr>
  <tr>
    <td  height="20" colspan="4" valign="top"><strong>Siglas:</strong></td>
    <td colspan="17" valign="top"><?=isset($fila['con_siglas'])?$fila['con_siglas']:'';?></td>
  </tr>
  <tr>
    <td  height="20" colspan="21" align="center" valign="middle" bgcolor="#466FD5"  class="style1 style2">Objeto Principal de la Empresa</td>
  </tr>
  <tr>
    <td  height="72" colspan="21" valign="top"><?=isset($legal[0]['clg_objeto_social'])?$legal[0]['clg_objeto_social']:'';?></td>
  </tr>
  
  
  <tr>
    <td  height="20" colspan="21" align="center" valign="middle" bgcolor="#466FD5"  class="style1 style2">Domicilio Principal</td>
  </tr>
  
  
   
   <tr>
    <td width="92"  height="20" valign="top"><div align="left"><strong>Estado:</strong></div></td>
    <td colspan="12" valign="top"><div align="center"><strong>Municipio:</strong></div></td>
    <td colspan="8" valign="top"><div align="center"><strong>Ciudad:</strong></div></td>
   </tr>
   <tr>
     <td  height="20" valign="top"><?=isset($fila['est_nombre'])?$fila['est_nombre']:'';?></td>
     <td colspan="12" align="center" valign="top"><?=isset($fila['mun_nombre'])?$fila['mun_nombre']:'';?></td>
     <td colspan="8" align="center" valign="top"><?=isset($fila['ciu_nombre'])?$fila['ciu_nombre']:'';?></td>
   </tr>
   
   
   <tr>
     <td  height="20" colspan="21" align="center" valign="middle"  bgcolor="#466FD5"  class="style1 style2">Información de Contacto</td>
  </tr>
  <?php
    foreach($telefonos as $ftel){
  ?>
   <tr>
     <td  height="20" colspan="9" valign="top"><strong><?=isset($ftel['ntt_descripcion'])?$ftel['ntt_descripcion']:'';?>:</strong></td>
    <td colspan="12" valign="top"><?php echo isset($ftel['tel_codigo_area'])?'('.$ftel['tel_codigo_area'].')':''; echo isset($ftel['tel_numero'])?$ftel['tel_numero']:'';?></td>
   </tr>
   <?php }?>
   <tr>
     <td  height="20" colspan="9" valign="top"><strong>Correo Electrónico:</strong></td>
    <td colspan="12" valign="top"><?=isset($fila['con_email'])?$fila['con_email']:'';?></td>
   </tr>
   
   <tr>
     <td  height="20" colspan="9" valign="top"><strong>Número de Certificado RNC:</strong></td>
    <td colspan="12" valign="top"><?=isset($fila['con_numero_rnc'])?$fila['con_numero_rnc']:'';?></td>
   </tr>
   <tr>
     <td  height="20" colspan="9" valign="top"><strong>Fecha de Inscripción RNC:</strong></td>
    <td colspan="12" valign="top"><?=isset($fila['con_fecha_inscripcion_rnc'])?$this->mylib_base->pg_to_human($fila['con_fecha_inscripcion_rnc']):'';?></td>
   </tr>
   <tr>
     <td  height="20" colspan="9" valign="top"><strong>Fecha de Vencimiento RNC:</strong></td>
    <td colspan="12" valign="top"><?=isset($fila['con_fecha_vencimiento_rnc'])?$this->mylib_base->pg_to_human($fila['con_fecha_vencimiento_rnc']):'';?></td>
   </tr>
   <tr>
     <td  height="20" colspan="21" align="center" valign="middle"  bgcolor="#466FD5"  class="style2">Acta Constitutiva y Modificaciones</td>
   </tr>
   <tr>
    <td height="20" colspan="6" valign="top"><strong>Descripción</strong></td>
    <td colspan="4" align="center" valign="top"><strong>Tipo</strong></td>
    <td colspan="4" align="center" valign="top"><strong>Nº de Registro</strong></td>
    <td colspan="4" align="center" valign="top"><strong>Tomo</strong></td>
    <td width="57" align="center" valign="top"><strong>Folio</strong></td>
    <td colspan="2" align="center" valign="top"><strong>Fecha</strong></td>
   </tr>
   <?php
     foreach($legal as $flegal){
   ?>

   <tr>
     <td height="20" colspan="6" valign="top"><?=isset($flegal['clg_observaciones'])?$flegal['clg_observaciones']:'';?></td>
     <td colspan="4" align="center" valign="top"><?php if(isset($flegal['clg_modificacion'])) { if($flegal['clg_modificacion']) {echo 'Mod';} else {echo 'Ppal';}}?></td>
     <td colspan="4" align="center" valign="top"><?=isset($flegal['clg_numero_registro'])?$flegal['clg_numero_registro']:'';?></td>
     <td colspan="4" align="center" valign="top"><?=isset($flegal['clg_numero_tomo'])?$flegal['clg_numero_tomo']:'';?></td>
     <td align="center" valign="top"><?=isset($flegal['clg_numero_folio'])?$flegal['clg_numero_folio']:'';?></td>
     <td colspan="2" align="center" valign="top" ><?=isset($flegal['clg_fecha_inscripcion'])?$this->mylib_base->pg_to_human($flegal['clg_fecha_inscripcion']):'';?></td>
   </tr>
   <?php
     }
   ?>
   <tr>
     <td  height="20" colspan="21" align="center" valign="top"  bgcolor="#466FD5"  class="style1 style2">Accionistas, Junta Directiva y Representantes Legales</td>
   </tr>
   <tr>
     <td  height="20" colspan="3" valign="top"><strong>Apellidos y Nombres</strong></td>
    <td colspan="2" align="center" valign="top"><strong>C.I./RIF.</strong></td>
    <td colspan="2" align="center" valign="top"><strong>R.L.</strong></td>
    <td colspan="4" align="center" valign="top"><strong>J.D.</strong></td>
    <td width="53" align="center" valign="top"><strong>Cargo</strong></td>
    <td colspan="5" align="center" valign="top"><strong>% Acciones</strong></td>
    <td colspan="3" align="center" valign="top"><strong>Tipo Firma</strong></td>
   <td width="20">&nbsp;</td>
   </tr>
   <?php
     foreach($personas as $fpersonas){
   ?>
   <tr>
     <td  height="20" colspan="3" valign="top"><?php echo isset($fpersonas['pnt_apellidos'])?$fpersonas['pnt_apellidos'].', ':''; echo isset($fpersonas['pnt_nombres'])?$fpersonas['pnt_nombres']:'';?></td>
     <td colspan="2" valign="top" align="center"><?php echo isset($fpersonas['pnt_cedula_de_identidad'])?$fpersonas['pnt_cedula_de_identidad']:'';?></td>
     <td colspan="2" align="center" valign="top"><?php echo (isset($fpersonas['ajr_representante_legal']) and $fpersonas['ajr_representante_legal'] == 't')?'X':'';?></td>
     <td colspan="4" align="center" valign="top"><?php echo (isset($fpersonas['ajr_miembro_junta_directiva']) and $fpersonas['ajr_miembro_junta_directiva'] == 't')?'X':'';?></td>
     <td align="center" valign="top"><?php echo isset($fpersonas['ajr_cargo_actual'])?$fpersonas['ajr_cargo_actual']:'';?></td>
     <td colspan="5" align="center" valign="top"><?php echo isset($fpersonas['ajr_porcentaje_acciones'])?number_format($fpersonas['ajr_porcentaje_acciones'],2,',','.'):'';?></td>
     <td colspan="3" align="center" valign="top"><?php echo isset($firma['tpf_descripcion'])?$firma['tpf_descripcion']:'';?></td>
   <td>&nbsp;</td>
   </tr>
   <?php }?>
   <tr>
     <td  height="20" colspan="21" align="center" valign="top"  bgcolor="#466FD5"  class="style2">Actividad Comercial</td>
  </tr>
   <tr>
     <td  height="20" colspan="16" valign="top"><strong>Actividad</strong></td>
    <td colspan="5" valign="top"><strong>Principal</strong></td>
   </tr>
   <?php
        foreach($areas as $fareas){
   ?>
   <tr>
     <td  height="20" colspan="16" valign="top"><?php echo isset($fareas['epo_nombre'])?$fareas['epo_nombre']:'';?></td>
     <td colspan="5" valign="top"><?php echo (isset($fareas['eac_principal']) and $fareas['eac_principal'] == 't')?'P':'';?></td>
   </tr>
   <?php
   }
   ?>
   <tr>
     <td  height="20" colspan="21" align="center" valign="top"  bgcolor="#466FD5"  class="style2">Relación de Obras</td>
   </tr>
   <tr>
     <td  height="20" colspan="2" valign="top"><strong>Nro. de Contrato</strong><strong></strong></td>
    <td colspan="6" valign="top"><strong>Cliente</strong><strong></strong></td>
    <td colspan="7" align="center" valign="top"><strong>Fecha</strong></td>
    <td colspan="6" align="center" valign="top"><strong>Status</strong></td>
   </tr>
   <?php
     foreach($obras as $fobras) {
   ?>
   <tr>
     <td  height="20" colspan="2" valign="top"><?php echo isset($fobras['ctt_numero'])?$fobras['ctt_numero']:'';?></td>
    <td colspan="6" valign="top"><?=isset($fobras['org_abreviatura'])?$fobras['org_abreviatura']:'';?></td>
    <td colspan="7" align="center" valign="top"><?=isset($fobras['ctt_fecha'])?$fobras['ctt_fecha']:'';?></td>
    <td colspan="6" align="center" valign="top"><?=isset($fobras['ett_estatus_fk'])?$fobras['ett_estatus_fk']:'';?></td>
   </tr>
   
   <?php }?>
   <tr>
     <td  height="11"></td>
     <td width="38"></td>
     <td width="17"></td>
     <td width="64"></td>
     <td width="53"></td>
     <td width="8"></td>
     <td width="42"></td>
     <td width="22"></td>
     <td width="7"></td>
     <td width="3"></td>
     <td width="7"></td>
     <td></td>
     <td width="18"></td>
     <td width="12"></td>
     <td width="45"></td>
     <td width="3"></td>
     <td width="20"></td>
     <td width="9"></td>
     <td></td>
     <td width="91"></td>
     <td></td>
   </tr>
</table>
<form name="imp_ficha" action="<?php echo base_url();?>index.php/con_RepConstructor/rep_Impficha" method="POST">
    <input type="hidden" name="con_id" value="<?=isset($con_id)?$con_id:'';?>" />
<input type="submit" value="Imprimir" name="bto_imprimir" />
</form>


    <p>&nbsp;</p>
</body>

</html>
