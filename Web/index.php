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
    html,
    body {
        height: 100%;
        min-height: 100vh;
    }

    body {
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }

    #inicio {
        flex: 1 0 auto;
        min-height: 0;
        background-size: cover;
        background-position: center;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-start;
    }

    .main-title-glass {
        font-size: 2.15rem;
        font-weight: bold;
        color: #fff;
        text-align: center;
        margin-bottom: 2.2rem;
        letter-spacing: .03em;
        line-height: 1.2;

        text-shadow:
            0 2px 16px rgba(0, 0, 0, 0.40),
            0 0 8px rgba(255, 255, 255, 0.15),
            0 0 2px #fff;
        background: rgba(18, 24, 44, 0.25);
        padding: 0.2em 1.2em;
        display: inline-block;
        box-shadow: 0 2px 18px 0 rgba(18, 24, 44, 0.14);
    }

    @media (max-width: 520px) {
        .main-title-glass {
            font-size: 1.28rem;
            padding: 0.2em 0.7em;
        }
    }

    .info-line-modern {
        width: 100%;
        color: #fff;
        background: rgba(18, 24, 44, 0.10);
        border-radius: 0.5rem;
        font-size: 1.18rem;
        font-weight: 500;
        margin-bottom: 1.1rem;
        padding: 0.98rem 1.1rem 0.91rem 1.1rem;
        display: flex;
        align-items: center;
        justify-content: flex-start;
        gap: 0.7em;
        box-shadow: 0 1px 8px rgba(0, 0, 0, 0.09);
    }

    .info-line-modern i {
        font-size: 1.11em;
        margin-right: 0.65em;
    }

    .info-value-modern {
        margin-left: auto;
        font-weight: 600;
        text-align: right;
        color: #fff;
        letter-spacing: 0.01em;
    }

    .fecha-modern {
        margin-top: 0.3rem;
        font-size: 1.09rem;
        text-align: center;
        letter-spacing: .02em;
        color: #fff;
        opacity: 0.97;
        font-weight: 500;
    }

    @media (max-width: 520px) {
        .main-title-glass {
            font-size: 1.22rem;
            margin-bottom: 1.5rem;
        }

        .info-line-modern {
            font-size: 1rem;
            padding: 0.75rem 0.7rem;
        }

        .fecha-modern {
            font-size: 0.97rem;
        }
    }

    #footer {
        flex-shrink: 0;
        margin-top: 0;
    }
    </style>
</head>

<body>
    <?php include "NavBar.php" ?>
    <section id="inicio" style="background: url(<?php echo $fondo; ?>) top center;">
        <div
            style="width: 100%; display: flex; flex-direction: column; align-items: center; min-height: 90vh; justify-content: center;">
            <div class="center-card-glass">
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
        </div>
        <!-- <div class="glass-image-container mt-4">
        <div class="row">
            <div class="col index-col">
                <img src="img/uinales_alterno/<?php echo $img1; ?>.png" alt="imagen de <?php echo $img1; ?>" class="index-img" />
                <h4 class="text-white text-center mt-4 info"><?php echo $haab; ?></h4>
            </div>
            <div class="col index-col">
                <?php
                    echo "<img src='img/nahuales_alterno/$img2.png' alt='imagen de $img2' class='index-img' />";
                    echo "<h4 class='text-white text-center mt-4 info'>$cholquij</h4>";
                ?>
            </div>
            <div class="col index-col">
                <?php
                    echo "<img src='img/calendario2.png' alt='imagen de calendario' class='index-img' />";
                    echo "<h4 class='text-white text-center mt-4 info'>$cuenta_larga</h4>";
                ?>
            </div>
        </div>
    </div> -->

    </section>
    <?php include "blocks/bloquesJs1.html" ?>
    <script src="js/animation.js"></script>
    <script src="js/changeBackground.js"></script>
</body>

</html>