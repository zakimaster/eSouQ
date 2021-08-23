import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:esouq/Screens/MainAccountLoginScreen.dart';
import 'package:esouq/Screens/MainCartScreen.dart';
import 'package:esouq/Screens/MainMessagesScreen.dart';
import 'package:esouq/Screens/MainSettings.dart';
import 'package:flutter/material.dart';

import 'Home.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;

  final _screens = [
    Home(),
    MainCartList(),
    MainMessages(),
    MainAccountLogin(),
    MainSettings(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          body: Container(
            //margin: EdgeInsets.only(bottom: 45),
              child:ListView(
                  scrollDirection: Axis.vertical,
                  children : _screens
                      .asMap()
                      .map((i, screen) => MapEntry(
                    i,
                    Offstage(
                      offstage: _selectedIndex != i,
                      child: screen,
                    ),
                  )).values
                      .toList()
              )),bottomNavigationBar: BottomNavyBar(
          backgroundColor: Colors.white,
          selectedIndex: _selectedIndex,
          onItemSelected: (i) => setState(() => _selectedIndex = i),
          items: BBItems,
        ),
        ));
  }


  List<BottomNavyBarItem> BBItems=[
    BottomNavyBarItem(
        title: Text('Home'),
        icon: Icon(Icons.home_outlined),
      inactiveColor: Colors.grey,
      activeColor: Colors.red
    ),
    BottomNavyBarItem(
        title: Text('Cart'),
        icon: Icon(Icons.shopping_cart_outlined),
        inactiveColor: Colors.grey,
        activeColor: Colors.red
    ),
    BottomNavyBarItem(
        title: Text('Messages'),
        icon: Icon(Icons.chat_bubble_outline_rounded),
        inactiveColor: Colors.grey,
        activeColor: Colors.red
    ),
    BottomNavyBarItem(
        title: Text('Account'),
        icon: Icon(Icons.account_circle_outlined),
        inactiveColor: Colors.grey,
        activeColor: Colors.red
    ),
    BottomNavyBarItem(
        title: Text('Settings'),
        icon: Icon(Icons.settings_outlined),
        inactiveColor: Colors.grey,
        activeColor: Colors.red
    ),
  ];
}
