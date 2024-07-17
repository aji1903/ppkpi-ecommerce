<?php
$host_koneksi = "localhost:3307";
$usename_koneksi = "root";
$password_koneksi = "";
$database_koneksi = "db_ecommerce";

$koneksi = mysqli_connect(
    $host_koneksi,
    $usename_koneksi,
    $password_koneksi,
    $database_koneksi
);
if (!$koneksi) {
    die('koneksi eror : ' . mysqli_connect_error());
}
?>