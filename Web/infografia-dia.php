<?php
if (session_status() !== PHP_SESSION_ACTIVE) session_start();
date_default_timezone_set('US/Central');

$conn = include 'conexion/conexion.php';
require_once './helpers/functions.php';
$urlFondo = obtenerRutaFondo($conn);

// Datos Infografía del día
$fecha_consultar = $_GET['fecha'] ?? date('Y-m-d');
$nahual  = include 'backend/buscar/conseguir_nahual_nombre.php';
$energia = include 'backend/buscar/conseguir_energia_numero.php';

// Datos energía
$result_e = $conn
    ->query("SELECT nombre, significado FROM tiempomaya.energia WHERE id = $energia");
$row_e    = $result_e->fetch_assoc();
$nombre_energia      = $row_e['nombre'];
$significado_energia = $row_e['significado'];

// Datos nahual
$result_n = $conn
    ->query("SELECT significado FROM tiempomaya.nahual WHERE nombre = '"
        . $conn->real_escape_string($nahual) . "'");
$row_n    = $result_n->fetch_assoc();
$significado_nahual = $row_n['significado'];
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
  <link rel="stylesheet" href="css/estiloAdmin.css?v=<?php echo rand(); ?>" />
  <link rel="stylesheet" href="css/animation.css" />
  <link rel="stylesheet" href="css/calculadora.css?v=<?php echo rand(); ?>" />
  <link rel="stylesheet" href="css/index.css?v=<?php echo rand(); ?>" />
  <link rel="stylesheet" href="css/infografia-del-dia.css?v=<?php echo rand(); ?>" />

  <script src="js/generar_infografia.js" defer></script>
</head>
<body>
  <?php include "NavBar.php"; ?>

  <section 
    id="inicio" 
    style="
      background-image: url('<?php echo $urlFondo; ?>');
      background-position: center;
      background-size: cover;
      background-repeat: no-repeat;
      height: 100vh;
    ">
    <div id="inicioContainer">
      <div id="formulario-infografia">
        <h1>Infografía del día</h1>
        <form method="get">
          <div class="form-cuenta-row">
            <div class="form-cuenta-group">
              <label for="fecha">Fecha a buscar</label>
              <input 
                type="date" 
                id="fecha" 
                name="fecha" 
                value="<?php echo $fecha_consultar; ?>">
            </div>
            <div class="form-cuenta-group button-group">
              <button type="submit" id="btnGenerarInfografia">
                <i class="far fa-clock"></i> Generar
              </button>
            </div>
          </div>
        </form>
        <canvas id="canvas"></canvas>
      </div>
    </div>
  </section>

  <script>
    // Ejecuta infografía al cargar y al pulsar Generar
    function run() {
      generarInfografia(
        '<?php echo $nombre_energia; ?>',
        '<?php echo $significado_energia; ?>',
        '<?php echo $nahual; ?>',
        '<?php echo $significado_nahual; ?>'
      );
    }
    document.addEventListener('DOMContentLoaded', run);
    document.getElementById('btnGenerarInfografia')
      .addEventListener('click', function(e){
        e.preventDefault();
        run();
      });
  </script>

  <?php include "blocks/bloquesJs1.html"; ?>
  <script src="js/animation.js"></script>
  <script src="js/changeBackground.js"></script>
</body>
</html>
