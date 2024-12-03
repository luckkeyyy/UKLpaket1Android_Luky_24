import 'package:flutter/material.dart';
import 'package:latihan_ukl1/screen/bioskop_screen.dart';
import 'package:latihan_ukl1/screen/home_screen.dart';
import 'package:latihan_ukl1/screen/register_screen.dart';
import 'package:latihan_ukl1/screen/tiket_screen.dart';
import 'package:latihan_ukl1/screen/tiketku_screen.dart';
import 'screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set initial route ke SplashScreen
      routes: {
        '/': (_) => SplashScreen(),
        '/l': (_) => RegisterScreen(),
        '/h': (_) => HomeScreen(),
        '/b': (_) => BioskopScreen(),
        '/t': (_) => TiketScreen(),
        '/a': (_) => TiketkuScreen(),
      },
    );
  }
}
    
  

