import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  bool autoLocationEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF6BBE92), // Green color for consistency
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          // Account settings
          ListTile(
            leading: Icon(Icons.person, color: Colors.green),
            title: Text('Account Settings'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle account settings navigation
              _showAccountSettings();
            },
          ),
          Divider(),

          // Notification Settings
          SwitchListTile(
            activeColor: Colors.green,
            title: Text('Enable Notifications'),
            value: notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
          ),
          Divider(),

          // Location Services
          SwitchListTile(
            activeColor: Colors.green,
            title: Text('Auto Location Tracking'),
            value: autoLocationEnabled,
            onChanged: (bool value) {
              setState(() {
                autoLocationEnabled = value;
              });
            },
          ),
          Divider(),

          // Language Settings
          ListTile(
            leading: Icon(Icons.language, color: Colors.green),
            title: Text('Language'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle language change settings
              _showLanguageSettings();
            },
          ),
          Divider(),

          // Help Center
          ListTile(
            leading: Icon(Icons.help_outline, color: Colors.green),
            title: Text('Help Center'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to help center
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HelpCenterPage()), // Assuming you have this page
              );
            },
          ),
          Divider(),

          // Logout
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.red),
            title: Text('Logout'),
            onTap: () {
              // Handle logout functionality
              _showLogoutDialog();
            },
          ),
        ],
      ),
    );
  }

  void _showAccountSettings() {
    // Here, you could navigate to another page to handle account settings
    print('Navigating to Account Settings');
  }

  void _showLanguageSettings() {
    // Here, you could allow the user to choose a preferred language
    print('Navigating to Language Settings');
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Handle actual logout here
                Navigator.of(context).pop();
                print('User logged out');
              },
              child: Text('Logout'),
              style: TextButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        );
      },
    );
  }
}

class HelpCenterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center'),
        backgroundColor: Color(0xFF6BBE92),
      ),
      body: Center(
        child: Text('Help and Support Section'),
      ),
    );
  }
}
