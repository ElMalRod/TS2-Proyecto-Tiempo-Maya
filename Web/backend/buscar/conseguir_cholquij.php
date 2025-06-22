<?php

$fecha1 = new DateTime("1719-12-19");
$fecha2 = new DateTime($fecha_consultar);

$fecha_actual = strtotime(date("d-m-Y H:i:00", $fecha1->getTimestamp()));
$fecha_entrada = strtotime($fecha_consultar);

$diff = $fecha1->diff($fecha2);

$reversa = $fecha_actual > $fecha_entrada;

$num_nahual = $diff->days % 20;

if ($num_nahual && $reversa) {
	$num_nahual = 20 - $num_nahual;
}

$num_nahual++;

$queryNahual = $conn->query("SELECT nombre, iddesk FROM nahual WHERE iddesk=" . $num_nahual . " ;");
$rowNahual = mysqli_fetch_assoc($queryNahual);
$nombre_nahual = $rowNahual['nombre'];
$num_nahual = $rowNahual['iddesk'];

$num_energia = $diff->days % 13;

if ($num_energia && $reversa) {
	$num_energia = 13 - $num_energia;
}

$num_energia++;

$queryEnergia = $conn->query("SELECT nombre FROM energia WHERE id=" . $num_energia . " ;");
$rowEnergia = mysqli_fetch_assoc($queryEnergia);
$nombre_energia = $rowEnergia['nombre'];

return array($num_energia, $nombre_energia, $num_nahual, $nombre_nahual);
