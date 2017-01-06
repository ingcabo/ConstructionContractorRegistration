<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

//Para hacer uso de este plugins es necesesario utilizar el siguiente helper
//$this->load->helper('file'); desde el controller que hace la llamada

  function pdf_create($html, $filename, $stream=TRUE, $orientacion = 'portrait', $papel='letter')
    {
    require_once("dompdf/dompdf_config.inc.php");

    $dompdf = new DOMPDF();
    $dompdf->load_html($html);
    $dompdf->set_paper($papel,$orientacion);
    $dompdf->render();
    if ($stream) {
        $dompdf->stream("$filename.pdf");
      } else {
        write_file("$filename.pdf", $dompdf->output());
      }
    } //fin pdf_create
?>
