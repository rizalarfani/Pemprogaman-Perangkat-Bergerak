<?php
// Memasukkan file koneksi database
include 'koneksi.php';

// Query untuk mengambil data barang
$sql = "SELECT * FROM tikets";
$result = $conn->query($sql);

$barang = array();

if ($result->num_rows > 0) {
    // Mengambil setiap baris data
    while ($row = $result->fetch_assoc()) {
        $barang[] = $row;
    }
}

// Mengembalikan data dalam format JSON
echo json_encode($barang);

// Menutup koneksi
$conn->close();
