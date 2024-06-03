<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "tugas_ppb_inventori";
$port = 3308;

// Membuat koneksi
$conn = new mysqli($servername, $username, $password, $dbname, $port);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}
