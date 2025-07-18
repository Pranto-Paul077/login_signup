import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Home Screen!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              color: Colors.blue,
              child: Text('Logout', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}