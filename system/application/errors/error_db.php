<html>
<head>
<title>Database Error</title>
<link rel="stylesheet" href="<?=base_url();?>system/application/css/mainstyle2.css" type="text/css" />
<style type="text/css">

body {
background-color:	#fff;		
font-family:		Lucida Grande, Verdana, Sans-serif;
font-size:			12px;
color:				#000;
}

#content  {
border:				#999 1px solid;
background-color:	#fff;
padding:			20px 20px 12px 20px;

}

h1 {
font-weight:		normal;
font-size:			14px;
color:				#990000;
margin: 			0 0 4px 0;
}
</style>
</head>
<body><div style=" min-height:100%; position:relative;">

<div class="bodywrap">
<div class="bodyinfo">
	<div id="content">
		<h1><?php echo $heading; ?></h1>
		<?php
        //Formateo el mensaje de error a solo lo importante
        if(RELEASE){
          $t1 = strpos($message,'ERROR:');
          $t2 = substr($message,$t1+6);
          $t3 = strpos($t2,'select');
          $t3 = strpos($t2,'update');
          $t3 = strpos($t2,'insert');
          $t3 = strpos($t2,'delete');
          echo substr($t2,0,$t3);
        }else{
          echo $message;  
        }  
          ?>

    </div>
    <div>
    <input type="button" value="Volver al sistema" name="bto_volver"  onclick="return windows.location(-1);"/>
    </div>
    </div>
    </div>
    
    <div class="bgfooter_v2"> <div class="footerimage"> </div></div>
    </div>
</body>
</html>