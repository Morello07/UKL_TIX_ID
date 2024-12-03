import 'package:flutter/material.dart';

/// Model untuk item berita
class NewsItem {
  final String title;
  final String views;
  final String likes;
  final String time;
  final String imageUrl;

  NewsItem({
    required this.title,
    required this.views,
    required this.likes,
    required this.time,
    required this.imageUrl,
  });
}

/// Widget untuk menampilkan daftar berita dalam TIX Now
class TixNowWidget extends StatelessWidget {
  TixNowWidget({Key? key}) : super(key: key);

  /// Daftar berita yang ditampilkan
  final List<NewsItem> newsItems = [
    NewsItem(
      title: "Kejar-kejaran Menegangkan di Film 'Fast & Furious 10'",
      views: "2.300.000",
      likes: "1.250",
      time: "1 jam lalu",
      imageUrl: "assets/FAST.jpg",
    ),
    NewsItem(
      title: "Tom Cruise Kembali di 'Mission: Impossible – Dead Reckoning'",
      views: "1.700.000",
      likes: "900",
      time: "3 hari lalu",
      imageUrl: "assets/MISSION.jpg",
    ),
    NewsItem(
      title: "Film Aksi Terbaru 'John Wick: Chapter 4' Penuh Adegan Menegangkan",
      views: "1.100.000",
      likes: "850",
      time: "5 hari lalu",
      imageUrl: "assets/JOHN.jpg",
    ),
    NewsItem(
      title: "Kehebohan Aksi di 'Guardians of the Galaxy Vol. 3'",
      views: "1.500.000",
      likes: "1.000",
      time: "6 hari lalu",
      imageUrl: "assets/GUARDIANS.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 1), // Bayangan ke bawah
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'TIX Now',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold, // Ubah ke bold
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Semua',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 14,
                        fontWeight: FontWeight.bold, // Gaya sesuai sebelumnya
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.blue[900],
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Deskripsi
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Update berita terbaru seputar dunia film aksi',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
          ),

          const Divider(height: 1),

          // Daftar berita
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: newsItems.length,
            separatorBuilder: (context, index) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final item = newsItems[index];
              return Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gambar berita
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        item.imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Detail berita
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                '${item.views} views',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Text(
                                '${item.likes} likes',
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                item.time,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    // Label berita
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'News',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
