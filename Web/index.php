<?php
$conn = include "conexion/conexion.php";

if (isset($_GET['fecha'])) {
    $fecha_consultar = $_GET['fecha'];
} else {
    date_default_timezone_set('America/Guatemala');
    $fecha_consultar = date("Y-m-d");
}

$nahual = include 'backend/buscar/conseguir_nahual_nombre.php';
$energia = include 'backend/buscar/conseguir_energia_numero.php';
$haab = include 'backend/buscar/conseguir_uinal_nombre.php';
$cuenta_larga = include 'backend/buscar/conseguir_fecha_cuenta_larga.php';
$cholquij = $nahual . " " . strval($energia);
$img1 = strtolower(str_replace("'", "", preg_replace("/([\']|\w+) (\d+)/", '${1}', $haab)));
$img2 = strtolower(str_replace("'", "", preg_replace("/([\']+|\w+) (\d+)/", '${1}', $cholquij)));

$hour = date('H');
$fondo = '/img/FondoDia.jpg';
if ($hour >= 6 && $hour < 12) {
    $fondo = '/img/FondoDia.jpg';
} elseif ($hour >= 12 && $hour < 18) {
    $fondo = '/img/FondoDia.jpg';
} else {
    $fondo = '/img/FondoNoche.jpg';
}
?>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <link rel="icon" href="img/piramide-maya.png">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <title>Tiempo Maya</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <?php include "blocks/bloquesCss.html" ?>
    <link rel="stylesheet" href="css/estilo.css?v=<?php echo (rand()); ?>" />
    <link rel="stylesheet" href="css/estiloAdmin.css?v=<?php echo (rand()); ?>" />
    <link rel="stylesheet" href="css/animation.css" />
    <link rel="stylesheet" href="css/index.css?v=<?php echo (rand()); ?>" />
    <style>

    </style>
</head>

<body>
    <?php include "NavBar.php" ?>
    <section id="inicio" style="background: url(<?php echo $fondo; ?>) top center;">
        <div
            style="width: 100%; display: flex; flex-direction: column; align-items: center; min-height: 90vh; justify-content: center;">
            <div class="center-card-glass">
                <br>
                <br>
                <br>
                <br>
                <div class="main-title-glass">
                    BIENVENIDO AL TIEMPO MAYA
                </div>
                <div class="info-line-modern">
                    <i class="fas fa-calendar-day"></i> Calendario Haab
                    <span class="info-value-modern"><?php echo isset($haab) ? $haab : ''; ?></span>
                </div>
                <div class="info-line-modern">
                    <i class="fas fa-calendar-alt"></i> Calendario Cholquij
                    <span class="info-value-modern"><?php echo isset($cholquij) ? $cholquij : ''; ?></span>
                </div>
                <div class="info-line-modern">
                    <i class="fas fa-history"></i> Cuenta Larga
                    <span class="info-value-modern"><?php echo isset($cuenta_larga) ? $cuenta_larga : ''; ?></span>
                </div>
                <div class="fecha-modern">
                    <?php echo isset($fecha_consultar) ? $fecha_consultar : ''; ?>
                </div>
            </div>
            <br>
            <div class="calculadora-info-row">
                <div class="calculadora-img-block glass">
                    <h4>Calendario Haab</h4>
                    <img src='img/uinal/<?php echo $img1; ?>.png' alt='imagen de <?php echo $img1; ?>'
                        class='index-img' />
                    <h4 class='calculadora-titulo'><?php echo $haab; ?></h4>
                </div>
                <div class="calculadora-img-block glass">
                    <h4>Calendario Cholq'ij</h4>
                    <img src='./img/nahual/<?php echo $img2; ?>.png' alt='imagen de <?php echo $img2; ?>'
                        class='index-img' />
                    <h4 class='calculadora-titulo'><?php echo $cholquij; ?></h4>
                </div>
                <div class="calculadora-img-block glass">
                    <h4>Cuenta Larga</h4>
                    <img src='./img/calendario.png' alt='imagen de calendario' class='index-img' />
                    <h4 class='calculadora-titulo'><?php echo $cuenta_larga; ?></h4>
                </div>
            </div>
        </div>

    </section>
    <?php include "blocks/bloquesJs1.html" ?>
    <script src="js/animation.js"></script>
    <script src="js/changeBackground.js"></script>
</body>

</html>