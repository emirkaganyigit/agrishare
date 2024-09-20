import 'package:agrishare/pages/LandDetailsPage.dart';
import 'package:agrishare/pages/RequestDetail.dart';
import 'package:agrishare/pages/navbar2.dart';
import 'package:flutter/material.dart';

class RequestsScreen extends StatefulWidget {
  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  final List<Map<String, dynamic>> requests = [
    {
      'name': 'Erinc Turkkan',
      'products': 'Potato, Corn',
      'size': '20,000-50,000m²',
      'price': '45-70€/month',
    },
    {
      'name': 'Erinc Turkkan',
      'products': 'Potato, Corn',
      'size': '20,000-50,000m²',
      'price': '45-70€/month',
    },
    {
      'name': 'Erinc Turkkan',
      'products': 'Potato, Corn',
      'size': '20,000-50,000m²',
      'price': '45-70€/month',
    },
  ];

  int currentPage = 1;

  void _onNavBarTap(int index) {
    // Handle navigation between screens based on the tapped index
    setState(() {
      // You can implement navigation logic here depending on index value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Requests'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: DropdownButton<String>(
              underline: SizedBox(),
              icon: Icon(Icons.filter_list, color: Colors.white),
              items: <String>['Filter 1', 'Filter 2', 'Filter 3'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {
                // Implement filter logic here
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: requests.length,
                itemBuilder: (context, index) {
                  return RequestCard(
                    name: requests[index]['name'],
                    products: requests[index]['products'],
                    size: requests[index]['size'],
                    price: requests[index]['price'],
                  );
                },
              ),
            ),
            // Pagination
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_left),
                  onPressed: () {
                    setState(() {
                      if (currentPage > 1) {
                        currentPage--;
                      }
                    });
                  },
                ),
                Text('$currentPage'),
                IconButton(
                  icon: Icon(Icons.arrow_right),
                  onPressed: () {
                    setState(() {
                      currentPage++;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavBar2(),
    );
  }
}

class RequestCard extends StatelessWidget {
  final String name;
  final String products;
  final String size;
  final String price;

  RequestCard({required this.name, required this.products, required this.size, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile icon placeholder
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.green,
              child: Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: 16),
            // Request details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Target products: $products'),
                  Text('Required size: $size'),
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
            // "See Details" button
            ElevatedButton(
              onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RequestDetailsScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              child: Text('See Details'),
            ),
          ],
        ),
      ),
    );
  }
}
