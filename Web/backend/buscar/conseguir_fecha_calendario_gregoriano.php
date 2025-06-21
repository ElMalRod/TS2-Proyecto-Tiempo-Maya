<?php
$fecha_base = new DateTime('-3113-08-11');
$dias_totales = $baktuns * 144000 + $katuns * 7200 + $tuns * 360 + $uinals * 20 + $kins;
$fecha_base->add(new DateInterval('P' . $dias_totales . 'D'));
$fecha_gregoriana = $fecha_base->format('Y-m-d');
$fecha_consultar = $fecha_gregoriana;
return $fecha_gregoriana;
?>