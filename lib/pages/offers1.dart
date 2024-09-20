import 'package:flutter/material.dart';
import 'navbar.dart'; // Import the bottom navigation bar

class ViewOffersPage extends StatelessWidget {
  final List<Map<String, dynamic>> offers = [
    {
      'name': 'Emir Kagan Yigit',
      'price': '75€/month',
      'contactImage': 'assets/land_image.png',
    },
    {
      'name': 'Arif Aydar',
      'price': '80€/month',
      'contactImage': 'assets/land_image.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6BBE92),
        title: Text('Offers'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Menu action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 40,
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.person,
                size: 40,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Erinc Turkkan\'s Request',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: offers.length,
                itemBuilder: (context, index) {
                  final offer = offers[index];
                  return _buildOfferTile(context, offer['name'], offer['price'], offer['contactImage']);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(), // Import navbar.dart
    );
  }

  // Function to build offer tile
  Widget _buildOfferTile(BuildContext context, String name, String price, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(imagePath),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$name's Offer",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      price,
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Contact action
                    },
                    child: Text('Contact'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Refuse action
                        },
                        child: Text('Refuse'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {
                          // Accept action
                        },
                        child: Text('Accept'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
