class Barang {
  final String kodeBarang;
  final String nama;
  final String satuan;

  Barang({
    required this.kodeBarang,
    required this.nama,
    required this.satuan,
  });

  factory Barang.fromJson(Map<String, dynamic> json) {
    return Barang(
      kodeBarang: json['kode_barang'],
      nama: json['nama_barang'],
      satuan: json['satuan'],
    );
  }
}
