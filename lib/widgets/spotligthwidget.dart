import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SpotlightWidget extends StatefulWidget {
  @override
  _SpotlightWidgetState createState() => _SpotlightWidgetState();
}

class _SpotlightWidgetState extends State<SpotlightWidget> {
  int _currentIndex = 0; // To track the current carousel item

  // List of banner data (title, description, comment count)
  final List<Map<String, String>> _banners = [
    {
      'title': 'TIX ID Box Office (11-17 November)',
      'description':
          'Berita hiburan terhangat untuk Anda! Film-film terbaru masuk dalam daftar box office.',
      'comments': '57',
    },
    {
      'title': 'Film Aksi Paling Ditunggu!',
      'description': 'Saksikan film aksi terbaik yang mendominasi layar lebar minggu ini!',
      'comments': '120',
    },
    {
      'title': 'Film Romantis Terpopuler',
      'description': 'Film romantis yang sedang trending! Dapatkan rekomendasi film cinta terpopuler.',
      'comments': '98',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Spotlight",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          // Deskripsi tambahan
          const Text(
            "Berita hiburan terhangat untuk Anda",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          // Carousel for spotlight banners
          SizedBox(
            height: 180,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 180,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index; // Update the current index when carousel item changes
                  });
                },
              ),
              items: [
                'assets/banner2.jpeg',
                'assets/ANACONDA.jpg',
                'assets/banner1.jpeg',
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey[200],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          i,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 12),

          // Box with Image and Dynamic Content (Title, Description, Comments)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Image
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage('assets/spotlight.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Center Text Content
              Flexible(
                child: Center(
                  child: Container(
                    width: 2000,
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.23),
                    child: Column(
                      children: [
                        // Title centered
                        Text(
                          _banners[_currentIndex]['title']!,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center, // Center the title
                        ),
                        const SizedBox(height: 4),
                        // Description centered and scrollable
                        SingleChildScrollView(
                          child: Text(
                            _banners[_currentIndex]['description']!,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center, // Center the description
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Row for the View and Comment counts positioned at the bottom
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // View count at the bottom-left
              Row(
                children: [
                  const Icon(Icons.visibility, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    _banners[_currentIndex]['comments']!,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              // Comment count at the bottom-right
              Row(
                children: [
                  const Icon(Icons.comment, size: 16),
                  const SizedBox(width: 4),
                  const Text("0", style: TextStyle(fontSize: 14)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
