<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="<?=base_url();?>system/application/views/js_menu/stmenu.js"></script>
<?php $this->mod_usuario->en_session(); ?>


<script type="text/javascript">

window.onerror=function(m,u,l)
{
	window.status = "Java Script Error: "+m;
	return true;
}

</script>
<!-- Script para adaptar footer según resolución -->
<SCRIPT LANGUAGE="JavaScript">
<!-- Begin
//document.write('Your settings are ' + screen.width + ' x ' + screen.height + '');

if (screen.width == 800) {
document.write('<link rel="stylesheet" type="text/css" href="<?php  echo base_url(); ?>system/application/css/mainstyle2.css">');
//alert("Style Sheet for 800 x 600 would have been loaded.");
}
if (screen.width == 1024) {
document.write('<link rel="stylesheet" type="text/css" href="<?php  echo base_url(); ?>system/application/css/footer==1024_2.css">');
//alert("Style Sheet for 1024 x 768 would have been loaded.");
}
if (screen.width == 1280) {
document.write('<link rel="stylesheet" type="text/css" href="<?php  echo base_url(); ?>system/application/css/footer==1280.css">');
//alert("Style Sheet for 1280 x 960 would have been loaded.");
}
if (screen.width == 1600) {
document.write('<link rel="stylesheet" type="text/css" href="<?php  echo base_url(); ?>system/application/css/footer==1280.css">');
//alert("Style Sheet for 1600 x 1200 would have been loaded.");
}
//  End -->
</script>
<?=$xajax_js?>

<title><?php echo $this->titulo;?></title>

</head>
<body bgcolor="#FFFFFF" text="#000000" link="#0066FF" vlink="#9933FF" alink="#FF3333">
<div style=" min-height:100%; position:relative;">
<?php echo $this->vismenu;?>
<div class="bodywrap">
  <div class="bodyinfo">

<div class="headerbox">
<div class="titulos">
<?php echo $this->encabezado; ?>
</div>
<div class="busqueda">
<?php echo form_open('con_listview'); ?>
      <table width="776" height="33">
        <tr><td width="169"><label></label></td width="90"><td width="184"><label></label></td><td width="250"><label></label></td><td width="153"></td></tr>
		<tr><td width="169">

              <?php
               $js = 'onchange="'.$content.'" style="width:255px"';
               $opciones = $this->Mfrmclass->Crea_opciones_dropdown($this->Tit_Tabla);
               echo form_dropdown('dl_campos',$opciones,'',$js);?>
             
            </select></td width="90"><td width="184"><div id="DivSelectOperador" name="DivSelectOperador"><select name="Operador" size="1" style="width:165px" >
              <option value="0" selected="selected">[Seleccione uno]</option>
              
            </select></div></td><td width="250"><input type="text" name="CampoFiltro" id="CampoFiltro" maxlength="40"  size="40">
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
     <th colspan="4">&nbsp;</th>
     </tr>
</thead>
<?php foreach($this->campos_lv as $fila):?>
          <tbody>
              <tr>
                  
                  <?php foreach($this->Tit_Tabla as $titulos){
                   echo "<td>".utf8_decode($fila[$titulos])."</td>";
                  }
                  ?>
              
                  <td align="center"><div style="width:40px; float:right;"><a href="<?php echo base_url().'index.php/con_reg_edit_1/index/'.$fila[$this->Mfrmclass->campo_clave];?>"><img src="<?=base_url();?>system/application/imagenes/edit.gif" width="16" height="16" border="0"></a>&nbsp;<a href="<?php echo base_url().'index.php/con_frmclass/index/'.MODO_BORRAR.'/'.$this->Mfrmclass->nombre_tabla.'/'.$fila[$this->Mfrmclass->campo_clave];?>"><img src="<?=base_url();?>system/application/imagenes/delete.gif" width="16" height="16" border="0"></a></div></td>
              </tr>
          </tbody>
<?php endforeach;?>
<tfoot>
    <tr>
     <td align="right" colspan="5"><?php echo "Total de registros : $this->TotalRegistros"; ?>&nbsp;</td>
   
    </tr>
    <tr>
    <td colspan="5" align="center"><a href="<?php echo base_url().'index.php/con_reg_1';?>">Nuevo Registro</a></td>
    </tr>
    <tr >
     <td colspan="5" align="center"><?php echo $this->pagination->create_links(); ?> </td>
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
</div>
<div class="bgfooter"> <div class="footerimage"> </div></div>
</div>

</body>
</html>
