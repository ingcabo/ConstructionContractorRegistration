<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Planilla de Recaudos</title>
<link rel="stylesheet" href="<?=base_url();?>system/application/css/mainstyle2.css" type="text/css" />
<script type="text/javascript" src="<?=base_url();?>system/application/views/js_menu/stmenu.js"></script>
</head>

<body>
<?=$this->vismenu;?>
<div class="bodywrap">
<div class="bodyinfo"> 
<div class="headerbox">
<form id="frm_vis_rep_recaudos" name="frm_vis_rep_recaudos" method="post" action="<?=base_url();?>index.php/con_reportes/rep_recaudos">
  <label>Seleccione el Tipo de Contratista, que desea visualizar sus recaudos<br /> 
  <br />
  Tipo de Contratista :
  
  <?php echo form_dropdown('dpd_tipos', $this->dpd_opciones); ?>
  </label>
  <p>
    <input type="submit" name="Submit" value="Procesar" />
  </p>
  <p><?=isset($info)?$info:'';?></p>
</form>
<div class="corner1"> </div>
<div class="corner2"> </div>
<div class="corner3"> </div>
<div class="corner4"> </div>
</div>
</div>

</div>
<div class="bgfooter"> <div class="footerimage"> </div></div>
</body>
</html>
