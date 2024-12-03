import 'package:flutter/material.dart';
import 'package:ukl_tix_id/widgets/header.dart';
import 'package:ukl_tix_id/widgets/bottom.dart';

class Tiketkupage extends StatefulWidget {
  const Tiketkupage({super.key});

  @override
  _TiketkupageState createState() => _TiketkupageState();
}

class _TiketkupageState extends State<Tiketkupage> {
  // Data film langsung dalam bentuk daftar Map
  final List<Map<String, String>> tickets = [
    {
      'title': 'AVENGERS: ENDGAME',
      'genre': 'Action',
      'rating': '9.5',
      'ageRating': '19+', // Menambahkan batasan umur
      'image': 'assets/AVENGERS.jpg',
    },
    {
      'title': 'BAD BOYS: RIDE OR DIE',
      'genre': 'Action, Adventure',
      'rating': '8.8',
      'ageRating': '17+', // Menambahkan batasan umur
      'image': 'assets/BadBoys.jpg',
    },
    {
      'title': 'THE SHADOW STRAYS',
      'genre': 'Action, Hunter',
      'rating': '9.0',
      'ageRating': '16+', // Menambahkan batasan umur
      'image': 'assets/TheShadow.jpg',
    },
  ];

  String _selectedCity = "Malang"; // Kota yang dipilih
  bool _isDropdownOpen = false; // Menandakan apakah dropdown kota terbuka

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lokasi Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: Colors.blueGrey, size: 24),
                  const SizedBox(width: 8),
                  Text(
                    _selectedCity,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isDropdownOpen = !_isDropdownOpen; // Toggle dropdown
                      });
                    },
                    child: Icon(
                      _isDropdownOpen
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.blueGrey,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            // Dropdown pilihan kota
            if (_isDropdownOpen) ...[
              Column(
                children: [
                  for (var city in ['Malang', 'Jakarta', 'Surabaya', 'Bandung', 'Yogyakarta', 'Semarang', 'Medan', 'Bali'])
                    ListTile(
                      title: Text(city),
                      onTap: () {
                        setState(() {
                          _selectedCity = city; // Set kota yang dipilih
                          _isDropdownOpen = false; // Tutup dropdown setelah memilih kota
                        });
                      },
                    ),
                ],
              ),
            ],

            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  final movie = tickets[index];
                  return TicketCard(
                    title: movie['title']!,
                    genre: movie['genre']!,
                    rating: movie['rating']!,
                    ageRating: movie['ageRating']!, // Mengirim batasan umur
                    image: movie['image']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Bottomnavigation(3),
    );
  }
}

class TicketCard extends StatelessWidget {
  final String title;
  final String genre;
  final String rating;
  final String ageRating;
  final String image;

  const TicketCard({
    required this.title,
    required this.genre,
    required this.rating,
    required this.ageRating,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Rating logic to determine full and empty stars
    int fullStars = 0;
    int emptyStars = 5;
    double ratingValue = double.tryParse(rating) ?? 0.0;

    if (ratingValue >= 9.0) {
      fullStars = 4;
      emptyStars = 1;
    } else if (ratingValue >= 8.0) {
      fullStars = 3;
      emptyStars = 2;
    } else if (ratingValue >= 7.0) {
      fullStars = 2;
      emptyStars = 3;
    } else if (ratingValue >= 6.0) {
      fullStars = 1;
      emptyStars = 4;
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            child: Image.asset(
              image,
              width: 100,
              height: 120,
              fit: BoxFit.cover, // Pastikan menggunakan BoxFit.cover agar gambar sesuai
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    genre,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      // Display full stars
                      for (int i = 0; i < fullStars; i++)
                        const Icon(Icons.star, size: 16, color: Colors.orange),
                      // Display empty stars
                      for (int i = 0; i < emptyStars; i++)
                        const Icon(Icons.star, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Display age rating
                  Row(
                    children: [
                      const Icon(Icons.person, size: 16, color: Colors.blueGrey),
                      const SizedBox(width: 4),
                      Text(
                        ageRating, // Menampilkan batasan umur
                        style: const TextStyle(fontSize: 12, color: Colors.blueGrey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
