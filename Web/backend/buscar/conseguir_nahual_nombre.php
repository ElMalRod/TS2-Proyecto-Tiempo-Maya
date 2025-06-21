<?php
$baselineTs = mktime(0, 0, 0, 1, 1, 1720);
$queryTs    = strtotime($fecha_consultar);

// diferencia en segundos
$diffSeconds = $queryTs - $baselineTs;

// número de días completos
$days = intdiv($diffSeconds, 86400);

// índice de nahual entre 0 y 19
$idx = ($days % 20 + 20) % 20;

$result = $conn->query(
    "SELECT nombre 
       FROM nahual 
      WHERE idweb = {$idx}"
);

$row = $result->fetch_assoc();
return $row['nombre'];

/**
 * Función auxiliar para calcular el nahual en otros contextos
 */
function calcularNahual($fecha_consultar, $conn)
{
    $baselineTs = mktime(0, 0, 0, 1, 1, 1720);
    $queryTs    = strtotime($fecha_consultar);
    $days       = intdiv($queryTs - $baselineTs, 86400);
    $idx        = ($days % 20 + 20) % 20;

    $result = $conn->query(
        "SELECT nombre 
           FROM nahual 
          WHERE idweb = {$idx}"
    );
    $row = $result->fetch_assoc();
    return $row['nombre'];
}
