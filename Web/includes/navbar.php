<?php
  include __DIR__ . '/../backend/buscar/get_src.php';
  $conn = include __DIR__ . '/../conexion/conexion.php';
  if (!$conn) die('Error: no se pudo conectar a la base de datos.');
  $kinesNav    = $conn->query("SELECT nombre FROM tiempomaya.kin    ORDER BY nombre;");
  $uinalesNav  = $conn->query("SELECT nombre FROM tiempomaya.uinal  ORDER BY nombre;");
  $nahualesNav = $conn->query("SELECT nombre FROM tiempomaya.nahual ORDER BY nombre;");
  $energiasNav = $conn->query("SELECT nombre FROM tiempomaya.energia ORDER BY id;");
  $periodosNav = $conn->query("SELECT nombre FROM tiempomaya.periodo ORDER BY orden;");
// Obtenemos el idioma seleccionado de la URL o usar el predeterminado (es)
$idioma = isset($_GET['idioma']) ? $_GET['idioma'] : (isset($_SESSION['idioma']) ? $_SESSION['idioma'] : 'es');
$_SESSION['idioma'] = $idioma;

  $idioma = isset($_GET['idioma']) ? $_GET['idioma'] : 'es';
  include __DIR__ . '/../mensaje.php';
  function slugify($name) {
    $clean = str_replace(["'", "’"], '', $name);
    return strtolower($clean);
  }

  

?>

<?php
/**
 * Devuelve la URL actual (path+query+hash) con el parámetro idioma cambiado.
 */
