import 'package:flutter/material.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: const Text(
          'Tentang Kami',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width - 50,
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      'https://jevanka.github.io/udinus/assets/img/bg_2.png',
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "RSI TEGAL",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: _buildInfo(context),
            ),
            const SizedBox(height: 15),
            Image.network(
              'https://globalrancangselaras.com/images/thumb-169094375464c9c10adc575.jpg',
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width - 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.pinkAccent,
          width: 5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Mohamad Rijal Arfani",
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 5),
          Center(
            child: Text(
              "A18.2023.00046",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            "Tentang Aplikasi",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Aplikasi ini digunakan untuk menjual berbagai jenis obat dengan khasiat tinggi.",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
