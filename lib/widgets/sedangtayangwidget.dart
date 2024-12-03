import 'package:flutter/material.dart';

class SedangTayangWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header "Sedang Tayang" dengan teks "Semua" dan ikon panah
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Sedang Tayang",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      "Semua",
                      style: TextStyle(fontSize: 14, color: Colors.blue[900], fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 4), // Memberi jarak antara teks dan ikon
                    Icon(Icons.arrow_forward_ios, size: 14, color: Colors.blue[900]),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Tombol filter di atas poster film
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildFilterButton(context, "Semua Film", true),
                  _buildFilterButton(context, "XXI", false),
                  _buildFilterButton(context, "CGV", false),
                  _buildFilterButton(context, "Cinépolis", false),
                  _buildFilterButton(context, "Watchlist", false, withIcon: true),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Carousel poster film beserta deskripsi
          SizedBox(
            height: 400, // Sesuaikan dengan tinggi yang lebih kompak untuk carousel
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 1000, // Angka besar untuk looping tanpa batas
              itemBuilder: (context, index) {
                // Mendapatkan indeks yang akan diulang
                final movieIndex = index % 4; // 4 adalah jumlah film yang ada
                return _buildMovieWithDescription(
                  imagePath: _getImagePath(movieIndex),
                  title: _getMovieTitle(movieIndex),
                  description: _getMovieDescription(movieIndex),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat tombol filter
  Widget _buildFilterButton(BuildContext context, String label, bool isSelected, {bool withIcon = false}) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: ElevatedButton(
        onPressed: () {
          // Aksi saat tombol ditekan
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue[900] : Colors.grey[200],
          foregroundColor: isSelected ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        child: Row(
          children: [
            if (withIcon)
              Icon(
                Icons.favorite_border,
                size: 16,
                color: isSelected ? Colors.white : Colors.black,
              ),
            if (withIcon) const SizedBox(width: 4),
            Text(
              label,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk mendapatkan path gambar berdasarkan index
  String _getImagePath(int index) {
    switch (index) {
      case 0:
        return 'assets/BilaIbu.jpeg';
      case 1:
        return 'assets/BadBoys.jpg';
      case 2:
        return 'assets/TheShadow.jpg';
      case 3:
        return 'assets/AVENGERS.jpg';
      default:
        return 'assets/BilaIbu.jpeg';
    }
  }

  // Fungsi untuk mendapatkan judul film berdasarkan index
  String _getMovieTitle(int index) {
    switch (index) {
      case 0:
        return "Bila Esok Ibu Tiada";
      case 1:
        return "Bad Boys: Ride Or Die";
      case 2:
        return "The Shadow Strays";
      case 3:
        return "Avengers: End Game";
      default:
        return "Film Unknown";
    }
  }

  // Fungsi untuk mendapatkan deskripsi film berdasarkan index
  String _getMovieDescription(int index) {
    switch (index) {
      case 0:
        return "Rating ⭐9,2! Wajib ditonton! Sebuah film yang penuh dengan emosi, tentang kisah seorang ibu yang berjuang untuk anak-anaknya. Cerita yang mengharukan dan menginspirasi.";
      case 1:
        return "Rating ⭐8,8! Aksi tanpa henti! Dua detektif yang bersahabat menghadapi misi berbahaya untuk melindungi kota dari ancaman besar. Penuh ketegangan, ledakan, dan kejar-kejaran spektakuler.";
      case 2:
        return "Rating ⭐9,0! Thriller yang memukau! Mengisahkan perjalanan detektif dalam mengungkap misteri hilangnya seorang anak. Dengan plot yang penuh ketegangan dan twist yang tak terduga.";
      case 3:
        return "Rating ⭐9,5! Epik dan mengharukan! Setelah tragedi besar di Avengers: Infinity War, para pahlawan dunia bersatu untuk membalikkan kehancuran yang disebabkan oleh Thanos. Pertarungan terbesar dalam sejarah MCU!";
      default:
        return "Deskripsi film tidak tersedia.";
    }
  }

  // Fungsi untuk membuat kartu film dengan deskripsi
  Widget _buildMovieWithDescription({
    required String imagePath,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Poster film
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 250, // Lebar poster
              height: 300, // Tinggi poster lebih kecil
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),

          // Tombol beli tiket dengan lebar yang sama dengan poster dan posisi center
          SizedBox(
            width: 250, // Lebar yang sama dengan poster
            child: ElevatedButton(
              onPressed: () {}, // Fungsi untuk beli tiket
              style: ElevatedButton.styleFrom(
                alignment: Alignment.center,
                backgroundColor: Colors.amber[600], // Mengubah warna tombol menjadi amber
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12), // Padding lebih besar agar tombol lebih besar
              ),
              child: const Text(
                "BELI TIKET",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), // Font lebih tebal
              ),
            ),
          ),
          const SizedBox(height: 4),

          // Deskripsi film yang lebih panjang
          SizedBox(
            width: 250, // Sama dengan lebar poster
            child: Text(
              description,
              maxLines: 3, // Menampilkan tiga baris deskripsi
              overflow: TextOverflow.ellipsis, // Agar deskripsi yang terlalu panjang tidak keluar layar
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
