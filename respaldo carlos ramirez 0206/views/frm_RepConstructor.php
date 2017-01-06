<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<?php $this->mod_usuario->en_session(); ?>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/css/mainstyle2.css" type="text/css" />
<script type="text/javascript" src="<?php  echo base_url(); ?>system/application/js/general.js"></script>
<script type="text/javascript" src="<?=base_url();?>system/application/views/js_menu/stmenu.js"></script>
<title>Generardor de Reportes</title>
<?=$xajax['xajax_js'];?>
</head>

<body>
<div>
  <!-- $this->vismenu  !-->
  
  <?php echo $this->vismenu; ?>
  
  <!-- FIN DE Menu !-->
</div>
<div class="bodywrap">
  <div class="bodyinfo">

<?=form_open('con_RepConstructor/gen_reporte')?>
<table width="800" border="0" cellpadding="0" cellspacing="0" class="table_usuarios">
  <!--DWLayoutTable-->
  <tr>
    <td height="19" colspan="10" valign="top"><div align="center"><strong>Generador de Reportes </strong></div></td>
    </tr>
  <tr>
    <td width="16" height="19"></td>
    <td width="41"></td>
    <td width="75"></td>
    <td width="22"></td>
    <td width="66"></td>
    <td width="57"></td>
    <td width="77"></td>
    <td width="25"></td>
    <td width="23"></td>
    <td width="192">&nbsp;</td>
    </tr>
  <tr>
    <td height="19" colspan="5" valign="top" class="bgtitle">Busqueda avanzada de Contratistas</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="19">&nbsp;</td>
    <td></td>
    <td></td>
    <td></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="24" colspan="3" valign="top">N&uacute;mero de R.I.F. : </td>
    <td>&nbsp;</td>
    <td colspan="4" valign="top"><select name="inirif" class="textbox">
      <option value="J">J</option>
      <option value="G">G</option>
      <option value="V">V</option>
      <option value="E">E</option>
    </select>
    <input name="txt_rif" type="text" id="txt_rif" onkeypress="return SoloNumero(event);" /></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="22" colspan="3" valign="top">N&uacute;mero de RNC: </td>
    <td></td>
    <td colspan="4" valign="top"><input name="txt_rnc" type="text" id="txt_rnc" /></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="22" colspan="3" valign="top">Nombre o Raz&oacute;n Social: </td>
    <td></td>
    <td colspan="4" valign="top"><input name="txt_nombre" type="text" id="txt_nombre" size="50" /></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="22" colspan="3" valign="top">Estatus de la Empresa: </td>
    <td></td>
    <td colspan="4" rowspan="2" valign="top"><?php $opc = 'id="dpd_estemp" multiple="multiple" size="5"'; echo form_dropdown('dpd_estemp[]',$estemp,'',$opc); ?></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="64">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="22" colspan="5" valign="top" class="bgtitle">Ubicaci&oacute;n Geogr&aacute;fica </td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="19">&nbsp;</td>
    <td></td>
    <td></td>
    <td></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="22" colspan="3" valign="top">Estado:</td>
    <td></td>
    <td colspan="4" valign="top"><?php 
    $js = 'id="dpd_estado" onchange="'.$xajax['content_mun'].'"';
    echo form_dropdown('dpd_estado',$est,'',$js); ?></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="22" colspan="3" valign="top">Municipio:</td>
    <td></td>
    <td colspan="4" valign="top"><div id="Divdpdmun"><select name="dpd_municipio" id="dpd_municipio" onchange="<?=$xajax['content_ciu'];?>">
<option value="0">Seleccione uno</option>
</select></div></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="22" colspan="3" valign="top">Ciudad:</td>
    <td></td>
    <td colspan="4" valign="top"><div id="Divdpdciu"><select name="dpd_ciudades" id="dpd_ciudades">
