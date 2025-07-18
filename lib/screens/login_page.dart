import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'home_screen.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => _showForgotPasswordDialog(context),
                child: Text('Forgot Password?'),
              ),
            ),
            SizedBox(height: 20),
            MaterialButton(
              minWidth: double.infinity,
              height: 50,
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text("Login", style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: Text("Don't have an account? Sign up"),
            ),
          ],
        ),
      ),
    );
  }

  void _showForgotPasswordDialog(BuildContext context) {
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Reset Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Enter your email to receive a password reset link'),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              final email = emailController.text.trim();
              if (email.isNotEmpty) {
                // Implement Firebase password reset here
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Reset link sent to $email')));
                Navigator.pop(context);
              }
            },
            child: Text('Send Link'),
          ),
        ],
      ),
    );
  }
}