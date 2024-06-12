<?php

include 'koneksi.php';

$kode_barang = $_POST['kode_barang'];
$nama_barang = $_POST['nama_barang'];
$satuan = $_POST['satuan'];

$response = array();

if (empty($kode_barang)) {
    $response = array("status" => "error", "message" => "Kode Barang tidak boleh kosong!!");
} else if (empty($nama_barang) || empty($satuan)) {
    $response = array("status" => "error", "message" => "Semua field harus diisi!!");
} else {
    // Prepare an SQL statement for execution
    $sql = "UPDATE barang SET nama_barang='$nama_barang', satuan='$satuan' WHERE kode_barang='$kode_barang'";

    if ($conn->query($sql) === TRUE) {
        $response = array("status" => "success", "message" => "Data barang berhasil diperbarui.");
    } else {
        $response = array("status" => "error", "message" => "Error: " . $conn->error);
    }
}

// Mengembalikan response dalam format JSON
echo json_encode($response);
$conn->close();