function langUrl(string $lang): string {
    // Obtiene la URL actual completa
    $fullUrl = $_SERVER['REQUEST_URI'];

    // Separa path, query y fragment
    $parts = parse_url($fullUrl);
    $path = $parts['path'] ?? '';
    parse_str($parts['query'] ?? '', $queryParams);

    // Cambia/añade el idioma
    $queryParams['idioma'] = $lang;
    $newQuery = http_build_query($queryParams);

    // Reconstruye fragment si existe
    $fragment = isset($parts['fragment']) ? '#'.$parts['fragment'] : '';

    return $path . '?' . $newQuery . $fragment;
}
?>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/navbar.css">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<header id="header" class="navbar-custom">
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="navbar-flex-container">
            <a class="navbar-brand brand-fixed" href="/index.php">
            <img src="/img/LogoTM2.png" alt="Logo Tiempo Maya" style="height: 40px;">
            </a>
            <div class="menu-center-wrapper">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navBarMenu"
                    aria-controls="navBarMenu" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navBarMenu">
                    <ul class="navbar-nav" id="menuScrollEffect">

                        <!-- Calendario Haab -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="haabDropdown" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                Calendario Haab
                            </a>
                            <div class="dropdown-menu p-2" aria-labelledby="haabDropdown">
                                <!-- Kin -->
                                <div class="dropdown-submenu">
                                    <a class="dropdown-item dropdown-toggle" href="#">Kin</a>
                                    <div class="dropdown-menu scrollable-dropdown">
                                        <?php foreach ($kinesNav as $kin):
                      $slug = slugify($kin['nombre']);
                    ?>
                                        <a class="dropdown-item d-flex align-items-center"
                                            href="/models/paginaModeloElemento.php?elemento=kin#<?= $slug ?>">
                                            <img src="/img/kin/<?= $slug ?>.png"
                                                alt="<?= htmlspecialchars($kin['nombre'], ENT_QUOTES) ?>"
                                                class="dropdown-icon">
                                            <?= htmlspecialchars($kin['nombre']) ?>
                                        </a>
                                        <?php endforeach; ?>
                                    </div>
                                </div>
                                <div class="dropdown-divider"></div>
                                <!-- Uinales -->
                                <div class="dropdown-submenu">
                                    <a class="dropdown-item dropdown-toggle" href="#">Uinales</a>
                                    <div class="dropdown-menu scrollable-dropdown">
                                        <?php foreach ($uinalesNav as $uinal):
                      $slug = slugify($uinal['nombre']);
                    ?>
                                        <a class="dropdown-item d-flex align-items-center"
                                            href="/models/paginaModeloElemento.php?elemento=uinal#<?= $slug ?>">
                                            <img src="/img/uinal/<?= $slug ?>.png"
                                                alt="<?= htmlspecialchars($uinal['nombre'], ENT_QUOTES) ?>"
                                                class="dropdown-icon">
                                            <?= htmlspecialchars($uinal['nombre']) ?>
                                        </a>
                                        <?php endforeach; ?>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <!-- Calendario Cholq'ij -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="cholqijDropdown" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                Calendario Cholq'ij
                            </a>
                            <div class="dropdown-menu p-2" aria-labelledby="cholqijDropdown">
                                <!-- Nahuales -->
                                <div class="dropdown-submenu">
                                    <a class="dropdown-item dropdown-toggle" href="#">Nahuales</a>
                                    <div class="dropdown-menu scrollable-dropdown">
                                        <?php foreach ($nahualesNav as $nahual):
                      $slug = slugify($nahual['nombre']);
                    ?>
                                        <a class="dropdown-item d-flex align-items-center"
                                            href="/models/paginaModeloElemento.php?elemento=nahual#<?= $slug ?>">
                                            <img src="/img/nahual/<?= $slug ?>.png"
                                                alt="<?= htmlspecialchars($nahual['nombre'], ENT_QUOTES) ?>"
                                                class="dropdown-icon">
                                            <?= htmlspecialchars($nahual['nombre']) ?>
                                        </a>
                                        <?php endforeach; ?>
                                    </div>
                                </div>
                                <div class="dropdown-divider"></div>
                                <!-- Energías -->
                                <div class="dropdown-submenu">
                                    <a class="dropdown-item dropdown-toggle" href="#">Energías</a>
                                    <div class="dropdown-menu scrollable-dropdown">
                                        <?php foreach ($energiasNav as $energia):
                      $slug = slugify($energia['nombre']);
                    ?>
                                        <a class="dropdown-item d-flex align-items-center"
                                            href="/models/paginaModeloElemento.php?elemento=energia#<?= $slug ?>">
                                            <img src="/img/energia/<?= $slug ?>.png"
                                                alt="<?= htmlspecialchars($energia['nombre'], ENT_QUOTES) ?>"
                                                class="dropdown-icon">
                                            <?= htmlspecialchars($energia['nombre']) ?>
                                        </a>
                                        <?php endforeach; ?>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <!-- Rueda Calendarica -->
                        <li class="nav-item">
                            <a class="nav-link" href="/models/paginaModelo.php?pagina=Rueda%20Calendarica">
                                Rueda Calendarica
                            </a>
                        </li>
                        <!-- Calculadoras -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="calcDropdown" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                Calculadoras
                            </a>
                            <div class="dropdown-menu" aria-labelledby="calcDropdown">
                                <a class="dropdown-item" href="/calculadora.php">Calculadora</a>
                                <a class="dropdown-item" href="/numeros.php">Números Mayas</a>
                                <a class="dropdown-item" href="/calculadora-cuenta-larga.php">Cuenta Larga</a>
                            </div>
                        </li>
                        <!-- Sabiduría Maya -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="sabDropdown" data-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                Sabiduría Maya
                            </a>
                            <div class="dropdown-menu" aria-labelledby="sabDropdown">
                                <a class="dropdown-item" href="/infografia-dia.php">Infografía</a>
                                <a class="dropdown-item" href="/cruz-maya.php">Cruz Maya</a>
                            </div>
                        </li>
                        <!-- Calendario gregoriano-Maya -->
                        <li class="nav-item">
                            <a class="nav-link" href="/gregomaya.php">
                                Calendario Gregoriano Maya
                            </a>
                        </li>
                        <!-- iDIOMA -->
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="languageDropdown" …>
                                <?= strtoupper($idioma) ?>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="languageDropdown">
                                <a class="dropdown-item" href="<?= htmlspecialchars(langUrl('es')) ?>">Español</a>
                                <a class="dropdown-item" href="<?= htmlspecialchars(langUrl('en')) ?>">Inglés</a>
                                <a class="dropdown-item" href="<?= htmlspecialchars(langUrl('qu')) ?>">Quiché</a>
                                <a class="dropdown-item" href="<?= htmlspecialchars(langUrl('kq')) ?>">Kaqchikel</a>
                                <a class="dropdown-item" href="<?= htmlspecialchars(langUrl('yu')) ?>">Yucateco</a>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </nav>
