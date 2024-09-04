import 'package:flutter/material.dart';
import 'dart:async';
import 'package:agrishare/pages/LoginRegisterScreen.dart';



void main() {
  runApp(AgrishareApp());
}

class AgrishareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InitialPage(),
    );
  }
}

class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    // 5 saniye sonra "Login-Register Screen" sayfasına yönlendir.
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginRegisterScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo ve yazı
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  child: Image.asset('logo.jpg'), // Logonun yolunu belirtin
                )
              ],
            ),
            SizedBox(height: 40),
            // Yüklenme animasyonu
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6BBE92)),
            ),
          ],
        ),
      ),
    );
  }
}

