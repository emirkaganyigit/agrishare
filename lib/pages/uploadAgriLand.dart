import 'package:flutter/material.dart';
import 'dart:io'; // For file handling
import 'package:image_picker/image_picker.dart'; // For image picking
import 'navbar2.dart'; // Import the navbar2.dart file

class UploadLandScreen extends StatefulWidget {
  @override
  _UploadLandScreenState createState() => _UploadLandScreenState();
}

class _UploadLandScreenState extends State<UploadLandScreen> {
  final _formKey = GlobalKey<FormState>();
  File? _image; // For storing the selected image
  final picker = ImagePicker();

  // Form fields controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController climateController = TextEditingController();
  TextEditingController productsController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  Future<void> _pickImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _onNavBarTap(int index) {
    // Handle navigation when a bottom navigation item is tapped
    // You can add navigation logic here depending on which screen to go to.
    setState(() {
      // Change the state of the current screen if necessary.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Land'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Image upload section
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _image == null
                      ? Center(child: Text('Upload your land picture here'))
                      : Image.file(_image!, fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 16),

              // Name input
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Enter your name here'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Title input
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Enter your ad title here'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the ad title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Location input
              TextFormField(
                controller: locationController,
                decoration: InputDecoration(labelText: 'Enter land\'s location'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the location';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Land size input
              TextFormField(
                controller: sizeController,
                decoration: InputDecoration(labelText: 'Enter land\'s size'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the size';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Climate input
              TextFormField(
                controller: climateController,
                decoration: InputDecoration(labelText: 'Enter climate'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the climate';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Recommended products input
              TextFormField(
                controller: productsController,
                decoration: InputDecoration(labelText: 'Enter recommended products'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter recommended products';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Price input
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Enter your price'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the price';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),

              // Submit button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle form submission
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Submitting your land listing')),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar2(),
    );
  }
}
