import 'package:flutter/material.dart';
import 'package:tugas_responsi/detail_obat_page.dart';

class StokPage extends StatefulWidget {
  const StokPage({super.key});

  @override
  State<StokPage> createState() => _StokPageState();
}

class _StokPageState extends State<StokPage> {
  List<Map<String, dynamic>>? listObat;

  @override
  void initState() {
    super.initState();
    listObat = [
      {
        'name': 'Obat Pilek',
        'harga': 'Rp. 54.000',
        'stok': 50,
        'expired': '09/08/2030 05:28 PM',
        'created': '09/08/2020 05:28 PM',
        'updated': '',
      },
      {
        'name': 'Obat Batuk',
        'harga': 'Rp. 15.000',
        'stok': 10,
        'expired': '09/08/2025 05:28 PM',
        'created': '09/04/2024 05:28 PM',
        'updated': '10/05/2024 10:28 PM',
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Stok Obat',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              'Jumlah Obat : ${listObat?.length ?? '0'}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listObat?.length ?? 0,
              itemBuilder: (context, index) {
                Map<String, dynamic> obat = listObat![index];
                return _itemObat(obat, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailObatPage(
                        name: obat['name'],
                        harga: obat['harga'],
                        stok: obat['stok'],
                        expired: obat['expired'],
                        created: obat['created'],
                        updated: obat['updated'],
                      ),
                    ),
                  );
                });
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 50,
              color: Colors.pinkAccent,
              child: const Center(
                child: Text(
                  'TAMBAH DATA OBAT',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _itemObat(Map<String, dynamic> obat, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    obat['name'],
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: const BoxDecoration(
                          color: Colors.pinkAccent,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.strikethrough_s_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Harga: ${obat['harga']}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Jumlah: ${obat['stok']} Tablet',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'Ex: ${obat['expired']}',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.blueAccent),
                    ),
                    child: const Text(
                      'Tambah Stok',
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
