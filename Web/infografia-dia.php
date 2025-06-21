<?php 
// mostrar errores
// error_reporting(E_ALL);
// ini_set('display_errors', 1);
session_start();
date_default_timezone_set('US/Central');

$conn = include "conexion/conexion.php";
// añadido para obtener la ruta del fondo
require_once './helpers/functions.php';
$urlFondo = obtenerRutaFondo($conn);

if (isset($_GET['fecha'])) {
    $fecha_consultar = $_GET['fecha'];
} else {
    date_default_timezone_set('US/Central');
    $fecha_consultar = date("Y-m-d");
}

$nahual = include 'backend/buscar/conseguir_nahual_nombre.php';
$energia = include 'backend/buscar/conseguir_energia_numero.php';
$numero_energia = strval($energia);
$nombre_nahual = calcularNahual($fecha_consultar, $conn);
$nombre_nahual = str_replace("'", "\\'", $nombre_nahual);
$result_energia = $conn->query("SELECT nombre, significado FROM energia WHERE id = "
    . $numero_energia . ";");
$result_nahual = $conn->query("SELECT significado FROM nahual WHERE nombre = '"
    . $nombre_nahual . "';");
$row_energia = $result_energia->fetch_assoc();
$nombre_energia = str_replace("'", "\\'", strval($row_energia['nombre']));
$significado_energia = strval($row_energia['significado']);
$row_nahual = $result_nahual->fetch_assoc();
$significado_nahual = strval($row_nahual['significado']);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <link rel="icon" href="img/piramide-maya.png">
    <title>Tiempo Maya – Infografía del día</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <?php include "blocks/bloquesCss.html"; ?>
    <link rel="stylesheet" href="css/estilo.css?v=<?php echo rand(); ?>" />
    <link rel="stylesheet" href="css/sabiduriaMaya.css?v=<?php echo rand(); ?>" />
    <script src="js/generar_infografia.js"></script>
</head>

<body>
    <?php include "NavBar.php"; ?>

    <section id="inicio"
        style="background: url('<?php echo $urlFondo; ?>') center/cover no-repeat fixed; height:100vh;">
        <div id="inicioContainer" class="inicio-container">
            <div id='formulario'>
                <h1>Infografía del día</h1>
                <form action="#" method="GET">
                    <div class="mb-1">
                        <label for="fecha" class="form-label">Fecha a buscar</label>
                        <input type="date" class="form-control" name="fecha" id="fecha"
                            value="<?php echo $fecha_consultar; ?>">
                    </div>
                    <button id="btnGenerarInfografia" type="submit" class="btn btn-get-started">
                        <i class="far fa-clock"></i> Generar
                    </button>
                </form>

                <canvas id="canvas"></canvas>
                <script>
                document.getElementById('btnGenerarInfografia').addEventListener('click', function() {
                    generarInfografia('<?php echo $nombre_energia; ?>', '<?php echo $significado_energia; ?>',
                        '<?php echo $nombre_nahual; ?>', '<?php echo $significado_nahual; ?>');
                });
                </script>
                <script>
                generarInfografia('<?php echo $nombre_energia; ?>', '<?php echo $significado_energia; ?>',
                    '<?php echo $nombre_nahual; ?>', '<?php echo $significado_nahual; ?>');
                </script>
            </div>
        </div>
    </section>

    <?php include "blocks/bloquesJs1.html"; ?>
    <script src="js/animation.js"></script>
    <script src="js/changeBackground.js"></script>
</body>

</html>