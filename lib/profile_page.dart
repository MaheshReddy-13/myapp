import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ94Z7NcWmhfePhm1xrbCU3bkq8zylejFxrBw&s',
                ),
              ),
            ),
            SizedBox(height: 20),
            buildProfileInfo('KitchenKrate', Icons.person),
            buildProfileInfo('User ID: 8974561', Icons.badge),
            buildProfileInfo('Phone: 9876543210', Icons.phone),
            buildProfileInfo('Email: KitchenKrateenterprises@gmail.com', Icons.email),
            buildProfileInfo('Address: One Town ,Kothapeta,Vijayawada,NTR.Dt,AP-520001', Icons.location_on),
          ],
        ),
      ),
    );
  }

  Widget buildProfileInfo(String info, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 24,
            color: Colors.grey[600],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              info,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[600],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
