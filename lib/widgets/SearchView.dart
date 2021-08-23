
import 'package:esouq/Screens/SearchScreen.dart';
import 'package:esouq/themes/Theme.dart';
import 'package:esouq/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class SearchBar extends StatelessWidget {

  String searchText = '';

  Widget _icon(IconData icon, {Color color = iconColorPrimary}) {
    Color BackColor = Colors.white;
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            color: BackColor),
        child: GestureDetector(
          onTap: (){},
          child:Icon(
            icon,
            color: color,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.075),
            offset: Offset(0.0, 1.0),
            blurRadius: 10.0,
          )
        ],
      ),
      child: Row( children: <Widget>[
    Expanded( child :TextFormField(
        decoration: InputDecoration(
          icon: Icon(Icons.search_outlined),
          hintText: 'Search products...',
          hintStyle: TextStyle(
            color: Colors.black26,
            fontSize: 14.0,
          ),
          border: InputBorder.none,
        ),keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
        onChanged: (String searchTxt) {
          searchText = searchTxt;
          if (searchTxt == '') {
            hideKeyboard(context);
          }
          //setState(() {});
        }
      ).onTap(() {
      SearchScreen().launch(context);
    })),
    SizedBox(width: 20),
    _icon(Icons.camera_alt_outlined, color: Colors.black26)]));

  }
}