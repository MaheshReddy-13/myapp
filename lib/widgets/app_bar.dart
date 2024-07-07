import 'package:flutter/material.dart';
import 'package:myapp/cart_page.dart';
import 'package:myapp/profile_page.dart';
import 'package:myapp/widgets/search_page.dart';
import 'package:myapp/login_page.dart';
import 'package:myapp/models/product.dart'; // Import your Product model

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Product> cartItems; // Add cartItems
  final Function(Product) onRemove; // Add onRemove

  const CustomAppBar({Key? key, required this.cartItems, required this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Kitchen Groceries'),
      backgroundColor: const Color.fromARGB(255, 126, 240, 19),  // Set the AppBar color to green
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(
                  cartItems: cartItems,
                  onRemove: onRemove,
                ),
              ),
            );
          },
        ),
        PopupMenuButton<String>(
          onSelected: (String result) {
            if (result == 'Profile') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            } else if (result == 'Settings') {
              // Implement settings functionality
            } else if (result == 'Login') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            } else if (result == 'Logout') {
              // Implement logout functionality
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            const PopupMenuItem<String>(
              value: 'Profile',
              child: Text('Profile'),
            ),
            const PopupMenuItem<String>(
              value: 'Settings',
              child: Text('Settings'),
            ),
            const PopupMenuItem<String>(
              value: 'Logout',
              child: Text('Logout'),
            ),
            const PopupMenuItem<String>(
              value: 'Login',
              child: Text('Login'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
