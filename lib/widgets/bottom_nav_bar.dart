import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavBar({required this.selectedIndex, required this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900], // Dark background color for the bottom navigation bar
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 125, 221, 16).withOpacity(0.3),
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),  // Set selected item color to blue
        unselectedItemColor: const Color.fromARGB(255, 71, 72, 73),  // Set unselected item color to a lighter blue
        onTap: onItemTapped,
        backgroundColor: Color.fromARGB(220, 59, 240, 3), // Transparent background for BottomNavigationBar
        type: BottomNavigationBarType.fixed, // Ensure icons are always visible (even with more than 3 items)
      ),
    );
  }
}
