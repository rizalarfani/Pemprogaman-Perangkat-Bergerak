<?php

include 'koneksi.php';

$ticket_id = $_POST['ticket_id'];
$nama_pelanggan = $_POST['nama_pelanggan'];
$email_pelanggan = $_POST['email_pelanggan'];
$nomor_kursi = $_POST['nomor_kursi'];

$response = array();

if (empty($ticket_id)) {
    $response = array("status" => "error", "message" => "ID Tiket tidak boleh kosong!!");
} else if (empty($nama_pelanggan) || empty($email_pelanggan) || empty($nomor_kursi)) {
    $response = array("status" => "error", "message" => "Semua field harus diisi!!");
} else {
    // Prepare an SQL statement for execution
    $sql = "UPDATE tikets
            SET nama_pelanggan='$nama_pelanggan', email_pelanggan='$email_pelanggan', nomor_kursi='$nomor_kursi'
            WHERE id_tiket='$ticket_id'";

    if ($conn->query($sql) === TRUE) {
        $response = array("status" => "success", "message" => "Data tiket berhasil diperbarui.");
    } else {
        $response = array("status" => "error", "message" => "Error: " . $conn->error);
    }
}

// Mengembalikan response dalam format JSON
echo json_encode($response);
$conn->close();
