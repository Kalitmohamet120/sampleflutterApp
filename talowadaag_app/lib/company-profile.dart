import 'package:flutter/material.dart';
import 'dart:async';

class FutureImageAvatar extends StatelessWidget {
  // Simulate fetching an image URL from a network or other async source
  Future<String> _fetchImageUrl() async {
    // Simulate a network delay
    await Future.delayed(Duration(seconds: 2));
    // Return a sample image URL
    return 'https://via.placeholder.com/150'; // Replace with your image source
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Future Image Circle Avatar')),
      body: Center(
        child: FutureBuilder<String>(
          future: _fetchImageUrl(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Show loading indicator while fetching
            } else if (snapshot.hasError) {
              return Icon(Icons.error); // Show error icon if something went wrong
            } else {
              // Load the image into a CircleAvatar when the future completes
              return CircleAvatar(
                radius: 50, // Adjust radius to change size
                backgroundImage: NetworkImage(snapshot.data!), // Load the image
              );
            }
          },
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
// //     home: FutureImageAvatar(),
//   ));
// }
