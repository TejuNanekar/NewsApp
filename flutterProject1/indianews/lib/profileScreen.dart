import 'package:flutter/material.dart';
import 'package:indianews/homeScreen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_image.png'), // Replace with your profile image asset
            ),
            SizedBox(height: 20),
            Text(
              'Teju Nanekar ', // Replace with the user's name
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'john.doe@example.com', // Replace with the user's email
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic for editing profile
              },
              child: Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
