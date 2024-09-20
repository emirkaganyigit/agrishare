import 'package:agrishare/pages/navbar2.dart';
import 'package:flutter/material.dart';



class Offers2Screen extends StatefulWidget {
  @override
  _OffersScreenState createState() => _OffersScreenState();
}

class _OffersScreenState extends State<Offers2Screen> {
  final List<Map<String, dynamic>> offers = [
    {
      'name': 'Emir Kagan Yigit',
      'price': '75€/month',
    },
    {
      'name': 'Arif Aydar',
      'price': '80€/month',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offers'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Land image
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset('assets/land_placeholder.png', fit: BoxFit.cover),
            ),
            SizedBox(height: 8),
            Text(
              'Land Title',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // List of offers
            Expanded(
              child: ListView.builder(
                itemCount: offers.length,
                itemBuilder: (context, index) {
                  return OfferCard(
                    name: offers[index]['name'],
                    price: offers[index]['price'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar2()
    );
  }
}

class OfferCard extends StatelessWidget {
  final String name;
  final String price;

  OfferCard({required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Profile picture placeholder
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.green,
              child: Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: 16),
            // Offer details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "$name's offer",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.euro, color: Colors.green),
                      SizedBox(width: 4),
                      Text(
                        price,
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            // Buttons for Contact, Refuse, Accept
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle contact logic
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Contact button color
                  ),
                  child: Text('Contact'),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle refuse logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red, // Refuse button color
                      ),
                      child: Text('Refuse'),
                    ),
                    SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Handle accept logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Accept button color
                      ),
                      child: Text('Accept'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