<option value="0">Seleccione uno</option>
</select></div></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="21">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="19" colspan="5" valign="top" class="bgtitle">Objeto de la Empresa: </td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="19"></td>
    <td>&nbsp;</td>
    <td colspan="3" valign="top"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td colspan="2" valign="top">Principal</td>
    <td></td>
    </tr>
    <?php
        $area_actual = '';
        $res_aob = $this->db->query('select * from areas_objeto where aob_activo = true order by aob_nombre');
        foreach($res_aob->result_array() as $fila_aob){
            $res_esp = $this->db->query('select * from especialidad_objeto where aob_areas_objeto_fk = ? and epo_activo =true order by epo_nombre',$fila_aob['aob_areas_objeto_pk']);
            $area_actual = $fila_aob['aob_nombre'];
            ?>
            <tr>
            <td height="19">&nbsp;</td>
            <td colspan="6" valign="top"><?=$fila_aob['aob_nombre']?></td>
            <td>&nbsp;            </td>
            <td></td>
            <td>&nbsp;</td>
          </tr>
          <?php
            foreach($res_esp->result_array() as $fila_epo){
                $data_chk['name'] = 'chk[]';
                $data_chk['id']   = 'chks';
                $data_chk['value']= $fila_epo['epo_especialidad_objeto_pk'];
                $data_rad['name'] = 'rad[]';
                $data_rad['id']   = 'rads';
                $data_rad['value']= $fila_epo['epo_especialidad_objeto_pk'];
                if($area_actual == $fila_aob['aob_nombre']){
      ?>
  <?php }?>
  <tr>
    <td height="20"></td>
    <td>&nbsp;</td>
    <td colspan="3" valign="top"><?=$fila_epo['epo_nombre']?></td>
    
    <td align="center" valign="top"><?=form_checkbox($data_chk);?></td>
    <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td align="center" valign="top"><?=form_radio($data_rad);?></td>
    <td></td>
    <td valign="top">&nbsp;</td>
    </tr>
  
  
  <?php
          }
        }
  ?>
  <tr>
    <td height="19">&nbsp;</td>
    <td></td>
    <td></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  
  <tr>
    <td height="38" colspan="3" valign="top">Denominaci&oacute;n Comercial: </td>
    <td></td>
    <td colspan="4" valign="top"><?php echo form_dropdown('dpd_dencom',$dencom); ?>    </td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="38" colspan="3" valign="top">Capital Social Suscrito Mayor a </td>
    <td></td>
    <td colspan="4" valign="top"><input name="txt_cap_suscrito" type="text" id="txt_cap_suscrito" /></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="38" colspan="3" valign="top">Capital Social Pagado Mayor a </td>
    <td></td>
    <td colspan="4" valign="top"><input name="txt_cap_pagado" type="text" id="txt_cap_pagado" /></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="22" colspan="3" valign="top">Calificaci&oacute;n Financiera:</td>
    <td></td>
    <td colspan="4" valign="top"><input name="txt_calfin" type="text" id="txt_calfin" /></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="22" colspan="3" valign="top">Capacidad Financiera: </td>
    <td></td>
    <td colspan="4" valign="top"><input name="txt_capfin" type="text" id="txt_capfin" /></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="38" colspan="3" valign="top">Nivel Financiero de Contrataci&oacute;n </td>
    <td></td>
    <td colspan="4" valign="top"><?php echo form_dropdown('dpd_nivfin',$nivfin); ?></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="24" colspan="3" valign="top">Contratado por: </td>
    <td></td>
    <td colspan="4" valign="top"><?php $opc = 'id="dpd_conpor" multiple="multiple" size="5"'; echo form_dropdown('dpd_conpor[]',$conpor,'',$opc); ?></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="22" colspan="3" valign="top">A&ntilde;o de Contrataci&oacute;n </td>
    <td></td>
    <td colspan="4" valign="top"><?php echo form_dropdown('dpd_anocon',$anocon); ?></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="22" colspan="3" valign="top">Tipo de Contratista: </td>
    <td></td>
    <td colspan="4" valign="top"><?php echo form_dropdown('dpd_tipemp',$tipemp); ?></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="38" colspan="3" valign="top">A&ntilde;o de Registro en el REGCO </td>
    <td></td>
    <td colspan="4" valign="top"><?php echo form_dropdown('dpd_anoreg',$anoreg); ?></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="37">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>&nbsp;</td>
    </tr>
  <tr>
    <td height="20">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td align="center" valign="top"><input name="bto_procesar" type="submit" id="bto_procesar" value="Procesar" /></td>
    <td></td>
    <td>&nbsp;</td>
    <td></td>
    <td></td>
    <td>&nbsp;</td>
  </tr>
</table>
</form>
</div>
<div class="bgfooter" style="top:100%;"> <div class="footerimage"> </div></div>
</div>
</body>

</html>
