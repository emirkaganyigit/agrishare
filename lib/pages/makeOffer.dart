import 'package:flutter/material.dart';
import 'navbar2.dart'; // Import the reusable NavBar2 widget

class MakeOfferScreen extends StatelessWidget {
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Make an Offer'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu), 
            onPressed: () {
              // Navigate to sidebar.dart when the menu icon is pressed
              Navigator.pushNamed(context, '/sidebar');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile and details
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.person, color: Colors.white, size: 50),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Erinc Turkkan',
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Agricultural Engineer',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),
            
            // Request details
            DetailItem(
              label: 'Nearby location', 
              value: 'Around Izmir',
            ),
            DetailItem(
              label: 'Required size (m²)', 
              value: '20.000-50.000 m²',
            ),
            DetailItem(
              label: 'Suitable climate', 
              value: 'Sunny, wet air',
            ),
            DetailItem(
              label: 'Target products', 
              value: 'Olive, Orange',
            ),

            SizedBox(height: 24),

            // Expected price
            Row(
              children: [
                Icon(Icons.euro, color: Colors.green, size: 32),
                SizedBox(width: 8),
                Text(
                  '45-70€/month',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: 24),

            // Price input field
            Row(
              children: [
                Icon(Icons.euro, color: Colors.green, size: 28),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enter your price offer',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),

            Spacer(),

            // Make an Offer button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle the offer submission logic here
                  String priceOffer = priceController.text;
                  if (priceOffer.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Offer submitted: $priceOffer €/month'))
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter a valid price offer')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, 
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                ),
                child: Text('Make an Offer', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar2(),
    );
  }
}

class DetailItem extends StatelessWidget {
  final String label;
  final String value;

  DetailItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              label,
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
          ),
          SizedBox(width: 12),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
