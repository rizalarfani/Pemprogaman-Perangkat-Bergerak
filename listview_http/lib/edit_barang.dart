import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:listview_http/barang_model.dart';
import 'package:listview_http/constant.dart';
import 'package:listview_http/success_model.dart';
import 'package:http/http.dart' as client;

class EditBarang extends StatefulWidget {
  final Barang barang;

  const EditBarang({super.key, required this.barang});

  @override
  State<EditBarang> createState() => _EditBarangState();
}

class _EditBarangState extends State<EditBarang> {
  TextEditingController? namaBarang = TextEditingController();
  TextEditingController? satuan = TextEditingController();

  @override
  void initState() {
    super.initState();
    namaBarang?.text = widget.barang.nama;
    satuan?.text = widget.barang.satuan;
  }

  @override
  void dispose() {
    super.dispose();
    namaBarang?.dispose();
    satuan?.dispose();
  }

  Future<SuccessModel> editBarang() async {
    Map<String, dynamic> body = {
      "kode_barang": widget.barang.kodeBarang,
      "nama_barang": namaBarang?.text ?? '',
      "satuan": satuan?.text ?? '',
    };

    final response = await client.post(
      Uri.parse('${Constant.baseUrl}edit_barang.php'),
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
        title: Text(
          widget.barang.nama,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  SuccessModel edit = await editBarang();
                  if (edit.status == 'success') {
                    Fluttertoast.showToast(
                      msg: edit.message,
                      backgroundColor: Colors.black,
                    );
                    Navigator.pop(context);
                  } else {
                    Fluttertoast.showToast(
                      msg: edit.message,
                      backgroundColor: Colors.redAccent,
                    );
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
                      'Edit Data',
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
