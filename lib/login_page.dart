import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3097254127.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3662337478.
        backgroundColor: Colors.blue,
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1054750312.
        centerTitle: true,
// Suggested code may be subject to a license. Learn more: ~LicenseLog:7247817.
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2257516302.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2156993008.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2971792758.
                labelText: 'phonenumber',
                border: OutlineInputBorder(),
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3923105200.
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3505619728.
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Implement login functionality here
              },
              child: Text('Login'),
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2036264590.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3548636760.
            ),
            SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Implement forgot password functionality here
              },
              child: Text('Forgot Password?'),
            ),
          ]
          ),
      ),
    );
  }
}

