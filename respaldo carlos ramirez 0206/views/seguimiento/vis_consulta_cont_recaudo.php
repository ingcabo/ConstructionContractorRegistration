<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<?php $this->mod_usuario->en_session(); ?>



<script type="text/javascript" src="<?=base_url();?>system/application/views/js_menu/stmenu.js"></script>
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/css/mainstyle2.css" type="text/css" />
<?=$xajax_js?>

<title>..:: REGCO ::.. <?php echo $this->titulo;?></title>

</head>
<body bgcolor="#FFFFFF" text="#000000" link="#0066FF" vlink="#9933FF" alink="#FF3333">

<?php echo $this->vismenu;?>
<div class="bodywrap">
  <div class="bodyinfo">

<div class="headerbox">
<div class="titulos">
<?php echo $this->encabezado; ?>
</div>
<div class="busqueda">
<?php echo form_open('Con_consult_regco'); ?>
      <table width="776" height="33">
        <tr><td width="169"><label></label></td width="90"><td width="184"><label></label></td><td width="250"><label></label></td><td width="153"></td></tr>
		<tr><td width="169">

              <?php
               $js = 'onchange="'.$content.'" style=""';
               $opciones = $this->Mfrmclass->Crea_opciones_dropdown($this->Tit_Tabla);
               array_unshift($opciones,'[Seleccione uno]');
               echo form_dropdown('dl_campos',$opciones,($this->centinela->getcampo1() <> '')?$this->centinela->getcampo1():'0',$js);?>

            </select></td width="90"><td width="184"><div id="DivSelectOperador" name="DivSelectOperador">
            <?php
               if($this->centinela->getcampo2() <> ''){
                   echo $this->Mfrmclass->Operador($this->centinela->getcampo1(),$this->centinela->getcampo2());
               }else{?>
                 <select name="Operador" size="1" style="width:165px" >
                 <option value="0" selected="selected">[Seleccione uno]</option></select>
               <?php }  ?></div></td><td width="250"><input type="text" name="CampoFiltro" id="CampoFiltro" maxlength="40"  size="40" value="<?=($this->centinela->getcampo3()<>'')?$this->centinela->getcampo3():'';?>">
          </td>
          <td><input type="submit" name="boton" value="Buscar" class="inputsubmit" /></td>
        </tr>
		</table>

</form>
</div>



<div class="listado">
<table border="1" class="tablep">
<thead align="center">
  <tr>

     <?php
      foreach($this->Tit_Tabla as $titulos):
       if (!$this->Mfrmclass->EsExcepcion($titulos)){
         echo "<th width=\"30%\">".$this->Mfrmclass->CrearTitulo($titulos)."</th>";
         }
     endforeach;?>
     <td colspan="6" class="bgtitle">&nbsp;</td>
     </tr>
</thead>
<?php if($this->campos_lv != null)
      foreach($this->campos_lv as $fila):?>
          <tbody>
              <tr>

                  <?php foreach($this->Tit_Tabla as $titulos){
                   echo "<td>".$fila[$titulos]."</td>";
                  }
                  ?>
                  <td align="center"><?php echo anchor('con_reg_edit_1/index/'.$fila[$this->Mfrmclass->campo_clave], '<img alt="Datos Generales" src="'.base_url().'system/application/imagenes/generaldata.gif" width="16" height="16" border="0" title="Datos Generales">' );  ?></td>
                  <td align="center"><?php echo anchor('con_reg_2/index/'.$fila[$this->Mfrmclass->campo_clave].'/0'.'/edit', '<img alt="Datos Legales" src="'.base_url().'system/application/imagenes/legaldata.gif" width="16" height="16" border="0" title="Datos Legales">' );  ?></td>
                  <td align="center"><?php echo anchor('con_reg_3/index/'.$fila[$this->Mfrmclass->campo_clave].'/0'.'/edit', '<img alt="Areas y especialidades" src="'.base_url().'system/application/imagenes/espareas.gif" width="16" height="16" border="0" title="Actividades de la Contratista">' );  ?></td>
			      <td align="center"><?php echo anchor('con_reg_4/reg_form/'.$fila[$this->Mfrmclass->campo_clave].'/0'.'/edit', '<img alt="Accionistas" src="'.base_url().'system/application/imagenes/accio.gif" width="16" height="16" border="0" title="Representantes">' );  ?></td>
			     <td align="center"><?php echo anchor('con_reg_5/index/'.$fila[$this->Mfrmclass->campo_clave].'/0'.'/edit', '<img alt="Sucursales" src="'.base_url().'system/application/imagenes/sucursales.gif" width="16" height="16" border="0" title="Sucursales">' );  ?></td>
				 <td align="center"><?php echo anchor('con_reg_6/index/'.$fila[$this->Mfrmclass->campo_clave].'/0'.'/edit', '<img alt="Relacion de Obras" src="'.base_url().'system/application/imagenes/relacionobras.gif" width="16" height="16" border="0" title="Relaci&oacute;n de Obras">' );  ?></td>
			  </tr>
          </tbody>
<?php endforeach;?>
<tfoot>
    <tr>
     <td align="center" colspan="2">&nbsp;</td>
     <td  colspan="7" align="right"><?php echo "Registros : $this->TotalRegistros"; ?></td>
    </tr>
    <tr >
     <td colspan="9" align="center"><?php echo $this->pagination->create_links(); ?> </td>
    </tr>
</tfoot>
</table>
</div>
<div class="corner1"> </div>
<div class="corner2"> </div>
<div class="corner3"> </div>
<div class="corner4"> </div>
</div>
</div>
<div class="bgfooter"> <div class="footerimage"> </div></div>
</div>

</body>
</html>

