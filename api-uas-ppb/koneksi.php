<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "uas_pbb_bioskop";
$port = 3308;

// Membuat koneksi
$conn = new mysqli($servername, $username, $password, $dbname, $port);

// Memeriksa koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}
