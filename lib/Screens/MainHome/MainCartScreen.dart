import 'package:esouq/Tools/AppConstants.dart';
import 'package:esouq/Tools/AppSizes.dart';
import 'package:esouq/Tools/AppStrings.dart';
import 'package:esouq/themes/colors.dart';
import 'package:esouq/widgets/GeneraleWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';
import 'MainCartListView.dart';

class MainCartList extends StatefulWidget {
  @override
  _MainCartListState createState() => _MainCartListState();
}

class _MainCartListState extends State<MainCartList> {
  @override
  void initState() {
    super.initState();
    // init();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var bottomButtons = Container(
      height: 65,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: shadowColorGlobal,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 3))
      ], color: appWhite),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                text("\$70",
                    textColor: appTextColorPrimary,
                    fontFamily: font_bold,
                    fontSize: ts_medium_large),
                text(lbl_see_price_detail, fontSize: 14.0),
              ],
            ),
          ),
          Expanded(
            child: InkWell(
              child: Container(
                child: text(lbl_continue,
                    textColor: white,
                    fontSize: ts_medium_large,
                    fontFamily: font_medium),
                color: appColorPrimary,
                alignment: Alignment.center,
                height: double.infinity,
              ),
              onTap: () {
                // ShOrderSummaryScreen().launch(context);
              },
            ),
          )
        ],
      ),
    );

    Widget mobileWidget() {
      return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 70.0),
                  child: Column(
                    children: [
                      MainCartListView(mIsEditable: true, isOrderSummary: true),
                      Center(child: bottomButtons),
                    ],
                  ),
                ),
              ),
              Container(
                color: appWhite,
                padding: const EdgeInsets.only(bottom: 60),
                child: bottomButtons,
              )
            ],
          ),
        ),
      );
    }

    Widget webWidget() {
      return MainCartListView(mIsEditable: true, isOrderSummary: false);
    }

    return ContainerX(
      mobile: mobileWidget(),
      web: webWidget(),
      useFullWidth: true,
    );
  }
}
