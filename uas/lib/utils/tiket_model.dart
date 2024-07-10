class Tiket {
  final String ticketId;
  final String judulFilm;
  final String waktuTayang;
  final String namaPelanggan;
  final String emailPelanggan;
  final String nomorKursi;
  final String tanggalPembelian;

  Tiket({
    required this.ticketId,
    required this.judulFilm,
    required this.waktuTayang,
    required this.namaPelanggan,
    required this.emailPelanggan,
    required this.nomorKursi,
    required this.tanggalPembelian,
  });

  factory Tiket.fromJson(Map<String, dynamic> json) {
    return Tiket(
      ticketId: json['id_tiket'],
      judulFilm: json['judul_film'],
      waktuTayang: json['waktu_tayang'],
      namaPelanggan: json['nama_pelanggan'],
      emailPelanggan: json['email_pelanggan'],
      nomorKursi: json['nomor_kursi'],
      tanggalPembelian: json['tanggal_pembelian'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ticket_id': ticketId,
      'judul_film': judulFilm,
      'waktu_tayang': waktuTayang,
      'nama_pelanggan': namaPelanggan,
      'email_pelanggan': emailPelanggan,
      'nomor_kursi': nomorKursi,
    };
  }
}
