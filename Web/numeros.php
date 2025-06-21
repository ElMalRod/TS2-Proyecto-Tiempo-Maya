<?php session_start(); ?>
<?php
    date_default_timezone_set('US/Central');
    $conn = include "conexion/conexion.php";
    include './helpers/functions.php';
    $urlFondo = obtenerRutaFondo($conn);
    $numerosMayas = ["0"];
    $numIngresado = 0;
    if (isset($_POST['calcularMaya'])) {
        $numerosMayas = [];
        $numIngresado = intval($_POST['numero']);
        $textoMaya = convertirANumeroMaya($numIngresado);
        $numerosObtenidos = explode("-", $textoMaya);
        $techo = 0;
        $conteo = 0;
        foreach ($numerosObtenidos as $num) {
            $conteo++;
            if ($num === "0") {
                if ($techo === 1 || $conteo === 5) {
                    $numerosMayas[] = $num;
                }
            } else {
                $numerosMayas[] = $num;
                $techo = 1;
            }
        }
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Tiempo Maya - Números Mayas</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <?php include "blocks/bloquesCss.html"; ?>
    <link rel="stylesheet" href="css/estilo.css?v=<?php echo rand(); ?>">
    <link rel="stylesheet" href="css/index.css?v=<?php echo rand(); ?>">
    <link rel="stylesheet" href="css/calculadora.css?v=<?php echo rand(); ?>">
    <link rel="stylesheet" href="css/animation.css?v=<?php echo rand(); ?>">
    <style>
        body {
            background: url('<?php echo $urlFondo; ?>') center center/cover no-repeat fixed;
        }
        section#inicio {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin-top: -56px;
        }
        section#inicio h1 {
            color:rgb(255, 255, 255);
            font-size: 3rem;
            margin-bottom: 1rem;
        }
        section#inicio .btn-get-started {
            color: #ffffff;
            border-color:rgb(255, 255, 255);
            background: transparent;
            margin: 0.5rem;
            transition: all 0.3s ease;
        }
        section#inicio .btn-get-started:hover {
            background: #3ad29f;
            color: #fff;
        }
        .bodyNumeros { padding: 60px 0; }
        #Informacion p { color: #000; }
        .containerNumeros { background: none; padding: 0; }
        #Calculadora h1, #Informacion h1 {
            color: #3ad29f;
            text-align: center;
            margin-bottom: 30px;
            font-weight: 300;
        }
        #formulario {
            max-width: 360px;
            margin: 0 auto 40px;
            background: #f2f2f2;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }
        #formulario h2 {
            color: #000;
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.5rem;
            font-weight: 500;
        }
        #formulario label { color: #333; font-weight: 500; }
        #formulario input.form-control {
            border: 1px solid #ccc;
            border-radius: 6px;
            padding: 10px;
            font-size: 1rem;
        }
        #formulario input.form-control:focus {
            border-color: #3ad29f;
            box-shadow: 0 0 0 0.2rem rgba(58,210,159,0.25);
        }
        #formulario button {
            width: 100%;
            background: #3ad29f;
            border-color: #3ad29f;
            color: #fff;
            padding: 12px;
            font-size: 1rem;
            border-radius: 6px;
            transition: background 0.3s ease;
        }
        #formulario button:hover {
            background: #2ab58f;
        }
        #torre { display: flex; flex-direction: column; align-items: center; }
        .nivel img { width: 80px; margin: 12px 0; }
    </style>
</head>
<body>
    <?php include "NavBar.php"; ?>
    <section id="inicio">
        <h1>Números Mayas</h1>
        <a href="#Informacion" class="btn-get-started">Información</a>
        <a href="#Calculadora" class="btn-get-started">Calculadora</a>
    </section>
    <div class="bodyNumeros" id="Informacion">
        <div class="container containerNumeros">
            <h1>Información de los números mayas</h1>
            <div class="row justify-content-center">
                <div class="col-md-8">
                    <p>Los mayas idearon y utilizaron durante el primer milenio de nuestra era un sistema de numeración posicional vigesimal de una gran eficacia y cuya representación solo requería de tres símbolos: el punto, la raya y el óvalo.</p>
                    <p>Empleaban un sistema de numeración vigesimal, que usaba de manera auxiliar otro de base 5. El punto redondo representaba el 1, la raya o barra el 5. El resto de los números entre el 1 y 19, se obtenían mediante sus combinaciones.</p>
                    <p>El sistema era posicional, se escribía vertical, de arriba hacia abajo, comenzando en el nivel superior, con las unidades en la parte inferior. En el uso no relacionado con la cuenta del tiempo todos los niveles son múltiplos de 20.</p>
                    <img src="./img/numeros-mayas.png" alt="Numeración maya" class="img-fluid mx-auto d-block my-4">
                    <p>Se necesitaba un signo o símbolo que indicase cuando en una posición no había ninguna cantidad, y por lo tanto su valor era cero. El símbolo generalmente utilizado era un óvalo horizontal, que representaba la caparazón de un caracol.</p>
                    <p>Algunos autores piensan que la presencia de un símbolo para el número cero, indica la aparición del concepto del número cero algunos siglos antes del establecimiento del sistema de numeración arábigo. Otros sostienen que a los mayas no les interesaba el concepto de la cantidad nula, y que el signo era un separador eficaz, que indicaba la ausencia de otro número.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="bodyNumeros" id="Calculadora">
        <div class="container containerNumeros">
            <h1>Convertidor Numeros a  Numeros en Maya</h1>
            <div id="formulario">
                <h2>Convertidor Maya</h2>
                <form action="" method="post">
                    <label for="numero">Ingresa el valor entero:</label>
                    <input type="number" id="numero" name="numero" min="0" value="<?php echo $numIngresado; ?>" required class="form-control mb-3">
                    <button type="submit" name="calcularMaya" class="btn btn-get-started">Calcular</button>
                </form>
            </div>
            <h2 class="text-center text-success">Número en Maya</h2>
            <div id="torre">
                <?php foreach ($numerosMayas as $num): ?>
                    <div class="nivel">
                        <img src="./img/numerosCalc/<?php echo $num; ?>.png" alt="Número Maya <?php echo $num; ?>">
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
    <?php include "blocks/bloquesJs1.html"; ?>
    <script src="js/animation.js"></script>
    <script src="js/changeBackground.js"></script>
</body>
</html>
