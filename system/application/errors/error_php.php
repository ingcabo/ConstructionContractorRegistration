<html>
<head>
<title>Error</title>
<link rel="stylesheet" href="<?=base_url();?>system/application/css/mainstyle2.css" type="text/css" />
<div style=" min-height:100%; position:relative;">

<div class="bodywrap">
<div class="bodyinfo">
<div style="border:1px solid #990000;padding-left:20px;margin:0 0 10px 0;">

<h4>A PHP Error was encountered</h4>

<p>Severity: <?php echo $severity; ?></p>
<p>Message:  <?php echo $message; ?></p>
<p>Filename: <?php echo $filepath; ?></p>
<p>Line Number: <?php echo $line; ?></p>
</div>
</div>
</div>
<div class="bgfooter_v2"> <div class="footerimage"> </div></div>
</div>
</html>