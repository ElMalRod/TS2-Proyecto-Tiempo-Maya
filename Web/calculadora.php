<?php session_start(); ?>
<?php
date_default_timezone_set('US/Central');
include("backend/buscar/conseguir_cruz.php");
include("backend/buscar/conseguir_infografia.php");

$conn = include "conexion/conexion.php";

if (isset($_GET['fecha'])) {
	$fecha_consultar = $_GET['fecha'];
} else {
	$fecha_consultar = date("Y-m-d");
}

$nahual = include 'backend/buscar/conseguir_nahual_nombre.php';
$energia = include 'backend/buscar/conseguir_energia_numero.php';
$haab = include 'backend/buscar/conseguir_uinal_nombre.php';
$cuenta_larga = include 'backend/buscar/conseguir_fecha_cuenta_larga.php';
$cholquij = $nahual . " " . strval($energia);
$img1 = strtolower(str_replace("'", "", preg_replace("/([\']|\w+) (\d+)/", '${1}', $haab)));
$img2 = strtolower(str_replace("'", "", preg_replace("/([\']+|\w+) (\d+)/", '${1}', $cholquij)));

$cruz_info = getCruzInfo($nahual, $conn);
$nac_img = strtolower(str_replace("'", "", preg_replace("/([\']+|\w+) (\d+)/", '${1}', $cruz_info['nacimiento'])));
$conc_img = strtolower(str_replace("'", "", preg_replace("/([\']+|\w+) (\d+)/", '${1}', $cruz_info['concepcion'])));
$des_img = strtolower(str_replace("'", "", preg_replace("/([\']+|\w+) (\d+)/", '${1}', $cruz_info['destino'])));
$izq_img = strtolower(str_replace("'", "", preg_replace("/([\']+|\w+) (\d+)/", '${1}', $cruz_info['izquierdo'])));
$der_img = strtolower(str_replace("'", "", preg_replace("/([\']+|\w+) (\d+)/", '${1}', $cruz_info['derecho'])));

$fuerza = $energia;
$energia_info = getEnergiaInfo($fuerza, $conn);
$nahual_significado = getNahualSignificado($nahual, $conn);
$animal = getAnimalGuia($nahual, $conn);

?>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<link rel="icon" href="img/piramide-maya.png">
	<title>Tiempo Maya - Calculadora</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<?php include "blocks/bloquesCss.html" ?>
	<link rel="stylesheet" href="css/estilo.css?v=<?php echo (rand()); ?>" />
	<link rel="stylesheet" href="css/estiloAdmin.css?v=<?php echo (rand()); ?>" />
	<link rel="stylesheet" href="css/animation.css" />
	<link rel="stylesheet" href="./css/calculadora.css" />
	<link rel="stylesheet" href="css/index.css?v=<?php echo (rand()); ?>" />
</head>

<body>

	<?php include "NavBar.php" ?>
	<div>
		<section id="inicio">
			<div id="inicioContainer" class="inicio-container">

				<div id='formulario'>
					<h1>Calculadora</h1>
					<form action="#" method="GET">
						<div class="mb-1">
							<label for="fecha" class="form-label">Fecha</label>
							<input type="date" class="form-control" name="fecha" id="fecha" value="<?php echo isset($fecha_consultar) ? $fecha_consultar : ''; ?>">
						</div>
						<button type="submit" class="btn btn-get-started"><i class="far fa-clock"></i> Calcular</button>
					</form>

					<div class="info-container">
						<div>
							<?php
							echo "<img src='img/uinal/$img1.png' alt='imagen de $img1' class='index-img' />";
							echo "<h4 class='text-white text-center mt-4 info'>$haab</h4>";
							?>
						</div>
						<div>
							<?php
							echo "<img src='./img/nahual/$img2.png' alt='imagen de $img2' class='index-img' />";
							echo "<h4 class='text-white text-center mt-4 info'>$cholquij</h4>";
							?>
						</div>
						<div>
							<?php
							echo "<img src='./img/calendario.png' alt='imagen de calendario' class='index-img' />";
							echo "<h4 class='text-white text-center mt-4 info'>$cuenta_larga</h4>";
							?>
						</div>
					</div>
				</div>

			</div>
		</section>

	</div>


	<?php include "blocks/bloquesJs1.html" ?>
	<script src="js/animation.js"></script>
	<script src="js/changeBackground.js"></script>

</body>

</html>