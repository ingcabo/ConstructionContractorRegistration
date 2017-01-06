<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

if (!defined('BASEPATH')) exit('Libreria de AJAX no inicializada.');
if ( ! class_exists('xajax'))
{
    require_once(APPPATH.'libraries/xajax'.EXT);
}

$obj =& get_instance();
$obj->xajax = new xajax();
$obj->ci_is_loaded[] = 'xajax';

?>
