<?php
// Memasukkan file koneksi database
include 'koneksi.php';

$id_tiket = $_POST['id_tiket'];

if (empty($id_tiket)) {
    $response = array("status" => "error", "message" => "ID Tiket tidak boleh kosong!!");
}

if (!empty($id_tiket)) {
    $sql = "DELETE FROM tikets WHERE id_tiket='$id_tiket'";
    if ($conn->query($sql) === TRUE) {
        $response = array("status" => "success", "message" => "Data Tikets berhasil dihapus.");
    } else {
        $response = array("status" => "error", "message" => "Error: " . $sql . "<br>" . $conn->error);
    }
}

// Mengembalikan response dalam format JSON
echo json_encode($response);
$conn->close();
