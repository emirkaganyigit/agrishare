import 'package:flutter/material.dart';
import 'navbar.dart'; // Assuming you already have a navbar.dart file for navigation

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'agrishare',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'my profile',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Divider(color: Colors.green, thickness: 2, indent: 50, endIndent: 50),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[200],
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            ProfileInfoItem(
              text: 'emir kagan yigit',
            ),
            ProfileInfoItem(
              text: 'land owner and entrepreneur',
            ),
            ProfileInfoItem(
              text: 'phone: 505 707 XX XX',
            ),
            ProfileInfoItem(
              text: 'mail: teamneogate@mail.com',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle profile edit
              },
              child: Text(
                'edit profile',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(), // Assuming you have a NavBar widget
    );
  }
}

class ProfileInfoItem extends StatelessWidget {
  final String text;

  ProfileInfoItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
