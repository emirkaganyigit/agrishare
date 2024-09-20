import 'package:flutter/material.dart';
import 'navbar2.dart'; // Import your navbar widget

class MakeOffer2Screen extends StatelessWidget {
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
              // Handle the sidebar or menu button press here
              // For example, you can navigate to the sidebar page
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
            // Land image
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(child: Text('Land Image Placeholder', style: TextStyle(fontSize: 18))),
            ),
            SizedBox(height: 16),

            // Price per month
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.euro, color: Colors.green, size: 28),
                SizedBox(width: 8),
                Text(
                  '75€/month',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),

            // Land details
            DetailItem(
              label: 'location/address', 
              value: 'Gulbahce district, Urla/Izmir',
            ),
            DetailItem(
              label: 'size (m²)', 
              value: '40.000 m²',
            ),
            DetailItem(
              label: 'climate', 
              value: 'Sunny, Windy',
            ),
            DetailItem(
              label: 'owner\'s recommendation', 
              value: 'Olive, Lemon',
            ),
            SizedBox(height: 24),

            // Offer input field
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
            SizedBox(height: 16),

            // Make an Offer button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle the offer submission logic here
                  String priceOffer = priceController.text;
                  if (priceOffer.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Offer submitted: $priceOffer €/month')),
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
      bottomNavigationBar: NavBar2(), // Assuming you have a NavBar for bottom navigation
    );
  }
}

// Detail item widget to show land details
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
