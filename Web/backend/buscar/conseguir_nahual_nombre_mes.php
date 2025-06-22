<?php
// Conexión a la base de datos
$conn = include "conexion/conexion.php";
date_default_timezone_set('US/Central');

// Crear un DateTime para el primer y último día del mes
$inicioMes = new DateTime("$anioSeleccionado-$mesSeleccionado-01");
$finMes    = clone $inicioMes;
$finMes->modify('last day of this month');

// Intervalo de un día
$intervalo = new DateInterval('P1D');
// NOTA: para incluir el último día, agregamos +1 día al periodo
$periodo = new DatePeriod($inicioMes, $intervalo, $finMes->modify('+1 day'));

// Array para almacenar los resultados
$resultados = [];

// Constantes de cálculo (en días)
$formato = mktime(0, 0, 0, 1, 1, 1720) / (24 * 60 * 60);

foreach ($periodo as $fecha) {
    // Convertir la fecha a 'días' (float) y luego a entero
    $fechaUnix = $fecha->getTimestamp() / (24 * 60 * 60);
    $id        = intval($fechaUnix - $formato);

    // Módulo 20 sin deprecación
    $nahual = $id % 20;
    if ($nahual < 0) {
        $nahual += 20; // ajusta negativos
    }

    // Consultar el nombre del Nahual de la base de datos
    $Query = $conn->query("SELECT nombre FROM nahual WHERE idweb = {$nahual}");
    $row   = mysqli_fetch_assoc($Query);
    $nombreNahual = $row['nombre'] ?? null;

    // Almacenar el resultado en el array con el día como clave entera
    $resultados[intval($fecha->format('d'))] = $nombreNahual;
}

return $resultados;