</header>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<script>
(function() {
    // --- Scroll efecto ---
    const header = document.getElementById('header');
    window.addEventListener('scroll', () => {
        header.classList.toggle('scrolled', window.scrollY > 80);
    });

    // --- Centrado del menú principal ---
    const menu      = document.getElementById('menuScrollEffect');
    const SCROLL_MAX = 220;
    const MAX_VW = 19;
    function updateMenuJustify() {
        if (!menu) return;
        if (window.innerWidth < 992) {
            menu.classList.remove('menu-centered');
            menu.style.marginRight = '';
            menu.style.paddingRight = '';
            menu.style.paddingLeft = '';
            return;
        }
        const y = Math.min(window.scrollY, SCROLL_MAX);
        const pct = y / SCROLL_MAX;
        if (y < SCROLL_MAX) {
            menu.classList.remove('menu-centered');
            menu.style.marginRight   = `${pct * MAX_VW}vw`;
            menu.style.paddingRight  = `${2 * (1 - pct)}rem`;
            menu.style.paddingLeft   = '';
        } else {
            menu.classList.add('menu-centered');
            menu.style.marginRight   = '';
            menu.style.paddingRight  = '';
            menu.style.paddingLeft   = '';
        }
    }
    window.addEventListener('scroll',  updateMenuJustify);
    window.addEventListener('resize',  updateMenuJustify);
    document.addEventListener('DOMContentLoaded', updateMenuJustify);

    // --- Responsive menú ---
    const DESKTOP = 992;

    // Menú principal (nivel 1)
    document.querySelectorAll('.nav-item.dropdown > .nav-link.dropdown-toggle').forEach(function(btn) {
        btn.addEventListener('click', function(e) {
            if (window.innerWidth < DESKTOP) {
                e.preventDefault();
                const parent = btn.parentElement;
                parent.classList.toggle('show');
                let menu = parent.querySelector('.dropdown-menu');
                if(menu) menu.classList.toggle('show');
            }
        });
    });

    // Sub-submenús (responsive, móvil/tablet, ABRE A LA PRIMERA)
    document.querySelectorAll('.dropdown-submenu > .dropdown-item.dropdown-toggle').forEach(function(btn) {
        btn.addEventListener('click', function(e) {
            if(window.innerWidth < DESKTOP) {
                e.preventDefault();
                e.stopPropagation();
                const ownBox = btn.parentElement;
                const subMenu = btn.nextElementSibling;
                // --- Opción UX: cerrar otros submenús abiertos en este nivel ---
                ownBox.parentElement.querySelectorAll('.dropdown-submenu.show').forEach(function(opened){
                    if(opened !== ownBox){
                        opened.classList.remove('show');
                        let openedMenu = opened.querySelector('.dropdown-menu');
                        if(openedMenu) openedMenu.classList.remove('show');
                    }
                });
                // --- Abre/cierra el sub-submenú ---
                ownBox.classList.toggle('show');
                if(subMenu) subMenu.classList.toggle('show');
            }
        });
    });

    // Hover solo en escritorio
    document.querySelectorAll('.navbar-custom .dropdown').forEach(function(drop) {
        drop.addEventListener('mouseenter', function() {
            if (window.innerWidth >= DESKTOP) {
                drop.classList.add('show');
                let menu = drop.querySelector('.dropdown-menu');
                if(menu) menu.classList.add('show');
            }
        });
        drop.addEventListener('mouseleave', function() {
            if (window.innerWidth >= DESKTOP) {
                drop.classList.remove('show');
                let menu = drop.querySelector('.dropdown-menu');
                if(menu) menu.classList.remove('show');
            }
        });
    });
    document.querySelectorAll('.dropdown-submenu').forEach(function(item) {
        item.addEventListener('mouseenter', function() {
            if (window.innerWidth >= DESKTOP) {
                item.classList.add('show');
                let sub = item.querySelector('.dropdown-menu');
                if(sub) sub.classList.add('show');
            }
        });
        item.addEventListener('mouseleave', function() {
            if (window.innerWidth >= DESKTOP) {
                item.classList.remove('show');
                let sub = item.querySelector('.dropdown-menu');
                if(sub) sub.classList.remove('show');
            }
        });
    });
})();
</script>
