import 'package:flutter/material.dart';

class SwitchRolePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Landowner Dashboard'),
      ),
      body: Center(
        child: Text(
          'Welcome, Agricultural Land Owner!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}