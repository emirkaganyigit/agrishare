import 'package:agrishare/pages/Contact.dart';
import 'package:agrishare/pages/makeOffer2.dart';
import 'package:agrishare/pages/navbar2.dart';
import 'package:flutter/material.dart';
import 'navbar.dart'; // Importing the navbar.dart

class LandDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6BBE92),
        title: Text('Agri-Land Details'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Add menu functionality if necessary
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Image placeholder for agri-land image
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/land_image.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                '75€/month',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Land details section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDetailCard('Location/Address', 'gulbahce district\nurla/izmir'),
                _buildDetailCard('Size (m2)', '40.000 m2'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildDetailCard('Climate', 'sunny\nwindy'),
                _buildDetailCard('Owner\'s Recommendation', 'olive\nlemon'),
              ],
            ),
            SizedBox(height: 20),
            // Contact and Make an Offer buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPage()));

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6BBE92),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('Contact'),
                ),
                ElevatedButton(
                  onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MakeOffer2Screen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text('Make an Offer'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar2(), // Use the navbar from navbar.dart
    );
  }

  Widget _buildDetailCard(String title, String value) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(value, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
