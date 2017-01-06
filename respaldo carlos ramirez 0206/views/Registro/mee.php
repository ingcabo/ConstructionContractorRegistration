<?php

global $campot;






$campos = $this->db->field_data('numeros_telefonicos');
foreach ($campos as $campo)
{

$campot = $campot.",".$campo->name;

}

$campostabla= substr($campot, 1);

echo $campostabla;
?>


