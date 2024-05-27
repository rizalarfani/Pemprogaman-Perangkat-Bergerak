import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;
import 'package:listview_http/barang_model.dart';

class ListBarang extends StatefulWidget {
  const ListBarang({super.key});

  @override
  State<ListBarang> createState() => _ListBarangState();
}

class _ListBarangState extends State<ListBarang> {
  List<Barang>? getListBarang;
  bool isLoading = false;

  Future<List<Barang>> getDataBarang() async {
    final response =
        await client.get(Uri.parse('http://192.168.21.197/tugas-ppb/'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Barang.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    getDataBarang().then((value) {
      setState(() {
        getListBarang = value;
      });
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Mysql ListView',
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ),
            )
          : ListView.builder(
              itemCount: getListBarang?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                Barang barang = getListBarang![index];
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    child: ListTile(
                      title: Text(
                        barang.nama,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        barang.satuan,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
