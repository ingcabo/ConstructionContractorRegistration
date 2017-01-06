<html>
<head>
<title>Error</title>
<link rel="stylesheet" href="<?=base_url();?>system/application/css/mainstyle2.css" type="text/css" />
<style type="text/css">

body {
background-color:	#fff;
margin:				40px;
font-family:		Lucida Grande, Verdana, Sans-serif;
font-size:			12px;
color:				#000;
}

#content  {
border:				#999 1px solid;
background-color:	#fff;
padding:			20px 20px 12px 20px;
float:  right
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
		<?php echo $message; ?>
	</div>
    </div>
    </div>
<div class="bgfooter_v2"> <div class="footerimage"> </div></div>
</div>
</body>
</html>