import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: [
          // Carousel untuk banner
          SizedBox(
            height: 180,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 250,
                autoPlay: true, // Mengaktifkan auto-play
                enlargeCenterPage: true, // Membesarkan gambar tengah
                aspectRatio: 16 / 9, // Rasio aspek gambar
                viewportFraction: 1, // Menampilkan satu gambar penuh
              ),
              items: [
                'assets/SENI.jpg', // Gambar pertama
                'assets/SEKAWAN.jpg', // Gambar kedua
                'assets/banner3.webp', // Gambar ketiga
                // Anda bisa menambahkan gambar lainnya di sini
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width, // Lebar sesuai ukuran layar
                      margin: const EdgeInsets.symmetric(horizontal: 5.0), // Margin antar gambar
                      decoration: BoxDecoration(
                        color: Colors.amber, // Warna latar belakang
                        borderRadius: BorderRadius.circular(2), // Sudut gambar melengkung
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Image.asset(
                          i, // Menampilkan gambar
                          fit: BoxFit.cover, // Menyesuaikan gambar agar memenuhi container
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
      
          // Widget TIX VIP di bawah banner
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), // Sudut melengkung
                gradient: const LinearGradient( // Gradient warna
                  colors: [Color(0xFFFAFAFA), Color(0xFFEFEFEF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // Bayangan
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                child: Row(
                  children: [
                    // Ganti Image.asset dengan Icon untuk koin
                    const Icon(
                      Icons.monetization_on, // Ikon koin
                      size: 40,
                      color: Colors.amber, // Warna ikon
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Jadilah TIX VIP ✨ Dapatkan untung lebih 😍",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios, // Panah ke kanan
                      size: 18,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}