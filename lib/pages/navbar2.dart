import 'package:agrishare/pages/BrowseRequests.dart';
import 'package:agrishare/pages/LandownerMain.dart';
import 'package:agrishare/pages/offers2.dart';
import 'package:flutter/material.dart';
import 'package:agrishare/pages/uploadAgriLand.dart'; // Import CreateRequestScreen
import 'package:agrishare/pages/Contact2.dart'; // Import Contact

class NavBar2 extends StatelessWidget {
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
            Navigator.push(context, MaterialPageRoute(builder: (context) => UploadLandScreen()));
            break;
          case 1:
            Navigator.push(context, MaterialPageRoute(builder: (context) => RequestsScreen()));
            break;
          case 2:
            Navigator.push(context, MaterialPageRoute(builder: (context) => LandOwnerMainPage()));
            break;
          case 3:
            Navigator.push(context, MaterialPageRoute(builder: (context) => Contact2Page()));
            break;
          case 4:
            Navigator.push(context, MaterialPageRoute(builder: (context) => Offers2Screen()));
            break;
        }
      },
    );
  }
}
