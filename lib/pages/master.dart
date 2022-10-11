import 'package:final_project/pages/daftar_nasabah.dart';
import 'package:final_project/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:final_project/pages/home.dart';
import 'package:final_project/data/my_colors.dart';

class MyMaster extends StatefulWidget {
  const MyMaster({super.key});

  @override
  State<MyMaster> createState() => _MyMasterState();
}

class _MyMasterState extends State<MyMaster> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    DaftarNasabah(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Marketing', style: TextStyle(),textAlign:TextAlign.start, maxLines:2),
      //   automaticallyImplyLeading: false),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: 'Bookmark',
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: MyColors.primaryDark,
        onTap: _onItemTapped,
      ),
      
    );
  }
}