<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="utf-8"/>
<title>..::  Mantenimiento ==> <?php echo humanize($this->nombre_tabla);?> ::..</title>
<link rel="stylesheet" type="text/css" href="http://localhost/SCSPL/system/application/views/main.css" />
<script language="javascript" src="../system/application/scripts/datetimepicker.js"></script>

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
<body bgcolor="#FFFFFF" text="#000000" link="#0066FF" vlink="#9933FF" alink="#FF3333">

<div> <iframe src="<?php  echo base_url(); ?>system/application/views/header.php" width="100%" height="245px" frameborder="0" scrolling="no"> </iframe></div>

<div class="bodywrap">
<div class="bodyinfo">
<?=form_open($this->enviar); ?>

<?php foreach($this->campos as $c):?>
<h5><?php echo $this->Mfrmclass->CrearTitulo($c); $p = $c.'_error';?></h5>
<?php echo $this->validation->$p;
//echo $this->attcampo[$c]['tipo'];
  switch($this->attcampo[$c]['tipo']){
      case 'bool':
          if(isset($this->valores[0][$c]) and $this->valores[0][$c] == true){
            $valorchk = TRUE; }
          else{
            $valorchk = FALSE;}
        
        $datos = array(
            'name'    => $c,
            'id'      => $c,
            'value'   => 'false'.' '.$this->validation->set_checkbox($c,'false'),
            'checked' => $valorchk,
            'style'   => 'margin:10px',
            'onclick' => "setchk('$c');");
        echo form_checkbox($datos);
        break;
      case 'varchar':
        if(isset($this->valores[0][$c])){
          echo '<input type="text" name="'.trim($c,'\'').'" value="'.$this->valores[0][$c].$this->validation->$c.'" size="'.$this->attcampo[$c]['longitud'].'"/>';
        }else{
          echo '<input type="text" name="'.trim($c,'\'').'" value="'.$this->validation->$c.'" size="'.$this->attcampo[$c]['longitud'].'"/>';}
        break;
      case 'numeric':
      case 'int2':
        if(isset($this->valores[0][$c])){
          echo '<input type="text" style="text-align:right;" name="'.trim($c,'\'').'" value="'.$this->valores[0][$c].$this->validation->$c.'" size="'.$this->attcampo[$c]['longitud'].'"/>';}
        else {echo '<input type="text" style="text-align:right;" name="'.trim($c,'\'').'" value="'.$this->validation->$c.'" size="'.$this->attcampo[$c]['longitud'].'"/>';}
        break;
      case 'date':
        echo '<input type="text" style="text-align:right;" name="'.$c.'" value="'.date("d/m/Y",now()).'" readonly size="'.$this->attcampo[$c]['longitud'].'"/>';
        echo '<a href="javascript:NewCal(\''.$c.'\',\'ddmmyyyy\')">';
        echo '<img src="../system/application/imagenes/cal.gif" alt="Calendario" width="21" height="23" border="0" align="absmiddle">';
        echo '</a>';
        break;
      default:
        echo form_dropdown('pais_pk',$this->fkcampos[$c]);
        break;
  }; 
?>
<?php endforeach; ?>
<div><input id="boton" type="submit" value="Enviar" /></div>
</form>
</div>

</div>


<div class="bgfooter"> <div class="footerimage"> </div></div>
</body>
</html>
