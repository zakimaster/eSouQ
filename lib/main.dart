import 'package:esouq/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bubble Bottom Bar Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Bubble Bottom Bar Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex=0;

  Widget changePage(int? current) {
    if(current==0){
      return HomeScreen();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Nav Bar")),
      body: changePage(_currentIndex),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => changePage(index));
        },
        items: BBItems,
      ),
    );
  }

  List<BottomNavyBarItem> BBItems=[
    BottomNavyBarItem(
        title: Text('Item One'),
        icon: Icon(Icons.home)
    ),
    BottomNavyBarItem(
        title: Text('Item Two'),
        icon: Icon(Icons.apps)
    ),
    BottomNavyBarItem(
        title: Text('Item Three'),
        icon: Icon(Icons.chat_bubble)
    ),
    BottomNavyBarItem(
        title: Text('Item Four'),
        icon: Icon(Icons.settings)
    ),
  ];


}



