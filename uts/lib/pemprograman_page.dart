import 'package:flutter/material.dart';
import 'package:uts/detail_page.dart';

class PemprogramanPage extends StatefulWidget {
  const PemprogramanPage({super.key});

  @override
  State<PemprogramanPage> createState() => _PemprogramanPageState();
}

class _PemprogramanPageState extends State<PemprogramanPage> {
  List<Map<String, dynamic>>? getBahasas;

  @override
  void initState() {
    super.initState();
    getBahasas = [
      {
        "name": "Python",
        "deskripsi":
            "Python adalah bahasa pemrograman tingkat tinggi yang dioptimalkan untuk keterbacaan dan produktivitas.",
        "image": "assets/images/python.png"
      },
      {
        "name": "JavaScript",
        "deskripsi":
            "JavaScript adalah bahasa pemrograman tingkat tinggi yang sering digunakan untuk pengembangan web.",
        "image": "assets/images/javascript.png"
      },
      {
        "name": "Java",
        "deskripsi":
            "Java adalah bahasa pemrograman yang populer digunakan untuk pengembangan perangkat lunak.",
        "image": "assets/images/java.png"
      },
      {
        "name": "C++",
        "deskripsi":
            "C++ adalah bahasa pemrograman yang umum digunakan untuk pengembangan perangkat lunak dan game.",
        "image": "assets/images/c++.png"
      },
      {
        "name": "PHP",
        "deskripsi":
            "PHP adalah bahasa pemrograman sumber terbuka yang cocok untuk pengembangan web dan dapat disisipkan ke dalam HTML.",
        "image": "assets/images/php.png"
      },
      {
        "name": "Ruby",
        "deskripsi":
            "Ruby adalah bahasa pemrograman dinamis yang fokus pada kesederhanaan dan produktivitas pengembangan.",
        "image": "assets/images/ruby.png"
      },
      {
        "name": "MySQL",
        "deskripsi":
            "MySQL adalah sistem manajemen basis data relasional (RDBMS) yang populer digunakan untuk menyimpan dan mengelola data.",
        "image": "assets/images/mysql.png"
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Bahasa Pemprograman',
          style: TextStyle(
            color: Colors.black,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        itemCount: getBahasas?.length ?? 0,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    name: getBahasas![index]['name'],
                    deskripsi: getBahasas![index]['deskripsi'],
                    image: getBahasas![index]['image'],
                  ),
                ),
              );
            },
            child: listBahasa(getBahasas![index]),
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 2,
            thickness: 1.5,
          );
        },
      ),
    );
  }

  Widget listBahasa(Map<String, dynamic> bahasa) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      minVerticalPadding: 10,
      horizontalTitleGap: 25,
      leading: Image.asset(
        bahasa['image'],
        fit: BoxFit.contain,
        width: 80,
        height: 100,
      ),
      title: Text(
        bahasa['name'] ?? '',
        textAlign: TextAlign.start,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 21,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        bahasa['deskripsi'] ?? '',
        textAlign: TextAlign.start,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
