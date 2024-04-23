import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            height: 180,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(41, 136, 240, 1),
            ),
            child: const SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5),
                  Text(
                    'Mohamad Rijal Arfani',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'A18.2023.00046',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              children: [
                itemMenu(),
                itemMenu(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget itemMenu() {
    return Container(
      padding: const EdgeInsets.all(19),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color.fromRGBO(41, 136, 240, 1),
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 7,
            spreadRadius: 0,
            offset: Offset(0, 2),
            color: Color.fromRGBO(0, 0, 0, 0.1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(41, 136, 240, 1),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.abc,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          const SizedBox(height: 13),
          const Text(
            'Transaksi',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
