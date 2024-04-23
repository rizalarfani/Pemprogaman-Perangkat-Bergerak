import 'package:flutter/material.dart';
import 'package:tugas_responsi/stok_page.dart';
import 'package:tugas_responsi/tentang_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildHeading(),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const StokPage(),
                            ));
                      },
                      child: _buildItemMenu(
                          'Stok Obat',
                          'https://w7.pngwing.com/pngs/813/397/png-transparent-syrup-bottle-medicine-medical-icon.png',
                          context),
                    ),
                    _buildItemMenu(
                        'Transaksi Obat',
                        'https://w7.pngwing.com/pngs/641/147/png-transparent-computer-icons-medicine-pharmaceutical-drug-hospital-drugs-electronics-tablet-drug.png',
                        context),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TentangPage(),
                            ));
                      },
                      child: _buildItemMenu(
                          'Tentang',
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjk8MNSVoWfNWoLab0UbF-VWAlADgSdXMTyzWdDqNz1A&s',
                          context),
                    ),
                    _buildItemMenu(
                        'Exit',
                        'https://w7.pngwing.com/pngs/629/954/png-transparent-computer-icons-login-icon-design-exit-miscellaneous-angle-text-thumbnail.png',
                        context),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Image.network(
                'https://globalrancangselaras.com/images/thumb-169094375464c9c10adc575.jpg',
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeading() {
    return Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      height: 150,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Mohamad Rijal Arfani',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'A18.2023.00046',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Menjual Berbagai obat',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Image.network(
            'https://w7.pngwing.com/pngs/215/222/png-transparent-hospital-building-medicine-clinic-health-care-hospital-nurse.png',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _buildItemMenu(String title, String icon, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width / 2.3,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.pinkAccent, width: 2),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(
              icon,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.pinkAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
