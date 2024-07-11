import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as client;
import 'package:uas/pages/edit_page.dart';
import 'package:uas/pages/simpan_page.dart';
import 'package:uas/utils/constant_util.dart';
import 'package:uas/widgets/item_widget.dart';

import '../utils/success_model.dart';
import '../utils/tiket_model.dart';

class MysqlPage extends StatefulWidget {
  const MysqlPage({super.key});

  @override
  State<MysqlPage> createState() => _MysqlPageState();
}

class _MysqlPageState extends State<MysqlPage> {
  List<Tiket>? getListTikets;
  bool isLoading = false;

  Future<List<Tiket>> getListTiket() async {
    final response = await client.get(Uri.parse(ConstantUtil.baseUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Tiket.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<SuccessModel> deleteData(String idTiket) async {
    final response = await client
        .post(Uri.parse('${ConstantUtil.baseUrl}/delete_tiket.php'), body: {
      'id_tiket': idTiket,
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
    getListTiket().then((value) {
      setState(() {
        getListTikets = value;
      });
    });
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mysql Database',
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.blueAccent,
              ),
            )
          : getListTikets != null
              ? ListView.builder(
                  itemCount: getListTikets?.length ?? 0,
                  itemBuilder: (context, index) {
                    Tiket tiket = getListTikets![index];
                    return ItemWidget(
                      namaFilm: tiket.judulFilm,
                      jamTayang: tiket.waktuTayang,
                      noKursi: tiket.nomorKursi,
                      namaPelanggan: tiket.namaPelanggan,
                      emailPelanggan: tiket.emailPelanggan,
                      tanggal: tiket.tanggalPembelian,
                      onEdit: () {
                        var navigate =
                            Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return EditPage(
                              tiket: tiket,
                              isFirebase: false,
                            );
                          },
                        ));
                        navigate.then(
                          (value) {
                            getListTiket().then((value) {
                              setState(() {
                                getListTikets = value;
                              });
                            });
                          },
                        );
                      },
                      onDelete: () {
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
                                        await deleteData(tiket.ticketId);
                                    if (response.status == 'success') {
                                      Navigator.pop(context);
                                      getListTiket().then((value) {
                                        setState(() {
                                          getListTikets = value;
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
                    );
                  },
                )
              : const Center(
                  child: Text('Data tidak Ditemukan'),
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
              builder: (BuildContext context) =>
                  const SimpanPage(isFirebase: false),
            ),
          );
          result.then((value) {
            getListTiket().then((value) {
              setState(() {
                getListTikets = value;
              });
            });
          });
        },
      ),
    );
  }
}
