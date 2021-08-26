import 'package:esouq/Models/AppData.dart';
import 'package:esouq/Models/CartListModel.dart';
import 'package:esouq/themes/colors.dart';
import 'package:esouq/widgets/GeneraleWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class MainCartListView extends StatefulWidget {
  static String tag = '/MainCartListView';

  bool? mIsEditable;
  bool? isOrderSummary;

  MainCartListView({this.mIsEditable, this.isOrderSummary});

  @override
  MainCartListViewState createState() => MainCartListViewState();
}

class MainCartListViewState extends State<MainCartListView> {
  List<CartListModel> data = AppData.cartList;

  int subTotal = 0;
  int totalAmount = 0;
  int shippingCharges = 0;
  int mainCount = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    calculate();
  }

  calculate() async {
    subTotal = 0;
    shippingCharges = 0;
    totalAmount = 0;

    data.forEach((element) {
      subTotal += ((element.discountPrice.toInt() ?? element.price.toInt()) *
          element.quantity);
    });

    shippingCharges = (subTotal * 10).toInt() ~/ 100;
    totalAmount = subTotal + shippingCharges;

    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Widget itemCart(CartListModel data) {
      return Container(
        decoration: boxDecorationRoundedWithShadow(8,
            backgroundColor: appStore.appBarColor!),
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.asset(
                data.image,
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ).cornerRadiusWithClipRRect(8),
            ),
            12.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(data.name,
                    style: primaryTextStyle(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                4.height,
                Row(
                  children: [
                    priceWidget(data.discountPrice.toInt()),
                    8.width,
                    priceWidget(data.price.toInt(), applyStrike: true),
                  ],
                ),
                8.height,
                Container(
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.circular(4),
                    backgroundColor: appColorPrimaryDark,
                  ),
                  padding: EdgeInsets.all(4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.remove, color: whiteColor).onTap(() {
                        var qty = data.quantity;
                        if (qty <= 1) return;
                        var q = qty - 1;
                        data.quantity = q;

                        calculate();
                      }),
                      6.width,
                      Text(data.quantity.toString(),
                          style: boldTextStyle(color: whiteColor)),
                      6.width,
                      Icon(Icons.add, color: whiteColor).onTap(() {
                        mainCount = data.quantity + 1;
                        data.quantity = mainCount;

                        calculate();
                      }),
                    ],
                  ),
                ).visible(widget.mIsEditable.validate(value: true)),
              ],
            ).expand(),
          ],
        ),
      );
    }

    Widget cartItemList() {
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (_, i) => itemCart(data[i]).onTap(() {
          // DTProductDetailScreen(productModel: data1).launch(context);
        }),
        shrinkWrap: true,
        //primary: false,
        physics: NeverScrollableScrollPhysics(),
      );
    }

    return ContainerX(
      mobile: Column(
        children: [
          totalItemCountWidget(data.length),
          SingleChildScrollView(child: cartItemList()),
          20.height,
          totalAmountWidget(subTotal, shippingCharges, totalAmount),
        ],
      ),
      web: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(8),
            child: SingleChildScrollView(child: cartItemList()),
          ).expand(flex: 60),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(8),
            decoration: boxDecoration(
                showShadow: true, bgColor: appStore.scaffoldBackground),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                totalAmountWidget(subTotal, shippingCharges, totalAmount)
                    .visible(widget.mIsEditable!),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(12),
                  decoration: boxDecorationRoundedWithShadow(8,
                      backgroundColor: appColorPrimary),
                  child: Text('Checkout', style: boldTextStyle(color: white)),
                ).onTap(() {
                  //DTOrderSummaryScreen(data).launch(context);
                }).visible(widget.mIsEditable!),
              ],
            ),
          ).expand(flex: 40).visible(!widget.isOrderSummary!),
        ],
      ),
    );
  }
}
