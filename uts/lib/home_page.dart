import 'package:flutter/material.dart';
import 'package:uts/pemprograman_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(157, 193, 131, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildHeading(),
                const SizedBox(height: 25),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.yellow,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'BAHASA PEMPROGRAMAN',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  width: double.infinity,
                  height: 260,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: -50,
                        child: Image.asset(
                          'assets/images/java.png',
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width / 1.5,
                        ),
                      ),
                      Positioned(
                        bottom: 25,
                        left: 20,
                        child: Image.asset(
                          'assets/images/ruby.png',
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width / 4,
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width / 2.6,
                        top: 15,
                        child: Image.asset(
                          'assets/images/php.png',
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width / 3,
                        ),
                      ),
                      Positioned(
                        left: MediaQuery.of(context).size.width / 2.7,
                        bottom: 10,
                        child: Image.asset(
                          'assets/images/python.png',
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width / 3.3,
                        ),
                      ),
                      Positioned(
                        top: 70,
                        right: 15,
                        child: Image.asset(
                          'assets/images/mysql.png',
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width / 3,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PemprogramanPage(),
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(13),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        "Lihat Data",
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeading() {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 224, 237, 247),
        borderRadius: BorderRadius.circular(30),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/profile.JPG'),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Mohamad Rijal Arfani',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'A18.2023.00046',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Fakultas Ilmu Komputer',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
