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


function calcularNahual($fecha_consultar, $conn)
{
	$formato = mktime(0, 0, 0, 1, 1, 1720) / (24 * 60 * 60);
	$fecha = date("U", strtotime($fecha_consultar)) / (24 * 60 * 60);
	$id = $fecha - $formato;
	$nahual = $id % 20;
	if ($nahual < 0) {
		$nahual = 19 + $nahual;
	}
	$Query = $conn->query("SELECT nombre FROM nahual WHERE idweb=" . $nahual . " ;");
	$row = mysqli_fetch_assoc($Query);
	$query = $row['nombre'];
	return $query;
}
?>
