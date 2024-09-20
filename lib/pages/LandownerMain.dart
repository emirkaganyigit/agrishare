import 'package:agrishare/pages/BrowseRequests.dart';
import 'package:agrishare/pages/Contact2.dart';
import 'package:agrishare/pages/navbar2.dart';
import 'package:agrishare/pages/offers2.dart';
import 'package:agrishare/pages/uploadAgriLand.dart';
import 'package:flutter/material.dart';
import 'package:agrishare/pages/sidebar.dart'; // Sidebar sayfasını import edin

class LandOwnerMainPage extends StatelessWidget {
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),

            // Welcome Section
            Column(
              children: [
                Icon(
                  Icons.eco, // Using an eco icon for the agricultural theme
                  size: 80,
                  color: Colors.green,
                ),
                SizedBox(height: 20),
                Text(
                  'welcome',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'emir kagan yigit', // Kullanıcının adı
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            // Quick Menus Section
            Text(
              'quick menus',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Quick Menu Butonları için Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                // Upload Agri-Land Button
                _buildQuickMenuButton(
                  icon: Icons.upload,
                  label: 'upload your agri-land',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => UploadLandScreen()),
                    );
                  },
                ),
                // Browse Requests Button
                _buildQuickMenuButton(
                  icon: Icons.search,
                  label: 'browse requests',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RequestsScreen()),
                    );
                  },
                ),
                // Contact Entrepreneurs Button
                _buildQuickMenuButton(
                  icon: Icons.contact_mail,
                  label: 'contact entrepreneurs',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Contact2Page()),
                    );
                  },
                ),
                // View Offers Button
                _buildQuickMenuButton(
                  icon: Icons.local_offer,
                  label: 'view offers',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Offers2Screen()),
                    );
                  },
                ),
              ],
            ),
            Spacer(),

            // AgriShare Logo
            Text(
              'agrishare',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar2(), // NavBar için alt menü
    );
  }

  // Quick Menu Butonları İçin Yardımcı Fonksiyon
  Widget _buildQuickMenuButton({required IconData icon, required String label, required Function onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.green, width: 2),
        ),
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.green),
            SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
