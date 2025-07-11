<?php
//Rueda Calendarica.php
$conn = include $_SERVER['DOCUMENT_ROOT'] . '/conexion/conexion.php';
$nahuales = $conn->query("SELECT nombre FROM tiempomaya.nahual ORDER BY iddesk;");
$energias = $conn->query("SELECT nombre FROM tiempomaya.energia ORDER BY id;");
$kines = $conn->query("SELECT nombre FROM tiempomaya.kin ORDER BY iddesk;");
$uinales = $conn->query("SELECT nombre FROM tiempomaya.uinal ORDER BY iddesk;");

date_default_timezone_set('America/Guatemala');
$fecha_consultar = date("Y-m-d");

?>

<section id="rueda">
    <div class="container">
        <div class="section-header">
            <h3 class="section-title">Calendario Didactico</h3>
        </div>

        <form class="container">
            <div class="mb-1">
                <label for="fecha" class="form-label">Fecha</label>
                <input type="date" class="form-control" name="fecha" id="rueda-calendarica-picker" value="<?= $fecha_consultar ?? ''; ?>">
            </div>
        </form>

        <div class="container rueda-calendarica">
            <div id="cholq'ij">
                <div id="circle-nahual" class="circle">
                    <?php
                    foreach ($nahuales as $i => $nahual) {
                    ?>
                        <div style="--n: <?= $i ?>;">
                            <span></span>
                            <div>
                                <img src="/img/nahualCalendario/<?= $nahual['nombre']; ?>.png" alt="">
                                <span></span>
                            </div>
                        </div>
                    <?php
                    }
                    ?>
                </div>

                <div id="circle-energia" class="circle circle-num">
                    <?php
                    foreach ($energias as $i => $energia) {
                    ?>
                        <div style="--n: <?= $i ?>;">
                            <span></span>
                            <div>
                                <img class="img-black" src="/img/energiaCalendario/<?= $energia['nombre']; ?>.png" alt="">
                            </div>
                        </div>
                    <?php
                    }
                    ?>
                </div>
            </div>

            <div id="haab">
                <div id="circle-kin" class="circle circle-num">
                    <?php
                    foreach ($uinales as $i => $uinal) {
                        foreach ($kines as $j => $kin) {
                            if ($i == 18 && $j == 5) {
                                break;
                            }
                    ?>
                            <div style="--n: <?= $kines->num_rows * $i + $j ?>;">
                                <span></span>
                                <div>
                                    <img class="img-white" src="/img/kinCalendario/<?= $kin['nombre']; ?>_2.png" alt="">
                                </div>
                            </div>
                    <?php
                        }
                    }
                    ?>
                </div>

                <div id="circle-uinal" class="circle">
                    <?php
                    foreach ($uinales as $i => $uinal) {
                        foreach ($kines as $j => $kin) {
                            if ($i == 18 && $j == 5) {
                                break;
                            }
                    ?>
                            <div style="--n: <?= $kines->num_rows * $i + $j ?>;">
                                <div>
                                    <img class="img-white" src="/img/uinalCalendario/<?= $uinal['nombre']; ?>.png" alt="">
                                </div>
                            </div>
                    <?php
                        }
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>
</section>
