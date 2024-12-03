import 'package:flutter/material.dart';
import 'package:ukl_tix_id/views/bioskoppage.dart';
import 'package:ukl_tix_id/views/dasboardpage.dart';
import 'package:ukl_tix_id/views/loginpage.dart';
import 'package:ukl_tix_id/views/splashpage.dart';
import 'package:ukl_tix_id/views/tiketkupage.dart';
import 'package:ukl_tix_id/views/tiketpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => SplashPage(),
      '/login': (context) => LoginPage(),
      '/home': (context) => DashboardPage(),
      '/bioskop': (context) => BioskopPage(),
      '/tiket': (context) => TiketPage(),
      '/tiketku': (context) => Tiketkupage()
    },
    );
  }
}