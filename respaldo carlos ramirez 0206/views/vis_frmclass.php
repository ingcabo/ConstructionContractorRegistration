<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<?php $this->mod_usuario->en_session(); ?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<style type="text/css">

.Estilo1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 24px;
}
</style>
<head>
<title>..::.. REGCO ..::..  <?php echo humanize($this->nombre_tabla);?> </title>
<link rel="stylesheet" href="<?php  echo base_url(); ?>system/application/css/mainstyle2.css" type="text/css" />
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/scripts.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar-es.js"></script>
<script type="text/javascript" src="<?php echo base_url(); ?>system/application/js/calendario/jscripts/calendar/calendar-setup.js"></script>
<script type="text/javascript" src="<?php  echo base_url(); ?>system/application/js/general.js"></script>
<link media="screen" href="<?php echo base_url(); ?>system/application/js/calendario/styles/calendar-blue.css" rel="stylesheet" type="text/css" title="win2k-cold-1">
<link media="print" href="<?php echo base_url(); ?>system/application/js/calendario/styles/print.css" rel="stylesheet" type="text/css" title="win2k-cold-1">
<script type="text/javascript" src="<?=base_url();?>system/application/views/js_menu/stmenu.js"></script>
<script language="javascript" >
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {
      if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
        document.MM_pgW = innerWidth;
        document.MM_pgH = innerHeight;
        onresize        = MM_reloadPage;
      }
  }else{
      if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH)
          location.reload();}
} //Fin MM_reloadPage

function ir_a(){
    //document.location(-1);
    history.go(-1);
}

function setchk(control_name){
  var control = document.getElementById(control_name);
    if(control.checked == true)
        control.value = true
    else
        control.value = false;
} //fin setchk

MM_reloadPage(true);
//-->
</script>
</head>

<body><div style=" min-height:100%; position:relative;">
<div><?=$this->vismenu;?></div>

<div class="bodywrap">
<div class="bodyinfo">
<div class="headerbox">

<div class="visfrm">
<span style="float:center; font-weight: bold;"><?php echo ($this->Mfrmclass->CrearTitulo('tit_'.$this->Mfrmclass->nombre_tabla));?></span>
&nbsp;
<span style="float:right;"><?=$modo;?></span>
  <?=form_open($this->enviar); ?>
  <?php foreach($this->campos as $c):?>
  <h5><?php $titulo_control = $this->Mfrmclass->CrearTitulo($c);
          $p = $c.'_error';?></h5>
<div>
<div style="color:#ff0000"><?php echo $this->Mfrmclass->CrearTitulo($this->validation->$p);?></div>
<div></div>

<?php //echo $this->attcampo[$c]['tipo'];
  
  switch($this->attcampo[$c]['tipo']){
      case 'bool':
          $chk = "<h5>$titulo_control <input type=\"checkbox\" name=\"$c\" id=\"$c\" onclick=\"setchk('$c');\"";
          if(isset($this->valores[0][$c]) and $this->valores[0][$c] == true){
            $chk .= ' value="true" '.$this->validation->set_checkbox($c,'true').' checked/>'; }
          else{
            $chk .= ' value="false" '.$this->validation->set_checkbox($c,'false').'/>'; }
          echo $chk.'</chk>';
        break;
      case 'varchar':
        echo "<h5>$titulo_control</h5>";
        if(isset($this->valores[0][$c])){
          echo '<input type="text" name="'.trim($c,'\'').'" value="'.$this->valores[0][$c].$this->validation->$c.'" size="'.$this->attcampo[$c]['longitud'].'"/>';
        }else{
          echo '<input type="text" name="'.trim($c,'\'').'" value="'.$this->validation->$c.'" size="'.$this->attcampo[$c]['longitud'].'"/>';}
        break;
      case 'numeric':
      case 'int2':
      //case 'int4':
      case 'integer':
        echo "<h5>$titulo_control</h5>";
        if(isset($this->valores[0][$c])){
          echo '<input type="text" style="text-align:right;" name="'.trim($c,'\'').'" value="'.number_format($this->valores[0][$c],2,',','.').$this->validation->$c.'" size="'.$this->attcampo[$c]['longitud'].' " onblur="puntitos(this,this.value.charAt(this.value.length-1),\''.DECIMALES.'\')" onkeypress="return SoloNumero(event)"/>';}
        else {
            echo '<input type="text" style="text-align:right;" name="'.trim($c,'\'').'" value="'.$this->validation->$c.'" size="'.$this->attcampo[$c]['longitud'].'" onblur="puntitos(this,this.value.charAt(this.value.length-1),\''.DECIMALES.'\')" onkeypress="return SoloNumero(event)"/>';}
        break;
      case 'date':
          echo "<h5>$titulo_control</h5>";
          if($this->valores[0][$c] == '2500-12-31' or $this->valores[0][$c] == '')
            $fechaver = '';
          else $fechaver = $this->mylib_base->pg_to_human($this->valores[0][$c].$this->validation->$c);
          echo '<input type="text" style="text-align:right;" id="'.$c.'" name="'.$c.'" value="'.$fechaver.'" readonly size="'.$this->attcampo[$c]['longitud'].'"/>';
          echo '<img name="txt_fecha_img" id="txt_fecha_img" src="'. base_url().'system/application/js/calendario/images/calendar.gif" width="16" height="16"></div>';
		  echo '<script type="text/javascript">';
		  echo 'var campoId = \''.$c.'\';';
		  echo 'var imagenId = \'txt_fecha_img\';';
		  echo 'iniciarCalendario(campoId, imagenId,\'%d-%m-%Y\',false);';
		  echo '</script><div style="color:#ff0000">';
        break;
      default:
        echo "<h5>$titulo_control</h5>";
        echo "<select name=\"$c\">";
        echo "<option value=\"0\">Seleccione uno</option>";
        foreach($this->fkcampos[$c] as $valores){
          $contador = 0;
          foreach($valores as $campo => $valor){
            if($contador === 0)
              if($this->valores[0][$c] === $valor){
               $opcion = "<option value=\"$valor\" ".$this->validation->set_select($c,$valor)." selected>";
              }else{
               $opcion = "<option value=\"$valor\" ".$this->validation->set_select($c,$valor).">";
              }
            if($contador === 1)
               $opcion .= $valor."</option>";
            $contador++;
          }
          echo $opcion;
        }
        echo '</select>';
        break;
  }; 
?>

</div>
<?php endforeach; ?>
<br>
<div><input id="boton" type="submit" value="Aceptar" />&nbsp;&nbsp;<input id="boton" type="reset" value="Cancelar" onClick="ir_a();" />
</div>
</form>
</div>

<div class="corner1"> </div>
<div class="corner2"> </div>
<div class="corner3"> </div>
<div class="corner4"> </div>
</div>
</div>
</div>
</div>
<div class="bgfooter"> <div class="footerimage"> </div></div>
</div>
</body>
</html>
