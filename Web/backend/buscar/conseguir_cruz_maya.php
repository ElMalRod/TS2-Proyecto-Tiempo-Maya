<?php
$fecha_obtener = new DateTime($fecha_consultar);

$interval_54_days = new DateInterval('P54D');
$signo_mano_derecha = clone $fecha_obtener;
$signo_mano_derecha->add($interval_54_days);

$signo_mano_izquierda = clone $fecha_obtener;
$signo_mano_izquierda->sub($interval_54_days);

$interval_268_days = new DateInterval('P268D');
$signo_engendracion = clone $fecha_obtener;
$signo_engendracion->sub($interval_268_days);

$interval_68_days = new DateInterval('P68D');
$signo_porvenir = clone $fecha_obtener;
$signo_porvenir->add($interval_68_days);

return array(
    $signo_mano_derecha->format('Y-m-d'),
    $signo_mano_izquierda->format('Y-m-d'),
    $signo_engendracion->format('Y-m-d'),
    $signo_porvenir->format('Y-m-d')
);
?>