import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as client;
import 'package:listview_http/success_model.dart';

class AddBarang extends StatefulWidget {
  const AddBarang({super.key});

  @override
  State<AddBarang> createState() => _AddBarangState();
}

class _AddBarangState extends State<AddBarang> {
  TextEditingController? namaBarang;
  TextEditingController? kodeBarang;
  TextEditingController? satuan;

  @override
  void initState() {
    super.initState();
    namaBarang = TextEditingController();
    kodeBarang = TextEditingController();
    satuan = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    namaBarang?.dispose();
    kodeBarang?.dispose();
    satuan?.dispose();
  }

  Future<SuccessModel> addBarang() async {
    Map<String, dynamic> body = {
      "kode_barang": kodeBarang?.text ?? '',
      "nama": namaBarang?.text ?? '',
      "satuan": satuan?.text ?? '',
    };

    final response = await client.post(
      Uri.parse('http://192.168.21.197/tugas-ppb/simpan_barang.php'),
      body: body,
    );

    if (response.statusCode == 200) {
      return SuccessModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Simpan Data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Input Data Barang',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Kode Barang",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: kodeBarang,
                decoration: InputDecoration(
                  hintText: "Kode Barang",
                  filled: true,
                  fillColor: Colors.grey[150],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Nama Barang",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: namaBarang,
                decoration: InputDecoration(
                  hintText: 'Nama Barang',
                  filled: true,
                  fillColor: Colors.grey[150],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                "Satuan Barang",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: satuan,
                decoration: InputDecoration(
                  hintText: 'Satuan Barang',
                  filled: true,
                  fillColor: Colors.grey[150],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  if (kodeBarang!.text.isEmpty &&
                      namaBarang!.text.isEmpty &&
                      satuan!.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: 'Harap isi semua field yang ada',
                        backgroundColor: Colors.redAccent);
                  }
                  if (kodeBarang!.text.isNotEmpty &&
                      namaBarang!.text.isNotEmpty &&
                      satuan!.text.isNotEmpty) {
                    SuccessModel response = await addBarang();
                    if (response.status == 'success') {
                      Fluttertoast.showToast(
                        msg: response.message,
                        backgroundColor: Colors.black,
                      );
                      Navigator.pop(context);
                    } else {
                      Fluttertoast.showToast(
                        msg: response.message,
                        backgroundColor: Colors.redAccent,
                      );
                    }
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      'Simpan Data',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
