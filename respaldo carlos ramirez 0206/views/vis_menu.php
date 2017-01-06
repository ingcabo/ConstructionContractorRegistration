
<div class="headerwrap"> 
<div class="header">
<div class="column1">

<div class="logoregco"><img  title="Sistema de Registro y Seguimiento de Contratistas" src="<?=base_url();?>system/application/imagenes/logoregco.png" width="220" height="70" /></div>
<div class="fecha"> <script language="JavaScript1.2">
var months=new Array(13);
months[1]="Enero";
months[2]="Febrero";
months[3]="Marzo";
months[4]="Abril";
months[5]="Mayo";
months[6]="Junio";
months[7]="Julio";
months[8]="Agosto";
months[9]="Septiembre";
months[10]="Octubre";
months[11]="Noviembre";
months[12]="Diciembre";
var time=new Date();
var lmonth=months[time.getMonth() + 1];
var date=time.getDate();
var year=time.getYear();
if (year < 2000)    
year = year + 1900; 
document.write("<center><font face='Verdana, Arial, Helvetica, sans-serif' size='1' color='#161645'>" + "Maracaibo, " + date + " ");
document.write(lmonth + "  " + year + "</font></center>");
</script>

</div>
</div>

<div class="column2">
<div class="logosiez"> </div>
<div class="botonerawrap">
<div class="botonerabg">
<div class="bgbotonera">
<div id="outside" style="padding-left:10px;">
<script type="text/javascript">

stm_bm(["menu0f61",820,"","<?=base_url();?>system/application/imagenes/blank.gif",0,"","",0,0,250,0,1000,1,0,0,"","",0,0,1,2,"default","hand",""],this);
stm_bp("p0",[0,4,0,0,0,4,0,7,100,"",-2,"",-2,50,0,0,"#999999","#FFFFFF","",3,0,0,"#000000"]);
stm_ai("p0i0",[0,"Mantenimiento","","",-1,-1,0,"","_parent","","","","",0,0,0,"<?=base_url();?>system/application/imagenes/arrow_r.gif","<?=base_url();?>system/application/imagenes/arrow_r.gif",7,7,0,0,1,"#FFFFFF",0,"#ffffff",0,"","",3,3,0,0,"#E6EFF9","#000000","#161747","#161747","8pt Verdana","8pt Verdana",0,0]);
stm_bpx("p1","p0",[1,4,0,0,4,3,0,0,100,"progid:DXImageTransform.Microsoft.Fade(overlap=.5,enabled=0,Duration=0.50)",-2,"",-2,60,0,0,"#999999","#FFFFFF","",3,1,1]);
<?php
 $centinela_menu = new Centinela();
 $menuopciones = $this->db->query("SELECT usm_usuarios_menu_pk,usm_nivel,usm_codigo FROM sistema.vis_usuarios_menu as um, sistema.usuarios_opciones as uo WHERE substring(usm_nivel from 1 for 2) = '00' and uo.usm_usuarios_fk = um.usm_usuarios_menu_pk and uo.uso_ver = true and uo.usr_usuarios_fk = ".$centinela_menu->getId());
 foreach($menuopciones->result_array() as $campo){
  $com_js = str_replace('baseurl',base_url(),$campo['usm_codigo']);
  print($com_js."\n");
 }
?>
stm_ep();
stm_aix("p0i1","p0i0",[0,"Operaciones"]);
stm_bpx("p2","p1",[1,4,0,0,2]);
<?php
 $menuopciones1 = $this->db->query("SELECT usm_usuarios_menu_pk,usm_nivel,usm_codigo FROM sistema.vis_usuarios_menu as um, sistema.usuarios_opciones as uo WHERE substring(usm_nivel from 1 for 2) = '01' and uo.usm_usuarios_fk = um.usm_usuarios_menu_pk and uo.uso_ver = true and uo.usr_usuarios_fk = ".$centinela_menu->getId());
 foreach($menuopciones1->result_array() as $campo){
  $com_js = str_replace('baseurl',base_url(),$campo['usm_codigo']);
  print($com_js."\n");
 }
?>
stm_ep();
stm_aix("p0i2","p0i0",[0,"Seguimiento"]);
stm_bpx("p3","p2",[]);
<?php
 $menuopciones = $this->db->query("SELECT usm_usuarios_menu_pk,usm_nivel,usm_codigo FROM sistema.vis_usuarios_menu as um, sistema.usuarios_opciones as uo WHERE substring(usm_nivel from 1 for 2) = '02' and uo.usm_usuarios_fk = um.usm_usuarios_menu_pk and uo.uso_ver = true and uo.usr_usuarios_fk = ".$centinela_menu->getId());
 foreach($menuopciones->result_array() as $campo){
  $com_js = str_replace('baseurl',base_url(),$campo['usm_codigo']);
  print($com_js."\n");
 }
?>
stm_ep();
stm_aix("p0i3","p0i0",[0,"Reportes"]);
stm_bpx("p4","p2",[]);
<?php
 $menuopciones = $this->db->query("SELECT usm_usuarios_menu_pk,usm_nivel,usm_codigo FROM sistema.vis_usuarios_menu as um, sistema.usuarios_opciones as uo WHERE substring(usm_nivel from 1 for 2) = '03' and uo.usm_usuarios_fk = um.usm_usuarios_menu_pk and uo.uso_ver = true and uo.usr_usuarios_fk = ".$centinela_menu->getId());
 foreach($menuopciones->result_array() as $campo){
  $com_js = str_replace('baseurl',base_url(),$campo['usm_codigo']);
  print($com_js."\n");
 }
?>
stm_ep();
stm_aix("p0i4","p0i0",[0,"Sistema"]);
stm_bpx("p5","p2",[]);
<?php
 $menuopciones = $this->db->query("SELECT usm_usuarios_menu_pk,usm_nivel,usm_codigo FROM sistema.vis_usuarios_menu as um, sistema.usuarios_opciones as uo WHERE substring(usm_nivel from 1 for 2) = '04' and uo.usm_usuarios_fk = um.usm_usuarios_menu_pk and uo.uso_ver = true and uo.usr_usuarios_fk = ".$centinela_menu->getId());
 foreach($menuopciones->result_array() as $campo){
  $com_js = str_replace('baseurl',base_url(),$campo['usm_codigo']);
  print($com_js."\n");
 }
?>
stm_ep();
stm_ep();
stm_sc(1,["#FFFFFF","#FFFFFF","","",3,3,3,1,"#333333","#CCCCCC","<?=base_url();?>system/application/imagenes/up_disabled.gif","<?=base_url();?>system/application/imagenes/up_enabled.gif",7,9,0,"../imagenes/down_disabled.gif","<?=base_url();?>system/application/imagenes/down_enabled.gif",7,9,0,1,70]);
stm_em();

</script>


</div>
</div>
</div>
</div>

</div>
</div>
<!--<span class="logoregco"></span></div>-->

