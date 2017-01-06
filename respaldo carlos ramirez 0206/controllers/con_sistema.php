<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of con_sistema
 *
 * @author Ricardo
 */
class Con_sistema extends Controller
{
    var $vismenu;

    function Con_sistema(){
        parent::Controller();
        $this->load->helper('url');
    }

    function mantenimiento(){
        $this->vismenu = $this->load->view('vis_menu','',TRUE);
        $this->load->view('menu_mantenimiento');
    } //fin mantenimiento

    function acerca(){
        $this->load->view('acerca_de');
    } //fin acerca

    function ayuda(){
        $this->load->view('vis_ayuda');
    } //fin acerca
}
?>
