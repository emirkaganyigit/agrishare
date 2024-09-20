import 'package:flutter/material.dart';
import 'package:agrishare/pages/CreateRequestScreen.dart'; // Import CreateRequestScreen
import 'package:agrishare/pages/BrowseAgriLands.dart'; // Import BrowseAgriLands
import 'package:agrishare/pages/EntrepreneurMain.dart'; // Import EntrepreneurMain
import 'package:agrishare/pages/Contact.dart'; // Import Contact
import 'package:agrishare/pages/offers1.dart'; // Import Offers1

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.upload), label: 'Upload'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Agri-Lands'),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
        BottomNavigationBarItem(icon: Icon(Icons.local_offer), label: 'Offers'),
      ],
      onTap: (index) {
        // Handle navigation based on the selected item.
        switch (index) {
          case 0:
            Navigator.push(context, MaterialPageRoute(builder: (context) => CreateRequestPage()));
            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) => BrowseAgriLandsPage()));
            break;
          case 2:
            Navigator.push(context, MaterialPageRoute(builder: (context) => EntrepreneurMainScreen()));
            break;
          case 3:
            Navigator.push(context, MaterialPageRoute(builder: (context) => ContactPage()));
            break;
          case 4:
            Navigator.push(context, MaterialPageRoute(builder: (context) => ViewOffersPage()));
            break;
        }
      },
    );
  }
}
