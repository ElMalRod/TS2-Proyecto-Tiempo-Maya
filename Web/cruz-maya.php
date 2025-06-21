<?php session_start(); ?>
<?php
$conn = include "conexion/conexion.php";

if (isset($_GET['fecha'])) {
    $fecha_consultar = $_GET['fecha'];
} else {
    date_default_timezone_set('US/Central');
    $fecha_consultar = date("Y-m-d");
}

$nahual = include 'backend/buscar/conseguir_nahual_nombre.php';
$cruz_maya = include 'backend/buscar/conseguir_cruz_maya.php';
$mano_derecha = calcularNahual($cruz_maya[0], $conn);
$mano_derecha = str_replace("'", "\\'", $mano_derecha);
$mano_izquierda = calcularNahual($cruz_maya[1], $conn);
$mano_izquierda = str_replace("'", "\\'", $mano_izquierda);
$concepcion = calcularNahual($cruz_maya[2], $conn);
$concepcion = str_replace("'", "\\'", $concepcion);
$destino = calcularNahual($cruz_maya[3], $conn);
$destino = str_replace("'", "\\'", $destino);
$nombre_nahual = calcularNahual($fecha_consultar, $conn);
$nombre_nahual = str_replace("'", "\\'", $nombre_nahual);

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
	<link rel="icon" href="img/piramide-maya.png">
    <title>Tiempo Maya - Cruz Maya</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <?php include "blocks/bloquesCss.html" ?>
    <link rel="stylesheet" href="css/estilo.css?v=<?php echo (rand()); ?>" />
    <link rel="stylesheet" href="css/sabiduriaMaya.css?v=<?php echo (rand()); ?>" />
    <script src="js/generar_cruz.js"></script>
</head>

<body>

    <?php include "NavBar.php" ?>
    <div>
        <section id="inicio">
            <video src="./img/background.mp4" autoplay="true" muted="true" loop="true"></video>
            <div id="inicioContainer" class="inicio-container">
                <div id='formulario'>
                    <h1>Cruz Maya</h1>
                    <form action="#" method="GET">
                        <div class="mb-1">
                            <label for="fecha" class="form-label">Fecha a buscar</label>
                            <input type="date" class="form-control" name="fecha" id="fecha"
                                value="<?php echo isset($fecha_consultar) ? $fecha_consultar : ''; ?>">
                        </div>
                        <button id="btnGenerarCruz" type="submit" class="btn btn-get-started"><i
                                class="far fa-clock"></i>Generar</button>
                    </form>
                    <canvas id="canvas"></canvas>
                    <script>
                        document.getElementById('btnGenerarCruz').addEventListener('click', function () {
                            generarCruz('<?php echo $mano_izquierda; ?>', '<?php echo $concepcion; ?>', '<?php echo $nombre_nahual; ?>', '<?php echo $destino; ?>', '<?php echo $mano_derecha; ?>');
                        });
                    </script>
                    <script>
                        generarCruz('<?php echo $mano_izquierda; ?>', '<?php echo $concepcion; ?>', '<?php echo $nombre_nahual; ?>', '<?php echo $destino; ?>', '<?php echo $mano_derecha; ?>');
                    </script>
                </div>
            </div>
    </div>
    </section>
    <br><br>
    </div>

    <?php include "blocks/bloquesJs1.html" ?>

</body>

</html>