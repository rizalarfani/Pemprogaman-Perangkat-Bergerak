<?php
// Memasukkan file koneksi database
include 'koneksi.php';

header('Content-Type: application/json; charset=utf-8');

$judul_film = $_POST['judul_film'];
$waktu_tayang = $_POST['waktu_tayang'];
$nama_pelanggan = $_POST['nama_pelanggan'];
$email_pelanggan = $_POST['email_pelanggan'];
$nomor_kursi = $_POST['nomor_kursi'];

if (isset($judul_film) && isset($waktu_tayang) && isset($nama_pelanggan) && isset($email_pelanggan) && isset($nomor_kursi)) {
    // Query untuk menyimpan data tiket
    $sql = "INSERT INTO tikets (judul_film, waktu_tayang, nama_pelanggan, email_pelanggan, nomor_kursi)
            VALUES ('$judul_film', '$waktu_tayang', '$nama_pelanggan', '$email_pelanggan', '$nomor_kursi')";
    if ($conn->query($sql) === TRUE) {
        $response = array("status" => "success", "message" => "Data tiket berhasil disimpan.");
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
