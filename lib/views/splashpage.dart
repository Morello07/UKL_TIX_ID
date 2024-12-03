import 'package:flutter/material.dart';
import 'package:ukl_tix_id/views/loginpage.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  double _opacity = 1.0; // Nilai awal opacity (1 = sepenuhnya terlihat)

  @override
  void initState() {
    super.initState();
    // Mulai animasi pudar setelah 1 detik
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _opacity = 0.0; // Set opacity menjadi 0 untuk efek menghilang
      });
    });

    // Berpindah halaman setelah animasi selesai (3 detik total)
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()), // Halaman tujuan
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        duration: const Duration(seconds: 1), // Durasi transisi pudar
        opacity: _opacity, // Gunakan nilai opacity dari state
        child: Container(
          color: Colors.blue[900],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/TIXID.png',
                  width: 250,
                ),
                const SizedBox(height: 20),
                Text(
                  'TIX VIP, lebih seru, koin melimpah,\n dapat hadiah!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Gabung TIX VIP dan kumpulkan koin untuk\nmendapatkan hadiah dan diskon.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
