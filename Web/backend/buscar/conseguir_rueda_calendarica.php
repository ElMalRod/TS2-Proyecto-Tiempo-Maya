<?php
$conn = include $_SERVER['DOCUMENT_ROOT'] . "/conexion/conexion.php";

date_default_timezone_set('US/Central');
if (isset($_GET['fecha'])) {
    $fecha_consultar = $_GET['fecha'];
} else {
    $fecha_consultar = date("Y-m-d");
}

$cholquij = include $_SERVER['DOCUMENT_ROOT'] . '/backend/buscar/conseguir_cholquij.php';
$haab = include $_SERVER['DOCUMENT_ROOT'] . '/backend/buscar/conseguir_haab.php';
$cuenta_larga = include $_SERVER['DOCUMENT_ROOT'] . '/backend/buscar/conseguir_fecha_cuenta_larga.php';

echo json_encode(array(
    "cholquij" => array(
        "energia" => array(
            "numero" => intval($cholquij[0]),
            "nombre" => strval($cholquij[1])
        ),
        "nahual" => array(
            "numero" => intval($cholquij[2]),
            "nombre" => strval($cholquij[3])
        ),
    ),
    "haab" => array(
        "kin" => array(
            "numero" => intval($haab[0]),
            "nombre" => strval($haab[1])
        ),
        "uinal" => array(
            "numero" => intval($haab[2]),
            "nombre" => strval($haab[3])
        ),
    )
));
