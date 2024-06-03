<?php
// Memasukkan file koneksi database
include 'koneksi.php';

header('Content-Type: application/json; charset=utf-8');

$kode_barang = $_POST['kode_barang'];
$nama = $_POST['nama'];
$satuan = $_POST['satuan'];

// Mendapatkan data dari request POST
if (isset($kode_barang) && isset($nama) && isset($satuan)) {
    // Query untuk menyimpan data barang
    $sql = "INSERT INTO barang (kode_barang, nama_barang, satuan) VALUES ('$kode_barang', '$nama', '$satuan')";
    if ($conn->query($sql) === TRUE) {
        $response = array("status" => "success", "message" => "Data barang berhasil disimpan.");
    } else {
        $response = array("status" => "error", "message" => "Error: " . $sql . "<br>" . $conn->error);
    }
} else {
    $response = array("status" => "error", "message" => "Data tidak lengkap.");
}

// Mengembalikan response dalam format JSON
echo json_encode($response);

// Menutup koneksi
$conn->close();
