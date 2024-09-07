import 'package:flutter/material.dart';
import 'package:agrishare/pages/settings.dart';
import 'package:agrishare/pages/SwitchRolePage.dart';
import 'package:agrishare/pages/ProfilePage.dart';
import 'package:agrishare/pages/HelpCenter.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
        child: Container(
          color: Colors.transparent, // Set full transparency
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.transparent, // Make background transparent
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xAA6BBE92), // Semi-transparent green for the sidebar content
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                ),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.transparent, // Transparent to show the background
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Emir Kagan Yigit',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildDrawerItem(
                      icon: Icons.settings,
                      text: 'Settings',
                      onTap: () {
                        // Handle settings navigation
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
                      },
                    ),
                    Divider(color: Colors.white),
                    _buildDrawerItem(
                      icon: Icons.person,
                      text: 'My Profile',
                      onTap: () {
                        // Handle profile navigation
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
                      },
                    ),
                    Divider(color: Colors.white),
                    _buildDrawerItem(
                      icon: Icons.help_outline,
                      text: 'Help Center',
                      onTap: () {
                        // Handle help center navigation
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HelpCenterPage()));
                      },
                    ),
                    Divider(color: Colors.white),
                    _buildDrawerItem(
                      icon: Icons.swap_horiz,
                      text: 'Switch Role',
                      onTap: () {
                        // Handle switch role
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SwitchRolePage()));
                      },
                    ),
                    Divider(color: Colors.white),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Opacity(
                        opacity: 0.8,
                        child: Image.asset(
                          'assets/agrishare_icon_logo.jpg', // Add your logo image path
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
      {required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }
}