<?php
if (session_status() !== PHP_SESSION_ACTIVE) session_start();
date_default_timezone_set('US/Central');

$conn = include 'conexion/conexion.php';
require_once './helpers/functions.php';
$urlFondo = obtenerRutaFondo($conn);

// Cuenta Larga
if (isset($_GET['baktun'], $_GET['katun'], $_GET['tun'], $_GET['uinal'], $_GET['kin'])) {
    $baktuns = intval($_GET['baktun']);
    $katuns  = intval($_GET['katun']);
    $tuns    = intval($_GET['tun']);
    $uinals  = intval($_GET['uinal']);
    $kins    = intval($_GET['kin']);
    $calendario_gregoriano = include 'backend/buscar/conseguir_fecha_calendario_gregoriano.php';
} else {
    $calendario_gregoriano = date('Y-m-d');
    list($baktuns, $katuns, $tuns, $uinals, $kins) =
        explode('.', include 'backend/buscar/conseguir_fecha_cuenta_larga.php');
}

// Haab y Cholq'ij
$fecha_consultar = $calendario_gregoriano;
$haab    = include 'backend/buscar/conseguir_uinal_nombre.php';
$nahual  = include 'backend/buscar/conseguir_nahual_nombre.php';
$energia = include 'backend/buscar/conseguir_energia_numero.php';
$cholqij = "$nahual $energia";
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Calculadora de Cuenta Larga</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php include 'blocks/bloquesCss.html'; ?>
    <link rel="stylesheet" href="css/estilo.css?v=<?php echo rand(); ?>">
    <link rel="stylesheet" href="css/index.css?v=<?php echo rand(); ?>">
    <link rel="stylesheet" href="css/calculadora.css?v=<?php echo rand(); ?>">
    <link rel="stylesheet" href="css/animation.css?v=<?php echo rand(); ?>">
    <!-- Estilos propios de Cuenta Larga -->
    <link rel="stylesheet" href="css/calculadora-cuenta-larga.css?v=<?php echo rand(); ?>">
</head>
<body>
    <?php include 'NavBar.php'; ?>
    <section id="inicio">
        <div id="inicioContainer">
            <h1>Calculadora de Cuenta Larga</h1>
            <div id="formulario-cuenta-larga">
                <h2>Ingresar Valores</h2>
                <form method="get">
                    <div class="form-cuenta-row">
                        <div class="form-cuenta-group">
                            <label>Baktún</label>
                            <input type="number" name="baktun" min="0" max="19" class="form-control-cuenta-larga"
                                   value="<?php echo $baktuns; ?>">
                        </div>
                        <div class="form-cuenta-group">
                            <label>Katún</label>
                            <input type="number" name="katun" min="0" max="19" class="form-control-cuenta-larga"
                                   value="<?php echo $katuns; ?>">
                        </div>
                        <div class="form-cuenta-group">
                            <label>Tun</label>
                            <input type="number" name="tun" min="0" max="19" class="form-control-cuenta-larga"
                                   value="<?php echo $tuns; ?>">
                        </div>
                        <div class="form-cuenta-group">
                            <label>Uinal</label>
                            <input type="number" name="uinal" min="0" max="17" class="form-control-cuenta-larga"
                                   value="<?php echo $uinals; ?>">
                        </div>
                        <div class="form-cuenta-group">
                            <label>Kin</label>
                            <input type="number" name="kin" min="0" max="19" class="form-control-cuenta-larga"
                                   value="<?php echo $kins; ?>">
                        </div>
                    </div>
                    <button type="submit"><i class="far fa-clock"></i> Calcular</button>
                </form>
                <table id="tabla-cuenta-larga">
                    <tr><th>Calendario Haab</th><td><?php echo $haab; ?></td></tr>
                    <tr><th>Cholq'ij</th><td><?php echo $cholqij; ?></td></tr>
                    <tr><th>Gregoriano</th>
                        <td><?php echo date('m/d/Y', strtotime($calendario_gregoriano)); ?></td></tr>
                </table>
            </div>
        </div>
    </section>
    <?php include 'blocks/bloquesJs1.html'; ?>
    <script src="js/animation.js"></script>
    <script src="js/changeBackground.js"></script>
</body>
</html>
