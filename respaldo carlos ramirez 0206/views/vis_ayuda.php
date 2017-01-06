<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$mi_pdf = base_url().'system\application\views\Manual_de_Usuario_REGCO.pdf';
header('Content-type: application/pdf');
header('Content-Disposition: attachment; filename="'.$mi_pdf.'"');
readfile($mi_pdf);

?>
