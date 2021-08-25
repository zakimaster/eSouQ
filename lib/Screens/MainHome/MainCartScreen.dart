import 'package:esouq/Models/AppData.dart';
import 'package:esouq/Models/CartListModel.dart';
import 'package:esouq/themes/colors.dart';
import 'package:esouq/widgets/GeneraleWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/cupertino.dart';

import '../../main.dart';
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

    Widget checkOutBtn() {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        decoration:
            boxDecorationRoundedWithShadow(8, backgroundColor: appDarkRed),
        child: Text('Checkout', style: boldTextStyle(color: white)),
      ).onTap(() {
        //DTOrderSummaryScreen(getCartProducts()).launch(context);
      });
    }

    Widget mobileWidget() {
      return SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MainCartListView(mIsEditable: true, isOrderSummary: true),
            Center(child: checkOutBtn()),
          ],
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
