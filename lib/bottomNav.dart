import 'package:flutter/material.dart';
import 'package:tggd/profile.dart';
import 'package:tggd/home.dart';

class BottomNav extends StatefulWidget {
  static const routeName = '/bottomNav';

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<BottomNav> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Home(size: null,),
    Profile(),
  ];
  void _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('TGGD First Aid'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onTapItem,
      ),
    );
  }
}
