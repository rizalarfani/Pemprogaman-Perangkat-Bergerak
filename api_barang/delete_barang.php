<?php
// Memasukkan file koneksi database
include 'koneksi.php';

$kode_barang = $_POST['kode_barang'];


if (empty($kode_barang)) {
    $response = array("status" => "error", "message" => "Kode Barang tidak boleh kosong!!");
}

if (!empty($kode_barang)) {
    $sql = "DELETE FROM barang WHERE kode_barang='$kode_barang'";
    if ($conn->query($sql) === TRUE) {
        $response = array("status" => "success", "message" => "Data barang berhasil dihapus.");
    } else {
        $response = array("status" => "error", "message" => "Error: " . $sql . "<br>" . $conn->error);
    }
}

// Mengembalikan response dalam format JSON
echo json_encode($response);
$conn->close();
