<?php
// paginaModelo.php

session_start();

// 1) Capturar idioma de la URL y guardarlo en sesión
if (isset($_GET['idioma'])) {
    $_SESSION['idioma'] = $_GET['idioma'];
}
$idioma = $_SESSION['idioma'] ?? 'es';

// 2) Conexión y obtención de categoría
$conn   = include __DIR__ . '/../conexion/conexion.php';
$pagina = $_GET['pagina'] ?? '';

// 3) Determinar columna de contenido según idioma
switch ($idioma) {
    case 'en':
        $columna = 'htmlCodigo_en';
        break;
    case 'qu':
        $columna = 'htmlCodigo_qu';
        break;
    case 'kq':
        $columna = 'htmlCodigo_kq';
        break;
    case 'yu':
        $columna = 'htmlCodigo_yu';
        break;
    default:
        $columna = 'htmlCodigo';
}

// 4) Consultas con la columna dinámica
$informacion      = "SELECT {$columna} AS htmlCodigo, seccion, nombre
                  FROM tiempomaya.pagina
                 WHERE categoria = ?
              ORDER BY orden";
$stmtInfo    = $conn->prepare($informacion);
$stmtInfo->bind_param('s', $pagina);
$stmtInfo->execute();
$informacion = $stmtInfo->get_result();

$secciones  = "SELECT seccion
                    FROM tiempomaya.pagina
                   WHERE categoria = ?
                GROUP BY seccion
                ORDER BY orden";
$stmtSec       = $conn->prepare($secciones);
$stmtSec->bind_param('s', $pagina);
$stmtSec->execute();
$secciones     = $stmtSec->get_result();

$elementos     = "SELECT nombre
                    FROM tiempomaya.pagina
                   WHERE categoria = ?
                     AND nombre <> 'Informacion'
                     AND seccion <> 'Informacion'
                ORDER BY orden";
$stmtElm       = $conn->prepare($elementos);
$stmtElm->bind_param('s', $pagina);
$stmtElm->execute();
$elementos     = $stmtElm->get_result();

// Hora para JS
date_default_timezone_set('America/Mexico_City');
$horario = date("H:i:s");




?>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<link rel="icon" href="../img/piramide-maya.png">
	<title>Tiempo Maya - <?php echo $pagina ?></title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport">
	<?php include "../blocks/bloquesCss.html" ?>
	<link rel="stylesheet" href="../css/estilo.css?v=<?php echo (rand()); ?>" />
	<link rel="stylesheet" href="../css/estiloAdmin.css?v=<?php echo (rand()); ?>" />
	<link rel="stylesheet" href="../css/paginaModelo.css?v=<?php echo (rand()); ?>" />
	<link rel="stylesheet" href="../css/animation.css" />
	<link rel="stylesheet" href="../css/index.css?v=<?php echo (rand()); ?>" />
	<link rel="stylesheet" href="../css/ruedaCalendario.css?v=<?php echo (rand()); ?>" />


</head>
<?php include "../NavBar2.php" ?>

<body>
	<section id="inicio"  style="background: url(<?php echo $fondo; ?>) top center;">
		<div id="inicioContainer" class="inicio-container">

			<?php echo "<h1>" . $pagina . " </h1>";
			foreach ($secciones as $seccion) {
				echo " <a href='#" . $seccion['seccion'] . "' class='btn-get-started'>" . $seccion['seccion'] . "</a>";
			}
			?>
		</div>
	</section>

	<?php


	foreach ($secciones as $seccion) {
		$stringPrint = "<section id='" . $seccion['seccion'] . "'> <div class='container'> <div class='section-header'><h3 class='section-title'>" . $seccion['seccion'] . " </h3> </div>";
		foreach ($informacion as $info) {
			if ($seccion['seccion'] == $info['seccion']) {
				if ($info['seccion'] != "Informacion") {

					$stringPrint .= "<h2><a href='paginaModeloElemento.php?elemento=" . $info['nombre'] . "'/>" . $info['nombre'] . " </a></h2>";
				}
				$stringPrint .= "<hr>";
				$stringPrint .= $info['htmlCodigo'];
				foreach ($elementos as $elemento) {
					if ($elemento['nombre'] != 'Uayeb' && $elemento['nombre'] == $info['nombre']) {
						$tabla = strtolower($elemento['nombre']);
						$elementosEl = $conn->query("SELECT nombre FROM tiempomaya." . $tabla . ";");
						$stringPrint .= "<ul>";
						foreach ($elementosEl as $el) {
							if ($el['nombre'] == "Informacion") {
								$stringPrint .= "<li> <a href='#'>" . $el['nombre'] . " </a> </li>";
							} else {
								$stringPrint .= "<li> <a href='paginaModeloElemento.php?elemento=" . $info['nombre'] . "#" . $el['nombre'] . "'>" . $el['nombre'] . " </a> </li>";
							}
						}
						$stringPrint .= "</ul>";
					}
				}
			}
		}
		$stringPrint .= "</div> </section> <hr>";
		echo $stringPrint;
	}

	?>
	        <?php
        if ($pagina === "Rueda Calendarica") {
            include_once $_SERVER['DOCUMENT_ROOT'] . "/models/ruedaCalendarica.php";
        } else if ($pagina === "Cuenta Larga") {
            include_once $_SERVER['DOCUMENT_ROOT'] . "/models/cuenta-larga.php";
        } else if ($pagina === "Calendario Cholquij") {
            include_once $_SERVER['DOCUMENT_ROOT'] . "/models/cruz-maya.php";
        }
        ?>

	<?php include "../blocks/bloquesJs1.html" ?>
	<script src="../js/animation.js"></script>
	<script src="../js/changeBackground.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

</body>

</html>