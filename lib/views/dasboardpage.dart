import 'package:flutter/material.dart';
import 'package:ukl_tix_id/widgets/bannerwidget.dart';
import 'package:ukl_tix_id/widgets/bottom.dart';
import 'package:ukl_tix_id/widgets/header.dart';
import 'package:ukl_tix_id/widgets/sedangtayangwidget.dart';
import 'package:ukl_tix_id/widgets/spotligthwidget.dart';
import 'package:ukl_tix_id/widgets/tixnowwidget.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String selectedCity = 'Malang';  // Kota yang dipilih

  final List<String> cities = ['Malang', 'Surabaya', 'Jakarta', 'Bali'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Pemilihan Kota
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.blueGrey, size: 24),
                  const SizedBox(width: 8),
                  Text(
                    selectedCity,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.blueGrey),
                    onPressed: () {
                      _showCitySelectionDialog();
                    },
                  ),
                ],
              ),
            ),

            // Banner
            BannerWidget(),
            const SizedBox(),
            SedangTayangWidget(),
            const SizedBox(height: 10),
            SpotlightWidget(),
            const SizedBox(height: 10),
            TixNowWidget(),
          ],
        ),
      ),
      bottomNavigationBar: Bottomnavigation(0),
    );
  }

  // Fungsi untuk menampilkan dialog pemilihan kota
  void _showCitySelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pilih Kota'),
          content: SingleChildScrollView(
            child: Column(
              children: cities.map((city) {
                return ListTile(
                  title: Text(city),
                  onTap: () {
                    setState(() {
                      selectedCity = city; // Update kota yang dipilih
                    });
                    Navigator.pop(context); // Menutup dialog setelah memilih kota
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
