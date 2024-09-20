import 'package:flutter/material.dart';
import 'Sidebar.dart'; // Import the Sidebar

import 'package:agrishare/pages/BrowseAgrilands.dart';
import 'package:agrishare/pages/Contact.dart';
import 'package:agrishare/pages/CreateRequestScreen.dart';
import 'package:agrishare/pages/offers1.dart';


class AgrishareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EntrepreneurMainScreen(),
    );
  }
}

class EntrepreneurMainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF6BBE92),
        elevation: 0,
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openEndDrawer(); // Open sidebar from the right
              },
            ),
          ),
        ],
      ),
      endDrawer: Sidebar(), // Sidebar is now in a separate file
      body: Column(
        children: [
          SizedBox(height: 20),
          // User Profile Section
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            child: Icon(
              Icons.person,
              size: 50,
              color: Color(0xFF6BBE92),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Welcome emir kagan yigit',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 30),
          Text(
            'Quick Menus',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          // Quick Menus (same as before)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                _buildMenuButton(
                  icon: Icons.add_alert,
                  label: 'Create Request',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CreateRequestPage()),
                    );
                  },
                ),
                _buildMenuButton(
                  icon: Icons.search,
                  label: 'Browse Agri-Lands',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BrowseAgriLandsPage()),
                    );
                  },
                ),
                _buildMenuButton(
                  icon: Icons.chat,
                  label: 'Contact Owners',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactPage()),
                    );
                  },
                ),
                _buildMenuButton(
                  icon: Icons.handshake,
                  label: 'View Offers',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewOffersPage()),
                    );
                  },
                ),
              ],
            ),
          ),
          Spacer(),
          // Footer Logo
          Opacity(
            opacity: 0.4,
            child: Image.asset(
              'logo.jpg', // Add your logo file here
              width: 100,
              height: 100,
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildMenuButton(
      {required IconData icon, required String label, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF6BBE92),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.white),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
