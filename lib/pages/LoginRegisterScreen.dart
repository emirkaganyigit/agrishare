import 'package:flutter/material.dart';
import 'package:agrishare/pages/RegisterScreen.dart';
import 'package:agrishare/pages/LoginScreen.dart';


class LoginRegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo ve uygulama adı
            Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  child: Image.asset('logo.jpg'), // Logonun yolunu belirtin
                ),
                SizedBox(height: 10),
                Text(
                  'welcome to agrishare!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            // Login butonu
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2ea889), // Buton rengi
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('login', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 20),
            // Register butonu
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00664F), // Buton rengi
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text('register', style: TextStyle(fontSize: 18)),
            ),
            SizedBox(height: 40),
            // Help center linki
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HelpCenterScreen()),
                );
              },
              child: Text(
                'need help?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.redAccent,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// Help center ekranı
class HelpCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Help Center'),
      ),
      body: Center(
        child: Text('This is the Help Center Screen'),
      ),
    );
  }
}
