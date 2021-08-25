import 'package:esouq/Tools/AppImages.dart';
import 'package:esouq/themes/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main_change_password.dart';
import 'main_settings_app_widgets.dart';

class AccountSettingsScreen extends StatefulWidget {
  static String tag = '/AccountSettingsScreen';

  @override
  AccountSettingsScreenState createState() => AccountSettingsScreenState();
}

class AccountSettingsScreenState extends State<AccountSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appLayout_background,
      appBar: appBarLayout(context, "Account Settings"),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            subType(context, "Change Password", () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangePasswordScreen()));
            }, ic_password),
            subType(context, "Video Quality", () {}, ic_video),
            subType(context, "Download Settings", () {}, ic_download),
          ],
        ),
      ),
    );
  }
}
