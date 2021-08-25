import 'package:esouq/Tools/AppConstants.dart';
import 'package:esouq/Tools/AppImages.dart';
import 'package:esouq/Tools/AppSizes.dart';
import 'package:esouq/themes/colors.dart';
import 'package:esouq/widgets/GeneraleWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'MainSettingsScreen/main_edit_profile_screen.dart';
import 'MainSettingsScreen/main_help_screen.dart';
import 'MainSettingsScreen/main_settings_app_widgets.dart';
import 'MainSettingsScreen/main_terms_conditions_screen.dart';
import 'MainSettingsScreen/user_account_settings_screen.dart';

class MainSettings extends StatefulWidget {
  static String tag = '/MainSettings';

  @override
  MainSettingsState createState() => MainSettingsState();
}

class MainSettingsState extends State<MainSettings> {
  var profileImage = "";
  var userName = "";
  var userEmail = "";
  bool? isDarkMode = false;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appLayout_background,
      appBar: AppBar(
        title: toolBarTitle(context, "Settings"),
        backgroundColor: appLayout_background,
        elevation: 0,
        iconTheme: IconThemeData(color: white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            color: appLayout_background,
            padding: EdgeInsets.only(
                left: spacing_standard_new,
                top: spacing_standard_new,
                right: 12,
                bottom: spacing_standard_new),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        ic_avatar,
                        //color: appTextColorPrimary,
                        fit: BoxFit.cover,
                      )),
                ).paddingRight(spacing_standard_new),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      text(userName,
                          fontSize: ts_extra_normal,
                          fontFamily: font_bold,
                          textColor: appTextColorPrimary),
                      text(userEmail,
                          fontSize: ts_normal,
                          fontFamily: font_medium,
                          textColor: appTextColorSecondary)
                    ],
                  ),
                ),
                Image.asset(
                  ic_edit_profile,
                  width: 20,
                  height: 20,
                  color: appColorPrimary,
                ).paddingAll(spacing_control).onTap(() {
                  EditProfileScreen().launch(context);
                })
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  itemSubTitle(context, "General Settings", colorThird: false)
                      .paddingOnly(
                          left: spacing_standard_new,
                          right: spacing_standard_new,
                          top: 12,
                          bottom: 12),
                  subType(context, "Account Settings", () {
                    AccountSettingsScreen().launch(context);
                  }, ic_settings),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        ic_dark_mode,
                        width: 20,
                        height: 20,
                        color: appTextColorThird,
                      ).paddingRight(spacing_standard),
                      Expanded(child: itemTitle(context, "Dark Mode")),
                      Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor: appColorPrimary,
                        ),
                        child: Checkbox(
                          activeColor: appColorPrimary,
                          checkColor: appLayout_background,
                          value: isDarkMode,
                          onChanged: (value) {
                            setState(() {
                              isDarkMode = value;
                            });
                          },
                        ),
                      )
                    ],
                  )
                      .paddingOnly(
                          left: spacing_standard_new,
                          right: spacing_control,
                          top: spacing_control,
                          bottom: spacing_control)
                      .onTap(() {
                    setState(() {
                      isDarkMode = !isDarkMode!;
                    });
                  }),
                  subType(context, "Language", () {}, ic_language),
                  subType(context, "Help", () {
                    HelpScreen().launch(context);
                  }, ic_help),
                  itemSubTitle(context, "Terms").paddingOnly(
                      left: spacing_standard_new,
                      right: 12,
                      top: spacing_standard_new,
                      bottom: spacing_control),
                  subType(context, "Terms & Conditions", () {
                    TermsConditionsScreen().launch(context);
                  }, null),
                  subType(context, "Privacy & Policy", () {
                    TermsConditionsScreen().launch(context);
                  }, null),
                  subType(context, "Logout", () {}, null),
                ],
              ).paddingBottom(spacing_large),
            ),
          )
        ],
      ),
    );
  }

  void getUserData() {
    setState(() {
      profileImage = "assets/user.png";
      userName = "Vicotria Becks";
      userEmail = "vicotriabecks@gmail.com";
    });
  }
}
