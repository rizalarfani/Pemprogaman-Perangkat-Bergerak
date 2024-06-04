import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as client;
import 'package:listview_http/add_barang.dart';
import 'package:listview_http/barang_model.dart';
import 'package:listview_http/constant.dart';
import 'package:listview_http/success_model.dart';

class ListBarang extends StatefulWidget {
  const ListBarang({super.key});

  @override
  State<ListBarang> createState() => _ListBarangState();
}

class _ListBarangState extends State<ListBarang> {
  List<Barang>? getListBarang;
  bool isLoading = false;

  Future<List<Barang>> getDataBarang() async {
    final response = await client.get(Uri.parse(Constant.baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Barang.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<SuccessModel> deleteBarang(String kodeBarang) async {
    final response = await client
        .post(Uri.parse('${Constant.baseUrl}/delete_barang.php'), body: {
      'kode_barang': kodeBarang,
    });

    if (response.statusCode == 200) {
      return SuccessModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Delete Data');
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
                      trailing: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  'Delete Data',
                                ),
                                content: const Text(
                                  "Apakah anda yakin untuk menhapus data ini?",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      SuccessModel response =
                                          await deleteBarang(barang.kodeBarang);
                                      if (response.status == 'success') {
                                        Navigator.pop(context);
                                        getDataBarang().then((value) {
                                          setState(() {
                                            getListBarang = value;
                                          });
                                        });
                                        Fluttertoast.showToast(
                                          msg: response.message,
                                          backgroundColor: Colors.black,
                                        );
                                      }
                                      if (response.status != 'success') {
                                        Fluttertoast.showToast(
                                          msg: response.message,
                                          backgroundColor: Colors.redAccent,
                                        );
                                      }
                                    },
                                    child: const Text(
                                      'Confirm',
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
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
          final result = Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const AddBarang(),
            ),
          );
          result.then((value) {
            getDataBarang().then((value) {
              setState(() {
                getListBarang = value;
              });
            });
          });
        },
      ),
    );
  }
}
