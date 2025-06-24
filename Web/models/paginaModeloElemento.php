<?php
// mostrar errores
 error_reporting(E_ALL);
 ini_set('display_errors', 1);
use function PHPSTORM_META\type;

session_start(); ?>
<?php
// Obtener el idioma seleccionado de la URL o usar el predeterminado (es)
$idioma = isset($_GET['idioma']) ? $_GET['idioma'] : (isset($_SESSION['idioma']) ? $_SESSION['idioma'] : 'es');
$_SESSION['idioma'] = $idioma;

// include('../backend/buscar/get_src.php');
$conn = include '../conexion/conexion.php';

$tabla = $_GET['elemento'] ?? null;
if (!$tabla) {
    // Si llegó sin elemento, redirige o muestra 404
    header('Location: /models/paginaModelo.php');
    exit;
}
$table = strtolower($tabla);


// Determinar la columna de contenido según el idioma
$columnaContenido = 'htmlCodigo';
if ($idioma == 'en') {
    $columnaContenido = 'htmlCodigo_en';
} elseif ($idioma == 'qu') {
    $columnaContenido = 'htmlCodigo_qu';
}elseif ($idioma == 'kq') {
    $columnaContenido = 'htmlCodigo_kq';
} elseif ($idioma == 'yu') {
    $columnaContenido = 'htmlCodigo_yu';
}

// Determinar la columna de información según el idioma
$columnaInfo = 'htmlCodigo';
if ($idioma == 'en') {
    $columnaInfo = 'htmlCodigo_en';
} elseif ($idioma == 'qu') {
    $columnaInfo = 'htmlCodigo_qu';
} elseif ($idioma == 'kq') {
    $columnaInfo = 'htmlCodigo_kq';
} elseif ($idioma == 'yu') {
    $columnaInfo = 'htmlCodigo_yu';
}


$fmt = "png";
$datos = $conn->query("SELECT nombre, significado, $columnaContenido as contenido FROM tiempomaya.$table;");
$elementos = $datos;
$informacion = $conn->query("SELECT $columnaInfo as info FROM tiempomaya.pagina WHERE nombre='" . $tabla . "';");


function getAudioSrc($nombre, $tabla) {
    $nombre = strtolower($nombre);
	$nombre = str_replace(['.', "'", '´'], '', $nombre);
	$audioPath = "../audio/$tabla/$nombre.m4a";
    return $audioPath;
}

$hour = date('H');
$fondo = '/img/FondoDia.jpg';
if ($hour >= 6 && $hour < 12) 
{
    $fondo = '/img/FondoDia.jpg';
} 
elseif ($hour >= 12 && $hour < 18) 
{
    $fondo = '/img/FondoDia.jpg';
} 
else 
{
    $fondo = '/img/FondoNoche.jpg';
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <link rel="icon" href="../img/piramide-maya.png">
    <title>Tiempo Maya - <?php echo $tabla; ?></title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <?php include "../blocks/bloquesCss.html" ?>
    <link rel="stylesheet" href="../css/estilo.css?v=<?php echo (rand()); ?>" />
    <link rel="stylesheet" href="../css/estiloAdmin.css?v=<?php echo (rand()); ?>" />
    <link rel="stylesheet" href="../css/paginaModelo.css?v=<?php echo (rand()); ?>" />
    <link rel="stylesheet" href="../css/animation.css" />
    <!-- Añadir Font Awesome para usar iconos -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<?php include "../NavBar.php" ?>

<body>
    <section id="inicio" style="background: url(<?php echo $fondo; ?>) top center;">
        <div id="inicioContainer" class="inicio-container">
            <?php echo "<h1>" . $tabla . " </h1>"; ?>
            <a href='#informacion' class='btn-get-started'>Informacion</a>
            <a href='#elementos' class='btn-get-started'>Elementos</a>
        </div>
    </section>
    <section id="information">
        <div class="container">
            <div class="row about-container">
                <div class="section-header">
                    <h3 class="section-title">INFORMACION</h3>
                </div>
                <?php foreach ($informacion as $info) {
    echo $info['info'];
} ?>

            </div>
        </div>
    </section>
    <hr>

    <section id="elementos">
        <div class="container"
            style="background:#fff; border-radius:16px; padding:24px; box-shadow: 0 2px 8px rgba(0,0,0,0.03);">
            <div class="section-header">
                <h3 class="section-title">ELEMENTOS</h3>
            </div>
            <?php foreach ($datos as $dato) {
            $id = getId($dato["nombre"]);
            $src = getImgSrc($id, "../img/$table", $fmt);
            $audioSrc = getAudioSrc($dato["nombre"], $table);
        ?>
            <div class="elemento-ficha">
                <div class="elemento-imgbox">
                    <img src='<?php echo $src; ?>' alt='<?php echo $dato['nombre']; ?>' class='img-elemento'>
                </div>
                <div class="elemento-texto">
                    <div class="elemento-header">
                        <h2 class="elemento-nombre" id="<?php echo slugify($dato['nombre']); ?>">
                            <?php echo $dato['nombre']; ?></h2>

                        <button class="play-btn" onclick="togglePlayPause(this, '<?php echo $audioSrc; ?>');"
                            title="Escuchar audio">
                            <i class="fas fa-play"></i>
                        </button>
                    </div>
                    <h4 class="elemento-significado-titulo">Significado</h4>
                    <div class="elemento-significado"><?php echo $dato['significado']; ?></div>
                    <div class="elemento-descripcion"><?php echo $dato['contenido']; ?></div>
                </div>
            </div>
            <hr>
            <?php } ?>
        </div>
    </section>




    <?php include "../blocks/bloquesJs.html" ?>
    <script src="../js/animation.js"></script>
    <script src="../js/changeBackground.js"></script>

    <script>
    function playAudio(audioSrc) {
        var audio = new Audio(audioSrc);
        audio.play();
    }

    window.onload = function() {
        highlightCard();
    };


    function highlightCard() {
        const hash = window.location.hash.substring(1);

        const highlighted = document.querySelector('.highlighted');
        if (highlighted) {
            highlighted.classList.remove('highlighted');
        }


        const card = document.getElementById('card-' + hash);
        if (card) {
            card.classList.add('highlighted');
            card.scrollIntoView({
                behavior: 'smooth',
                block: 'center'
            });
        }
    }

    window.addEventListener('hashchange', highlightCard);

    function togglePlayPause(button, src) {
        const icon = button.children[0];
        if (!button.dataset.playing || button.dataset.playing === "false") {
            // Si el audio no está reproduciéndose, reproduce
            if (!button.audio) {
                button.audio = new Audio(src);
                button.audio.addEventListener('ended', () => {
                    icon.classList.remove('fa-pause');
                    icon.classList.add('fa-play');
                    button.dataset.playing = "false";
                });
            }
            button.audio.play();
            icon.classList.remove('fa-play');
            icon.classList.add('fa-pause');
            button.dataset.playing = "true";
        } else {
            // Si el audio está reproduciéndose, pausa
            button.audio.pause();
            icon.classList.remove('fa-pause');
            icon.classList.add('fa-play');
            button.dataset.playing = "false";
        }
    }
    </script>

</body>

</html>