import 'package:flutter/material.dart';
import 'Components/bubble_bottom_bar.dart';

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
  late int currentIndex;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ), //border radius doesn't work when the notch is enabled.
        elevation: 8,
        tilesPadding: EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        items: items,
      ),
    );
  }




  List<BubbleBottomBarItem> items = [
      BubbleBottomBarItem(
        showBadge: true,
        badge: Text("5"),
        badgeColor: Colors.deepPurpleAccent,
        backgroundColor: Colors.red,
        icon: Icon(
          Icons.dashboard,
          color: Colors.black,
        ),
        activeIcon: Icon(
          Icons.dashboard,
          color: Colors.red,
        ),
        title: Text("Home"),
      ),
      BubbleBottomBarItem(
          backgroundColor: Colors.deepPurple,
          icon: Icon(
            Icons.shopping_cart_rounded,
            color: Colors.black,
          ),
          activeIcon: Icon(
            Icons.shopping_cart_rounded,
            color: Colors.deepPurple,
          ),
          title: Text("Cart")),
      BubbleBottomBarItem(
          backgroundColor: Colors.indigo,
          icon: Icon(
            Icons.message,
            color: Colors.black,
          ),
          activeIcon: Icon(
            Icons.message,
            color: Colors.indigo,
          ),
          title: Text("Messages")),
      BubbleBottomBarItem(
          backgroundColor: Colors.green,
          icon: Icon(
            Icons.account_circle,
            color: Colors.black,
          ),
          activeIcon: Icon(
            Icons.account_circle,
            color: Colors.green,
          ),
          title: Text("Account")),
    BubbleBottomBarItem(
        backgroundColor: Colors.green,
        icon: Icon(
          Icons.more_vert,
          color: Colors.black,
        ),
        activeIcon: Icon(
          Icons.more_vert,
          color: Colors.green,
        ),
        title: Text("Setting"))


  ];

}



