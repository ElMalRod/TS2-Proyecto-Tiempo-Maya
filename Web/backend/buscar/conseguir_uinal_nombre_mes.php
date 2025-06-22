<?php
// Asegúrate de que las conexiones y la zona horaria estén correctamente configuradas
$conn = include "conexion/conexion.php";
date_default_timezone_set('US/Central');

$fecha1 = new DateTime("1990-04-03");

$inicioMes = new DateTime("$anioSeleccionado-$mesSeleccionado-01");
$finMes = clone $inicioMes;
$finMes->modify('last day of this month');

$intervalo = new DateInterval('P1D');
$periodo = new DatePeriod($inicioMes, $intervalo, $finMes);

$resultados = []; // Inicializa el array para almacenar los resultados

foreach ($periodo as $fecha) {
    $fecha2 = $fecha;
    $diff = $fecha1->diff($fecha2);
    $dias = $diff->days;
    $reversa = ($fecha1 > $fecha2);

    if ($reversa) {
        $dias = $dias % 365;
        if ($dias < 360) {
            $mes = 18 - ceil($dias / 20);
            $dia = 20 - $dias % 20;
        } else {
            $mes = 0;
            $dia = 365 - $dias;
        }
    } else {
        if ($dias >= 365) {
            $dias = $dias % 365;
        }
        if ($dias > 5) {
            $dias = $dias - 5;
            $diasmes = $dias + 1;
            $mes = ceil($diasmes / 20);
            $dia = $dias % 20;
        } else {
            $mes = 0;
            $dia = $dias % 20;
        }
    }

    $Query = $conn->query("SELECT nombre FROM uinal WHERE idweb=" . $mes . " ;");
    $row = mysqli_fetch_assoc($Query);
    $uinal = $row['nombre'] . " ";
    $resultado = $uinal . strval($dia);

    // Convierte la clave de día a un entero
    $dayKey = intval($fecha->format('d'));
    $resultadosUniales[$dayKey] = $resultado;
}

return $resultadosUniales;