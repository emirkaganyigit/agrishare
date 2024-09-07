import 'package:agrishare/pages/EntrepreneurMain.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:agrishare/pages/LoginRegisterScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase yapılandırma detayları
  const firebaseConfig = FirebaseOptions(
    apiKey: "AIzaSyD9LjRYZhPrn4bPxAErYDOzRzSXrBo0Rls", // Firebase konsolundan aldığınız bilgilerle değiştirin
    authDomain: "agrishare-ed20f.firebaseapp.com",
    projectId: "agrishare-ed20f",
    storageBucket: "agrishare-ed20f.appspot.com",
    messagingSenderId: "154275439031",
    appId: "1:154275439031:android:1b03919fd12e146f080832",
  );

  await Firebase.initializeApp(
    options: firebaseConfig,
  );
  
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
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              child: Image.asset('logo.jpg'), // Logo yolu güncellendi
            ),
            SizedBox(height: 40),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF6BBE92)),
            ),
          ],
        ),
      ),
    );
  }
}
