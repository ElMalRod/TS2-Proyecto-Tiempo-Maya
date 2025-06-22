<?php
// Configuración de la zona horaria, esencial para los cálculos de fecha/hora
date_default_timezone_set('US/Central');

// Crear un DateTime para el primer y último día del mes
$inicioMes = new DateTime("$anioSeleccionado-$mesSeleccionado-01");
$finMes    = clone $inicioMes;
$finMes->modify('last day of this month');

// Intervalo de un día
$intervalo = new DateInterval('P1D');
$periodo   = new DatePeriod($inicioMes, $intervalo, $finMes);

// Array para almacenar los resultados
$resultados = [];

// Constante de cálculo basada en una fecha inicial en 1720
$formato = mktime(0, 0, 0, 1, 1, 1720) / (24 * 60 * 60);

foreach ($periodo as $fecha) {
    // Convertir la fecha a "días" (float)
    $fechaUnix = $fecha->getTimestamp() / (24 * 60 * 60);
    $idd       = $fechaUnix - $formato;
    
    // Convertir a entero ANTES de aplicar el módulo para evitar la deprecación
    $iddInt = intval($idd);
    $nn     = $iddInt % 13;
    if ($nn < 0) {
        $nn = 12 + $nn;
    }
    if ($nn === 12) {
        $valor = 1;
    } else {
        $valor = $nn + 2;
    }

    // Almacenar el resultado en el array usando el día como clave entera
    $resultados[intval($fecha->format('d'))] = $valor;
}

return $resultados;
