import 'package:flutter/material.dart';
import 'navbar.dart'; // Import the navigation bar
import 'LandDetailsPage.dart'; // Import LandDetailPage

class BrowseAgriLandsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LandListPage(),
    );
  }
}

class LandListPage extends StatelessWidget {
  final List<Map<String, dynamic>> lands = [
    {
      'location': 'urla/izmir',
      'uploadDate': '17.08.2024',
      'size': '40.000 m2',
      'price': '75€/month',
    },
    {
      'location': 'urla/izmir',
      'uploadDate': '17.08.2024',
      'size': '40.000 m2',
      'price': '75€/month',
    },
    {
      'location': 'urla/izmir',
      'uploadDate': '17.08.2024',
      'size': '40.000 m2',
      'price': '75€/month',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF6BBE92),
        title: Text('Lands'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: lands.length,
        itemBuilder: (context, index) {
          final land = lands[index];
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/land_image.png'),
                    ),
                    title: Text(
                      'Location: ${land['location']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Upload Date: ${land['uploadDate']}'),
                        Text('Size: ${land['size']}'),
                      ],
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          land['price'],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0, bottom: 10.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to the LandDetailPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LandDetailsPage()),
                          );
                        },
                        child: Text('See Details'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: NavBar(), // Use the navbar from navbar.dart
    );
  }
}
