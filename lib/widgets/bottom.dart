import 'package:flutter/material.dart';

class Bottomnavigation extends StatelessWidget {
  final int currentIndex;

  Bottomnavigation(this.currentIndex);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        if (index != currentIndex) {
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home'); // Beranda
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/bioskop'); // Bioskop
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/tiket'); // Tiket
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/tiketku'); // Tiketku
              break;
          }
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
        BottomNavigationBarItem(icon: Icon(Icons.movie_filter), label: "Bioskop"),
        BottomNavigationBarItem(icon: Icon(Icons.confirmation_number), label: "Tiket"),
        BottomNavigationBarItem(icon: Icon(Icons.confirmation_number_outlined), label: "Tiketku"),
      ],
      selectedItemColor: Colors.blue[900],
      unselectedItemColor: Colors.grey,
    );
  }
}
