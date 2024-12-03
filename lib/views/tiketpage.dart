import 'package:flutter/material.dart';
import 'package:ukl_tix_id/widgets/bottom.dart';

class TiketPage extends StatefulWidget {
  const TiketPage({super.key});
  @override
  _TiketPageState createState() => _TiketPageState();
}

class _TiketPageState extends State<TiketPage> {
  bool isSedangTayang = true;

  // List of movies for both "Sedang Tayang" and "Akan Datang" (same movies)
  final List<Movie> allMovies = [
    Movie('BILA ESOK IBU TIADA', 'Drama, Keluarga', '9.2', 'assets/BilaIbu.jpeg', ageRating: '13+'),
    Movie('AVENGERS: ENDGAME', 'Action', '9.5', 'assets/AVENGERS.jpg', ageRating: '19+'),
    Movie('BAD BOYS: RIDE OR DIE', 'Action, Adventure', '8.8', 'assets/BADBOYS.jpg', ageRating: '17+'),
    Movie('THE SHADOW  STRAYS', 'Action, Hunter', '9.0', 'assets/TheShadow.jpg', ageRating: '16+'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Film Bioskop', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(color: Colors.grey),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => isSedangTayang = true),
                  style: ElevatedButton.styleFrom(backgroundColor: isSedangTayang ? Color(0xFF0B2447) : Colors.grey),
                  child: const Text('Sedang Tayang', style: TextStyle(color: Colors.white)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => setState(() => isSedangTayang = false),
                  style: ElevatedButton.styleFrom(backgroundColor: !isSedangTayang ? Color(0xFF0B2447) : Colors.grey),
                  child: const Text('Akan Datang', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(5),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16, childAspectRatio: 0.7),
              itemCount: isSedangTayang ? allMovies.length : 3, // Show only 3 movies for "Akan Datang"
              itemBuilder: (context, index) {
                final movie = allMovies[index]; // Display same movie list for both tabs
                return MovieCard(movie: movie, onFavoriteToggle: () {
                  setState(() {
                    movie.isFavorited = !movie.isFavorited;
                  });
                });
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Bottomnavigation(2),
    );
  }
}

class Movie {
  final String title, genre, rating, image, ageRating;
  bool isFavorited;
  Movie(this.title, this.genre, this.rating, this.image, {required this.ageRating, this.isFavorited = false});
}

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onFavoriteToggle;
  const MovieCard({required this.movie, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    final ratingValue = double.tryParse(movie.rating) ?? 0.0;
    final fullStars = ratingValue >= 9.0 ? 4 : ratingValue >= 8.0 ? 3 : ratingValue >= 7.0 ? 2 : ratingValue >= 6.0 ? 1 : 0;
    final emptyStars = 5 - fullStars;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(movie.image, fit: BoxFit.cover, width: double.infinity),
                ),
                Positioned(
                  right: 8, top: 8,
                  child: GestureDetector(
                    onTap: onFavoriteToggle,
                    child: CircleAvatar(
                      backgroundColor: Colors.amber[600],
                      child: Icon(
                        movie.isFavorited ? Icons.favorite : Icons.favorite_border,
                        color: movie.isFavorited ? Colors.red[700] : Colors.blue[900],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 8, top: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: Colors.amber[600], borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      movie.ageRating,
                      style: TextStyle(color: Colors.blue[900], fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movie.title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold), maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 4),
                Text(movie.genre, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    for (int i = 0; i < fullStars; i++) const Icon(Icons.star, size: 16, color: Colors.orange),
                    for (int i = 0; i < emptyStars; i++) const Icon(Icons.star, size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text(movie.rating, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
