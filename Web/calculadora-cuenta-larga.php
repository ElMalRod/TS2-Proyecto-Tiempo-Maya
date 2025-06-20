<?php session_start(); ?>
<?php
$conn = include "conexion/conexion.php";
if (isset($_GET['baktun'], $_GET['katun'], $_GET['tun'], $_GET['uinal'], $_GET['kin'])) {
    $baktuns = $_GET['baktun'];
    $katuns = $_GET['katun'];
    $tuns = $_GET['tun'];
    $uinals = $_GET['uinal'];
    $kins = $_GET['kin'];
    $fecha_consultar = include 'backend/buscar/conseguir_fecha_calendario_gregoriano.php';
} else {
    date_default_timezone_set('US/Central');
    $fecha_consultar = date("Y-m-d");
    $partes = explode('.', include 'backend/buscar/conseguir_fecha_cuenta_larga.php');
    $baktuns = $partes[0];
    $katuns = $partes[1];
    $tuns = $partes[2];
    $uinals = $partes[3];
    $kins = $partes[4];
}
$nahual = include 'backend/buscar/conseguir_nahual_nombre.php';
$energia = include 'backend/buscar/conseguir_energia_numero.php';
$haab = include 'backend/buscar/conseguir_uinal_nombre.php';
$cuenta_larga = include 'backend/buscar/conseguir_fecha_cuenta_larga.php';
$calendario_gregoriano = include 'backend/buscar/conseguir_fecha_calendario_gregoriano.php';
$nombre_nahual = calcularNahual($fecha_consultar, $conn);
$cholquij = $nombre_nahual . " " . strval($energia);
$fecha_haab = $haab[0];

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
	<link rel="icon" href="img/piramide-maya.png">
    <title>Tiempo Maya - Calculadora de Cuenta Larga</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <?php include "blocks/bloquesCss.html" ?>
    <link rel="stylesheet" href="css/estilo.css?v=<?php echo (rand()); ?>" />
    <link rel="stylesheet" href="css/calculadora.css?v=<?php echo (rand()); ?>" />
</head>

<body>

    <?php include "NavBar.php"; ?>
    <div>
        <section id="inicio">
            <video src="./img/background.mp4" autoplay="true" muted="true" loop="true"></video>
            <div id="inicioContainer" class="inicio-container">
                <div id='formulario'>
                    <h1>Calculadora</h1>
                    <label for="fecha" class="form-label">Fecha en Cuenta Larga</label><br>
                    <form action="#" method="GET">
                        <div class="form-container">
                            <div class="form-group">
                                <label for="baktun">Baktún</label>
                                <input type="number" class="form-control-cuenta-larga" id="baktun" name="baktun" min="0"
                                    max="19" required value="<?php echo $baktuns; ?>">
                            </div>
                            <div class="form-group">
                                <label for="katun">Katún</label>
                                <input type="number" class="form-control-cuenta-larga" id="katun" name="katun" min="0"
                                    max="19" required value="<?php echo $katuns; ?>">
                            </div>
                            <div class="form-group">
                                <label for="tun">Tun</label>
                                <input type="number" class="form-control-cuenta-larga" id="tun" name="tun" min="0"
                                    max="19" required value="<?php echo $tuns; ?>">
                            </div>
                            <div class="form-group">
                                <label for="uinal">Uinal</label>
                                <input type="number" class="form-control-cuenta-larga" id="uinal" name="uinal" min="0"
                                    max="17" required value="<?php echo $uinals; ?>">
                            </div>
                            <div class="form-group">
                                <label for="kin">Kin</label>
                                <input type="number" class="form-control-cuenta-larga" id="kin" name="kin" min="0"
                                    max="19" required value="<?php echo $kins; ?>">
                            </div>
                        </div>
                        <button type="submit" class="btn btn-get-started"><i class="far fa-clock"></i> Calcular</button>
                    </form>
                    <div id="tabla">
                        <table class="table table-dark table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">Calendario</th>
                                    <th scope="col" style="width: 60%;">Fecha</th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">Calendario Haab</th>
                                    <td><?php echo isset($fecha_haab) ? $fecha_haab : ''; ?></td>
                                </tr>
                                <tr>
                                    <th scope="row">Calendario Cholquij</th>
                                    <td><?php echo isset($cholquij) ? $cholquij : ''; ?></td>
                                </tr>
                                <tr>
                                    <th scope="row">Calendario Gregoriano</th>
                                    <td><?php echo isset($calendario_gregoriano) ? date("m/d/Y", strtotime($calendario_gregoriano)) : ''; ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
    </div>
    </section>
    <br><br>
    </div>


    <?php include "blocks/bloquesJs1.html" ?>

</body>

</html>