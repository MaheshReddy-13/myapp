import 'package:flutter/material.dart';
import 'home_page.dart';
import 'orders_page.dart';
import 'profile_page.dart';
import 'widgets/bottom_nav_bar.dart';
import 'widgets/app_bar.dart';
import '../models/product.dart';
import 'cart_page.dart';  // Add this import to include CartPage

void main() => runApp(MyStoreApp());

class MyStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyStore',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Product> _cartItems = [];

  void _addProductToCart(Product product) {
    setState(() {
      _cartItems.add(product);
    });
  }

  void _removeProductFromCart(Product product) {
    setState(() {
      _cartItems.remove(product);
    });
  }

  static List<Widget> _pages = <Widget>[
    OrdersPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pagesWithCart = [
      HomePage(onAddToCart: _addProductToCart),
      OrdersPage(),
      ProfilePage(),
    ];

    return Scaffold(
      appBar: CustomAppBar(
        cartItems: _cartItems,
        onRemove: _removeProductFromCart,
      ),
      body: pagesWithCart[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
