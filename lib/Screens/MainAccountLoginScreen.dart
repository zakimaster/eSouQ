
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainAccountLogin extends StatefulWidget{
  @override
  _MainAccountLoginState createState() => _MainAccountLoginState();
}

class _MainAccountLoginState extends State<MainAccountLogin> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.storefront_outlined,color: Colors.black45,size: 40,),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(CircleBorder()),
            padding: MaterialStateProperty.all(EdgeInsets.all(20)),
            backgroundColor: MaterialStateProperty.all(Colors.white), // <-- Button color
            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.pressed)) return Colors.red; // <-- Splash color
            }),
          ),
        ),SizedBox(width: 15,),ElevatedButton(
          onPressed: () {},
          child: Icon(Icons.account_circle_outlined,color: Colors.black45,size: 40,),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(CircleBorder()),
            padding: MaterialStateProperty.all(EdgeInsets.all(20)),
            backgroundColor: MaterialStateProperty.all(Colors.white), // <-- Button color
            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.pressed)) return Colors.red; // <-- Splash color
            }),
          ),
        )

      ],),SizedBox(height: 15,),ElevatedButton(
        onPressed: () {},
        child: Icon(Icons.delivery_dining,color: Colors.black45,size: 40,),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(CircleBorder()),
          padding: MaterialStateProperty.all(EdgeInsets.all(20)),
          backgroundColor: MaterialStateProperty.all(Colors.white), // <-- Button color
          overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
            if (states.contains(MaterialState.pressed)) return Colors.red; // <-- Splash color
          }),
        ),
      ),



    ],);


  }
}