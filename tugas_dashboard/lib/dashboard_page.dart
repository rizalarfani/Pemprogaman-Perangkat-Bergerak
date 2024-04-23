import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Stack(
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
                      SizedBox(height: 15),
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
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.25,
                  ),
                  shrinkWrap: true,
                  children: [
                    itemMenu(
                      'Data User',
                      const Icon(
                        Icons.list,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    itemMenu(
                      'Tambah User',
                      const Icon(
                        Icons.person_add,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    itemMenu(
                      'Transaksi',
                      const Icon(
                        Icons.attach_money,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    itemMenu(
                      'Logout',
                      const Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }

  Widget itemMenu(String title, Icon icon) {
    return Container(
      margin: const EdgeInsets.all(10),
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
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(41, 136, 240, 1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: icon,
            ),
          ),
          const SizedBox(height: 13),
          Text(
            title,
            style: const TextStyle(
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
