<?php

$baseline = mktime(0, 0, 0, 1, 1, 1720);
// Timestamp de la fecha a consultar
$timestamp = strtotime($fecha_consultar);
// Cálculo entero de días transcurridos
$days = intval(floor( ($timestamp - $baseline) / 86400 ));
// Índice nahual (módulo 20 en positivo)
$idx   = ($days % 20 + 20) % 20;

$Query = $conn->query("SELECT nombre FROM nahual WHERE idweb={$idx};");
$row   = mysqli_fetch_assoc($Query);
return $row['nombre'];
