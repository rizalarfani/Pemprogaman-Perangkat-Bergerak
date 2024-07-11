import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uas/utils/tiket_model.dart';
import 'package:uas/widgets/button_widget.dart';
import 'package:http/http.dart' as client;

import '../utils/constant_util.dart';
import '../utils/success_model.dart';

class EditPage extends StatefulWidget {
  final Tiket tiket;
  final bool isFirebase;
  const EditPage({super.key, required this.tiket, required this.isFirebase});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController? namaPelanggan = TextEditingController();
  TextEditingController? emailPelanggan = TextEditingController();
  String? selectedKursi;

  @override
  void initState() {
    super.initState();
    namaPelanggan?.text = widget.tiket.namaPelanggan;
    emailPelanggan?.text = widget.tiket.emailPelanggan;
    selectedKursi = widget.tiket.nomorKursi;
  }

  @override
  void dispose() {
    super.dispose();
    namaPelanggan?.dispose();
    emailPelanggan?.dispose();
  }

  Future<SuccessModel> updateData() async {
    Map<String, dynamic> body = {
      "ticket_id": widget.tiket.ticketId,
      "nama_pelanggan": namaPelanggan?.text ?? '',
      "email_pelanggan": emailPelanggan?.text,
      "nomor_kursi": selectedKursi,
    };

    final response = await client.post(
      Uri.parse('${ConstantUtil.baseUrl}edit_tiket.php'),
      body: body,
    );
    if (response.statusCode == 200) {
      return SuccessModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Update Data');
    }
  }

  void updateDataToFirebase(String docId) async {
    var collection = FirebaseFirestore.instance.collection('tikets');
    collection.doc(docId).update({
      'no_kursi': selectedKursi,
      'nama_pelangan': namaPelanggan?.text,
      'email': emailPelanggan?.text,
      'tanggal': DateTime.now().toString(),
    }).then((value) {
      Fluttertoast.showToast(
        msg: "Berhasil edit data ke firebase",
        backgroundColor: Colors.black,
      );
      Navigator.pop(context);
    }).catchError((error) {
      Fluttertoast.showToast(
        msg: 'Gagal edit data ke firebase',
        backgroundColor: Colors.redAccent,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Data',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                title: 'Update Data',
                onTap: () async {
                  if (widget.isFirebase) {
                    updateDataToFirebase(widget.tiket.ticketId);
                  } else {
                    SuccessModel edit = await updateData();
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
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
