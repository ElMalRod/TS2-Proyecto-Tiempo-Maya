<?php
$fecha_base = new DateTime("-3113-08-11");
$fecha_obtener = new DateTime($fecha_consultar);

$diff = $fecha_base->diff($fecha_obtener);
$dias = $diff->days;

$number_4 = floor($dias / 144000);
$number_3 = floor(($dias % 144000) / 7200);
$number_2 = floor((($dias % 144000) % 7200) / 360);
$number_1 = floor(((($dias % 144000) % 7200) % 360) / 20);
$number_0 = (((($dias % 144000) % 7200) % 360) % 20);
$fecha_cuenta_larga = strval($number_4) . "." . strval($number_3) . "." . strval($number_2) . "." . strval($number_1) . "." . strval($number_0);

return $fecha_cuenta_larga;
?>