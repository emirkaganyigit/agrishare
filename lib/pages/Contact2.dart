import 'package:flutter/material.dart';
import 'navbar2.dart'; // Import navbar.dart for the bottom navigation bar
import 'message.dart'; // Import the message page

class Contact2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6BBE92),
        title: Text('Messages'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Contacts section with avatars
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildContactAvatar('Erinc Turkkan'),
                  _buildContactAvatar('Erinc Turkkan'),
                  _buildContactAvatar('Erinc Turkkan'),
                  _buildContactAvatar('Erinc Turkkan'),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Message list
            Expanded(
              child: ListView(
                children: [
                  _buildMessageTile(context, 'Emir Kagan Yigit', 'lorem ipsum dolor sit amet', 'May 12', true),
                  _buildMessageTile(context, 'Emir Kagan Yigit', 'lorem ipsum dolor sit amet', 'May 12', true),
                  _buildMessageTile(context, 'Emir Kagan Yigit', 'lorem ipsum dolor sit amet', 'May 12', true),
                  _buildMessageTile(context, 'Emir Kagan Yigit', 'lorem ipsum dolor sit amet', 'May 12', true),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF6BBE92),
        onPressed: () {
          // Action for creating new message
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: NavBar2(), // Import navbar
    );
  }

  // Function to build each contact avatar
  Widget _buildContactAvatar(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, size: 30, color: Colors.black),
          ),
          SizedBox(height: 5),
          Text(name, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  // Function to build message tile with navigation to the MessagesPage
  Widget _buildMessageTile(BuildContext context, String name, String message, String date, bool unread) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: Icon(Icons.person, size: 30, color: Colors.black),
      ),
      title: Text(name),
      subtitle: Text(message),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(date, style: TextStyle(fontSize: 12)),
          if (unread)
            Icon(
              Icons.circle,
              size: 10,
              color: Colors.red,
            ), // Red dot for unread message
        ],
      ),
      onTap: () {
        // Navigate to the MessagesPage when tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MessagesPage(contactName: name)),
        );
      },
    );
  }
}
