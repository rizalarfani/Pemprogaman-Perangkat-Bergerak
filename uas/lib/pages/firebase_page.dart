import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uas/pages/edit_page.dart';
import 'package:uas/pages/simpan_page.dart';
import 'package:uas/utils/tiket_model.dart';
import 'package:uas/widgets/item_widget.dart';

class FirebasePage extends StatefulWidget {
  const FirebasePage({super.key});

  @override
  State<FirebasePage> createState() => _FirebasePageState();
}

class _FirebasePageState extends State<FirebasePage> {
  Stream<QuerySnapshot>? tikets =
      FirebaseFirestore.instance.collection('tikets').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Firebase Database',
        ),
      ),
      body: StreamBuilder(
        stream: tikets,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text("Error"),
            );
          }

          if (snapshot.hasData == false) {
            return const Center(
              child: Text("Data tidak ditemuakn"),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text("Data tidak ditemuakn"),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data()! as Map<String, dynamic>;
              return ItemWidget(
                namaFilm: data['nama_film'],
                jamTayang: data['jam_tayang'],
                noKursi: data['no_kursi'],
                namaPelanggan: data['nama_pelangan'],
                emailPelanggan: data['email'],
                tanggal: data['tanggal'],
                onDelete: () {
                  document.reference.delete();
                  Fluttertoast.showToast(
                    msg: 'Berhasil hapus data',
                    backgroundColor: Colors.black,
                  );
                },
                onEdit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditPage(
                        tiket: Tiket(
                          ticketId: document.reference.id,
                          judulFilm: data['nama_film'],
                          waktuTayang: data['jam_tayang'],
                          namaPelanggan: data['nama_pelangan'],
                          emailPelanggan: data['email'],
                          nomorKursi: data['no_kursi'],
                          tanggalPembelian: data['tanggal'],
                        ),
                        isFirebase: true,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const SimpanPage(
                isFirebase: true,
              ),
            ),
          );
        },
      ),
    );
  }
}
