import 'package:buisness/screens/mainApp/homePage.dart';
import 'package:flutter/material.dart';

class naveBar extends StatefulWidget {
  const naveBar({super.key});

  @override
  State<naveBar> createState() => _naveBarState();
}

class _naveBarState extends State<naveBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    homePage(),
    Text(
      'Basket',
      style: optionStyle,
    ),
    Text(
      'Extra',
      style: optionStyle,
    ),
    Text(
      'Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor:Colors.grey,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined,color: Colors.grey),
            activeIcon:Icon(Icons.home_outlined,color: Colors.green),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined,color: Colors.grey),
            activeIcon:Icon(Icons.shopping_bag_outlined,color: Colors.green),
            label: 'Basket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.extension_outlined,color: Colors.grey),
            activeIcon:Icon(Icons.extension_outlined,color: Colors.green),
            label: 'Extra',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined,color: Colors.grey,),
            activeIcon:Icon(Icons.settings_outlined,color: Colors.green),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
      ),
    );
  }
}
