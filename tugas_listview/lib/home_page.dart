import 'package:flutter/material.dart';
import 'package:tugas_listview/detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> listPahlawan = [
      {
        'name': "Achmad Soebardjo",
        'keterangan':
            "Terjadinya proklamasi Indonesia juga tidak terlepas dari peran Achmad Soebardjo. Ia merupakan pahlawan nasional yang berasal dari Karawang, Jawa Barat. Ia merupakan bagian dari kaum tua yang membujuk Soekarno untuk segera memproklamasikan kemerdekaan Indonesia. Achmad Soebardjo sempat aktif sebagai anggota Badan Penyelidik Usaha Persiapan Kemerdekaan Indonesia (BPUPKI) dan juga Panitia Persiapan Kemerdekaan Indonesia (PPKI). Ia juga menjadi Menteri Luar Negeri Indonesia yang pertama",
        'photo':
            "https://images.tokopedia.net/img/JFrBQq/2022/7/22/a8607bf6-cab6-46ab-bb26-f7541d3490f7.jpg",
      },
      {
        'name': "Soepomo",
        'keterangan':
            "Pahlawan nasional Indonesia yang tidak kalah penting adalah Soepomo. Ia merupakan pahlawan nasional yang berasal dari Sukoharjo, Jawa Tengah. Soepomo terkenal sebagai perancang Undang-Undang Dasar 1945 bersama dengan Moh. Yamin dan Soekarno. Setelah kemerdekaan Indonesia, Soepomo menjabat sebagai Menteri Kehakiman pertama di Indonesia.",
        'photo':
            "https://images.tokopedia.net/img/JFrBQq/2022/7/22/c9d9e558-99cc-4623-8dba-3928b0fad458.jpg",
      },
      {
        'name': "RM Tirto Adi Soerjo",
        'keterangan':
            "Raden Mas Tirto Adi Soerjo adalah pahlawan nasional asal Blora, Jawa Tengah yang pertama kali merintis surat kabar di Indonesia. Pada waktu itu, sekitar tahun 1903 - 1908, Tirto membangun surat kabar Soenda Berita, Medan Prijaji, dan Putri Hindia.",
        'photo':
            "https://images.tokopedia.net/img/JFrBQq/2022/5/23/c16d724c-60f7-40cb-880c-decef6b7d020.jpg",
      },
      {
        'name': "H.O.S Tjokroaminoto",
        'keterangan':
            "Raden Hadji Oemar Said Tjokroaminoto atau lebih dikenal H.O.S Cokroaminoto adalah salah satu pahlawan nasional Indonesia yang berasal dari Madiun, Jawa Timur. H.O.S Cokroaminoto merupakan pemimpin organisasi pertama di Indonesia, yakni Sarekat Islam (SI) yang sebelumnya dikenal dengan nama Serikat Dagang Islam.",
        'photo':
            "https://images.tokopedia.net/img/JFrBQq/2022/5/23/8f6a30ee-53b2-44a3-adfd-b6f507bfa269.jpg",
      },
      {
        'name': "Hasyim Asyari",
        'keterangan':
            "Kyai Haji Mohammad Hasyim Asy'ari menjadi nama pahlawan dan asalnya selanjutnya. Hasyim Asy’ari berasal dari daerah Jombang. Ia dikenal sebagai pendiri Nahdlatul Ulama (NU), salah satu organisasi Islam pertama dan terbesar di Indonesia.",
        'photo':
            "https://images.tokopedia.net/blog-tokopedia-com/uploads/2019/12/Hasyim-Asyari.jpg",
      },
      {
        'name': "Pangeran Diponegoro",
        'keterangan':
            "Pangeran Diponegoro merupakan nama pahlawan nasional yang berasal dari Yogyakarta. Ia berperan besar dalam memimpin Perang Jawa yang terjadi dalam kurun waktu lima tahun, yaitu pada tahun 1825 hingga 1830.",
        'photo':
            "https://images.tokopedia.net/blog-tokopedia-com/uploads/2019/12/pangeran-diponegoro.jpg",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tugas List Pahlawan",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: listPahlawan.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> pahlawan = listPahlawan[index];
          return itemCard(
              pahlawan['name'], pahlawan['keterangan'], pahlawan['photo'], () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  name: pahlawan['name'],
                  keterangan: pahlawan['keterangan'],
                  photo: pahlawan['photo'],
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Widget itemCard(
      String name, String keterangan, String photo, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 2,
              spreadRadius: 0,
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                topLeft: Radius.circular(8),
              ),
              child: Image.network(
                photo,
                fit: BoxFit.cover,
                width: 125,
                height: 100,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                    ),
                    child: Text(
                      keterangan,
                      textAlign: TextAlign.justify,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
