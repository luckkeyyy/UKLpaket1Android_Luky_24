import 'package:flutter/material.dart';
import 'register_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RegisterScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo tix.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 10),
            Text(
              'TIX VIP, lebih seru, koin melimpah, \ndapat hadiah',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black),
            ),
            SizedBox(height: 5),
            Text(
              'Gabung TIX VIP kumpulkan koin untuk\n mendapatkan hadiah dan diskon',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
