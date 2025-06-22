<?php

$fecha1 = new DateTime("1990-04-08");
$fecha2 = new DateTime($fecha_consultar);

$fecha_actual = strtotime(date("d-m-Y H:i:00", $fecha1->getTimestamp()));
$fecha_entrada = strtotime($fecha_consultar);

$diff = $fecha1->diff($fecha2);

$reversa = $fecha_actual > $fecha_entrada;

$dia = $diff->days % 365;

if ($dia && $reversa) {
    $dia = 365 - $dia;
}

$mes = intdiv($dia, 20) % 19;
$dia = $dia % 20;

$Query = $conn->query("SELECT nombre FROM uinal WHERE iddesk=" . $mes . " ;");
$row = mysqli_fetch_assoc($Query);
$nombre_uinal = $row['nombre'];

$Query2 = $conn->query("SELECT nombre FROM kin WHERE id=" . $dia . " ;");
$row2 = mysqli_fetch_assoc($Query2);
$nombre_kin = $row2['nombre'];

return array($dia, $nombre_kin, $mes, $nombre_uinal);
