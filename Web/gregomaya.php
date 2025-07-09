<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Conexión a la base de datos
$conn = include "conexion/conexion.php";

// Zona horaria (Guatemala / US Central)
date_default_timezone_set('US/Central');

// Determinar fecha de consulta
if (isset($_GET['fecha'])) {
    $fecha_consultar = $_GET['fecha'];
} else {
    $fecha_consultar = date("Y-m-d");
}

// Mes y año seleccionados (para el calendario)
if (isset($_GET['mes']) && isset($_GET['anio'])) {
    $mesSeleccionado  = (int) $_GET['mes'];
    $anioSeleccionado = (int) $_GET['anio'];
} else {
    $mesSeleccionado  = (int) date('n'); // Mes actual
    $anioSeleccionado = (int) date('Y'); // Año actual
}

// Nombres de mes en español (evita usar strftime)
$meses = [
    'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
    'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
];

// Obtener datos de Nahual, energía y Haab
$nahuals  = include 'backend/buscar/conseguir_nahual_nombre_mes.php';
$energias = include 'backend/buscar/conseguir_energia_numero_mes.php';
$haabs    = include 'backend/buscar/conseguir_uinal_nombre_mes.php';

// Construir array de días del mes
$diasMes = [];
$inicioMes = new DateTime("$anioSeleccionado-$mesSeleccionado-01");
$finMes    = (clone $inicioMes)->modify('last day of this month');

// Para incluir el último día, avanzamos el periodo hasta el día siguiente al fin de mes
$periodo = new DatePeriod($inicioMes, new DateInterval('P1D'), $finMes->modify('+1 day'));

foreach ($periodo as $fecha) {
    $dia      = (int) $fecha->format('d');
    $nahual   = $nahuals[$dia]   ?? '';
    $energia  = $energias[$dia]  ?? '';
    $haab     = $haabs[$dia]     ?? '';
    $diasMes[$dia] = [
        'nahual'   => $nahual,
        'energia'  => $energia,
        'cholquij' => $nahual . ' ' . $energia,
        'haab'     => $haab
    ];
}

?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <link rel="icon" href="img/piramide-maya.png">
    <title>Tiempo Maya - Calendario GregoMaya</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <?php include "blocks/bloquesCss.html"; ?>
    <link rel="stylesheet" href="css/estilo.css?v=<?= rand() ?>" />
    <link rel="stylesheet" href="css/calculadora.css?v=<?= rand() ?>" />
    <link rel="stylesheet" href="css/calendario.css?v=<?= rand() ?>" />
</head>

<body>
    <?php include "NavBar.php"; ?>

    <section id="inicio"
        style="background: url('<?php echo $urlFondo; ?>') center/cover no-repeat fixed; height:100vh;">
        <div id="inicioContainer" class="inicio-container">
            <div class="contenedor_formulario">
                <br><br><br><br><br><br><br>


                <!-- Título del calendario -->
                <h1>
                    Calendario – <?= $meses[$mesSeleccionado - 1] ?> <?= $anioSeleccionado ?>
                </h1>

                <!-- Selector de mes y año -->
                <div class="selector-fecha">
                    <form action="" method="get">
                        <select name="mes" onchange="this.form.submit()">
                            <?php for ($i = 1; $i <= 12; $i++): ?>
                            <option value="<?= $i ?>" <?= $i === $mesSeleccionado ? 'selected' : '' ?>>
                                <?= $meses[$i - 1] ?>
                            </option>
                            <?php endfor; ?>
                        </select>
                        <select name="anio" onchange="this.form.submit()">
                            <?php
                  $yearActual = date('Y');
                  for ($j = $yearActual - 5; $j <= $yearActual + 5; $j++):
                ?>
                            <option value="<?= $j ?>" <?= $j === $anioSeleccionado ? 'selected' : '' ?>>
                                <?= $j ?>
                            </option>
                            <?php endfor; ?>
                        </select>
                    </form>
                </div>

                <!-- Calendario vacío: se rellenará por JS -->
                <div class="contenedor_info">
                    <div class="calendar-container">
                        <table class="calendar">
                            <thead>
                                <tr>
                                    <th>Dom.</th>
                                    <th>Lun.</th>
                                    <th>Mar.</th>
                                    <th>Mie.</th>
                                    <th>Jue.</th>
                                    <th>Vie.</th>
                                    <th>Sab.</th>
                                </tr>
                            </thead>
                            <tbody>
                                <!-- JavaScript insertará los días aquí -->
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </section>

    <?php include "blocks/bloquesJs1.html"; ?>
    <script>
    // Pasamos los datos PHP a JavaScript
    const diasMes = <?= json_encode($diasMes, JSON_UNESCAPED_UNICODE) ?>;
    </script>
    <script src="js/calendario.js"></script>
    <script src="js/animation.js"></script>
    <script src="js/changeBackground.js"></script>
</body>

</html>