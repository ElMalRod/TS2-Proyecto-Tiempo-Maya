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

// Modificar el formato para mostrar (intercambiar número y nombre)
$cholquij_mostrar = strval($energia) . " " . $nahual;
$haab_mostrar = preg_replace("/([\']|\w+) (\d+)/", '${2} ${1}', $haab);

// Mantener el formato original para las imágenes
$img1 = strtolower(str_replace("'", "", preg_replace("/([\']|\w+) (\d+)/", '${1}', $haab)));
$img2 = strtolower(str_replace("'", "", preg_replace("/([\']+|\w+) (\d+)/", '${1}', $nahual . " " . strval($energia))));

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
                    <span class="info-value-modern"><?php echo isset($haab_mostrar) ? $haab_mostrar : ''; ?></span>
                </div>
                <div class="info-line-modern">
                    <i class="fas fa-calendar-alt"></i> Calendario Cholquij
                    <span
                        class="info-value-modern"><?php echo isset($cholquij_mostrar) ? $cholquij_mostrar : ''; ?></span>
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
            <div class="index-info-row">
                <div class="index-img-block glass">
                    <h4>Calendario Haab</h4>
                    <img src='img/uinal/<?php echo $img1; ?>.png' alt='imagen de <?php echo $img1; ?>'
                        class='index-img' />
                    <h4 class='index-titulo'><?php echo $haab_mostrar; ?></h4>
                </div>
                <div class="index-img-block glass">
                    <h4>Calendario Cholq'ij</h4>
                    <img src='./img/nahual/<?php echo $img2; ?>.png' alt='imagen de <?php echo $img2; ?>'
                        class='index-img' />
                    <h4 class='index-titulo'><?php echo $cholquij_mostrar; ?></h4>
                </div>
                <div class="index-img-block glass">
                    <h4>Cuenta Larga</h4>
                    <img src='./img/calendario.png' alt='imagen de calendario' class='index-img' />
                    <h4 class='index-titulo'><?php echo $cuenta_larga; ?></h4>
                </div>
            </div>
        </div>

    </section>
    <?php include "blocks/bloquesJs1.html" ?>
    <script src="js/animation.js"></script>
    <script src="js/changeBackground.js"></script>
    <script>
    document.addEventListener('keydown', function(e) {
        if (e.key.toLowerCase() === 'k' && e.ctrlKey && e.shiftKey) { // K'in = Sol/día en maya
            e.preventDefault();

            const mensaje = document.createElement('div');
            mensaje.innerHTML = `
        <div style="
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: linear-gradient(135deg, #1a5a73, #0d2d4a);
            color: #f0e6d2;
            padding: 25px;
            border-radius: 15px;
            border: 2px solid #c7a17a;
            box-shadow: 0 0 30px rgba(199, 161, 122, 0.7);
            z-index: 9999;
            text-align: center;
            max-width: 300px;
            font-family: 'Arial', sans-serif;
        ">
            <div style="
                font-size: 24px;
                color: #c7a17a;
                margin-bottom: 15px;
                text-shadow: 1px 1px 3px #000;
            ">
                <i class="fas fa-star"></i> K'inich Ajaw <i class="fas fa-star"></i>
            </div>
            <p style="margin: 10px 0; line-height: 1.5;">
                <span style="color: #e8c07d;">#16</span> Luis Emilio M.R.<br>
                <span style="font-size: 14px;">Integrador del Tiempo Maya V2025</span>
            </p>
            <div style="
                border-top: 1px solid #c7a17a;
                margin: 15px 0;
                padding-top: 10px;
                font-size: 12px;
                color: #a7c4bc;
            ">
                "Como el jade, el código perdura"
            </div>
            <small style="color: #a7c4bc;">Presiona ESC para cerrar</small>
        </div>
        `;

            document.body.appendChild(mensaje);

            document.addEventListener('keydown', function closeMsg(e) {
                if (e.key === 'Escape') {
                    mensaje.remove();
                    document.removeEventListener('keydown', closeMsg);
                }
            });
        }
    });
    </script>
</body>

</html>