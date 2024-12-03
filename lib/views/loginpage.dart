import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Untuk menggunakan TextInputFormatter
import 'package:ukl_tix_id/views/dasboardpage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Text(
            'Daftar TIX ID',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Menghilangkan bayangan bawaan AppBar
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2), // Tinggi garis
          child: Container(
            color: Colors.grey[300],
            height: 1.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama Lengkap
            const Text(
              'NAMA LENGKAP',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              inputFormatters: [
                // Membatasi input hanya huruf
                FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]'))
              ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(height: 16),

            // Nomor Handphone
            const Text(
              'NOMOR HANDPHONE',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.phone,
              inputFormatters: [
                // Membatasi input hanya angka
                FilteringTextInputFormatter.digitsOnly
              ],
              decoration: InputDecoration(
                prefixText: '+62 ',
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
            const SizedBox(height: 32),

            // Tombol Daftar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardPage()), // Ganti dengan halaman tujuan Anda
                  );
                },
                child: const Text(
                  'Daftar TIX ID',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
