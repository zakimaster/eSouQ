import 'package:esouq/Tools/AppImages.dart';
import 'package:esouq/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:nb_utils/src/extensions/widget_extensions.dart';
import 'main_faq_screen.dart';
import 'main_settings_app_widgets.dart';

class HelpScreen extends StatefulWidget {
  static String tag = '/HelpScreen';

  @override
  HelpScreenState createState() => HelpScreenState();
}

class HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appLayout_background,
      appBar: appBarLayout(context, "Help"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            subType(context, "Report Problem", () {}, ic_report),
            subType(context, "Help Center", () {}, ic_help),
            subType(context, "FAQ", () {
              FaqScreen().launch(context);
            }, ic_faq),
          ],
        ),
      ),
    );
  }
}
