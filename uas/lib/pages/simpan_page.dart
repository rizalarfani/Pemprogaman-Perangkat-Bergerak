import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:uas/utils/constant_util.dart';
import 'package:uas/widgets/button_widget.dart';
import 'package:http/http.dart' as client;

import '../utils/success_model.dart';

class SimpanPage extends StatefulWidget {
  final bool isFirebase;
  const SimpanPage({super.key, required this.isFirebase});

  @override
  State<SimpanPage> createState() => _SimpanPageState();
}

class _SimpanPageState extends State<SimpanPage> {
  DateFormat? time;
  String? selectedKursi;
  TextEditingController? namaFilm;
  TextEditingController? namaPelanggan;
  TextEditingController? emailPelanggan;
  String? selectedTime;

  @override
  void initState() {
    super.initState();
    time = DateFormat("HH:mm");
    namaFilm = TextEditingController();
    namaPelanggan = TextEditingController();
    emailPelanggan = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    namaFilm?.dispose();
    namaPelanggan?.dispose();
    emailPelanggan?.dispose();
  }

  Future<SuccessModel> addData() async {
    Map<String, dynamic> body = {
      "judul_film": namaFilm?.text ?? '',
      "waktu_tayang": selectedTime,
      "nama_pelanggan": namaPelanggan?.text ?? '',
      "email_pelanggan": emailPelanggan?.text,
      "nomor_kursi": selectedKursi,
    };

    final response = await client.post(
      Uri.parse('${ConstantUtil.baseUrl}simpan_tiket.php'),
      body: body,
    );
    if (response.statusCode == 200) {
      return SuccessModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Simpan Data');
    }
  }

  void addDataToFirebase() async {
    var collection = FirebaseFirestore.instance.collection('tikets');
    collection.add({
      'nama_film': namaFilm?.text,
      'jam_tayang': selectedTime,
      'no_kursi': selectedKursi,
      'nama_pelangan': namaPelanggan?.text,
      'email': emailPelanggan?.text,
      'tanggal': DateTime.now().toString(),
    }).then((value) {
      Fluttertoast.showToast(msg: "Berhasil Tambah Barang");
      Navigator.pop(context);
    }).catchError((onError) {
      Fluttertoast.showToast(
          msg: 'Gagal Tambah barang', backgroundColor: Colors.redAccent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Simpan Data',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Judul Film",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: namaFilm,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Judul Film",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 0.7),
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 0.7),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Jam Tayang",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              DateTimeField(
                format: time!,
                decoration: InputDecoration(
                  hintText: "Jam Tayang",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 0.7),
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 0.7),
                      width: 2.0,
                    ),
                  ),
                ),
                onShowPicker: (context, currentValue) async {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  selectedTime =
                      DateFormat.Hm().format(currentValue ?? DateTime.now());
                  return DateTimeField.convert(time);
                },
              ),
              const SizedBox(height: 10),
              const Text(
                "Nomor Kursi",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedKursi,
                hint: const Text('Pilih No. Kursi'),
                isExpanded: true,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 0.7),
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 0.7),
                      width: 2.0,
                    ),
                  ),
                ),
                items: List.generate(10, (index) {
                  return DropdownMenuItem<String>(
                    value: (index + 1).toString(),
                    child: Text('Kursi ${index + 1}'),
                  );
                }),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedKursi = newValue;
                  });
                },
              ),
              const SizedBox(height: 10),
              const Text(
                "Nama",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: namaPelanggan,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: "Nama",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 0.7),
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 0.7),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Email",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: emailPelanggan,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "email",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 0.7),
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(217, 217, 217, 0.7),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ButtonWidget(
                title: 'Simpan Data',
                onTap: () async {
                  if (namaFilm!.text.isEmpty &&
                      namaPelanggan!.text.isEmpty &&
                      emailPelanggan!.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: 'Harap isi semua field yang ada',
                        backgroundColor: Colors.redAccent);
                  }

                  if (namaFilm!.text.isNotEmpty &&
                      namaPelanggan!.text.isNotEmpty &&
                      emailPelanggan!.text.isNotEmpty) {
                    if (widget.isFirebase) {
                      addDataToFirebase();
                    } else {
                      SuccessModel response = await addData();
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
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
