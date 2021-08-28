import 'dart:async';

import 'package:esouq/Models/AddressListModel.dart';
import 'package:esouq/Models/ProductModel.dart';
import 'package:esouq/Tools/AppConstants.dart';
import 'package:esouq/Tools/AppExtension.dart';
import 'package:esouq/Tools/AppSizes.dart';
import 'package:esouq/Tools/AppStrings.dart';
import 'package:esouq/themes/colors.dart';
import 'package:esouq/widgets/GeneraleWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'AddressManagerScreen.dart';
import 'CartPaymentScreen.dart';

class CheckoutSummaryScreen extends StatefulWidget {
  static String tag = '/CheckoutSummaryScreen';

  @override
  CheckoutSummaryScreenState createState() => CheckoutSummaryScreenState();
}

class CheckoutSummaryScreenState extends State<CheckoutSummaryScreen> {
  List<Product> list = [];
  List<AddressModel> addressList = [];
  var selectedPosition = 0;
  List<String> images = [];
  var currentIndex = 0;
  Timer? timer;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var products = await loadCartProducts();
    var addresses = await loadAddresses();
    var banner = await loadBanners();
    setState(() {
      list.clear();
      list.addAll(products);
      addressList.clear();
      addressList.addAll(addresses);
      images.clear();
      images.addAll(banner);
      isLoaded = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    if (timer != null) {
      timer!.cancel();
    }
  }

  void startTimer() {
    if (timer != null) {
      return;
    }
    timer = new Timer.periodic(new Duration(seconds: 5), (time) {
      setState(() {
        if (currentIndex == images.length - 1) {
          currentIndex = 0;
        } else {
          currentIndex = currentIndex + 1;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    var cartList = isLoaded
        ? ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: list.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: spacing_standard_new),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                color: appLayout_background,
                margin: EdgeInsets.only(
                    left: spacing_standard_new,
                    right: spacing_standard_new,
                    top: spacing_standard_new),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image.asset(
                        "assets/shophop/img/products" +
                            list[index].images![0].src!,
                        width: width * 0.25,
                        height: width * 0.3,
                        fit: BoxFit.fill,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: spacing_standard,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: text(list[index].name,
                                        textColor: textPrimaryColor,
                                        fontSize: ts_medium_large,
                                        fontFamily: font_medium),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 16.0, top: spacing_control),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.black),
                                          padding: EdgeInsets.all(
                                              spacing_control_half),
                                          child: Icon(
                                            Icons.done,
                                            color: appWhite,
                                            size: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          width: spacing_standard,
                                        ),
                                        text("M",
                                            textColor: textPrimaryColor,
                                            fontSize: ts_medium),
                                        SizedBox(
                                          width: spacing_standard,
                                        ),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              spacing_standard,
                                              1,
                                              spacing_standard,
                                              1),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: appLayout_background,
                                                  width: 1)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              text("Qty: 5",
                                                  textColor: textPrimaryColor,
                                                  fontSize: ts_medium),
                                              Icon(
                                                Icons.arrow_drop_down,
                                                color: textPrimaryColor,
                                                size: 16,
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: <Widget>[
                                        text(
                                            list[index].on_sale!
                                                ? list[index]
                                                    .sale_price
                                                    .toString()
                                                    .toCurrencyFormat()
                                                : list[index]
                                                    .price
                                                    .toString()
                                                    .toCurrencyFormat(),
                                            textColor: appColorPrimary,
                                            fontSize: ts_normal,
                                            fontFamily: font_medium),
                                        SizedBox(
                                          width: spacing_control,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 3.0),
                                          child: Text(
                                            list[index]
                                                .regular_price
                                                .toString()
                                                .toCurrencyFormat()!,
                                            style: TextStyle(
                                                color: appTextColorSecondary,
                                                fontFamily: font_regular,
                                                fontSize: ts_medium,
                                                decoration:
                                                    TextDecoration.lineThrough),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
              // return Chats(mListings[index], index);
            })
        : Container();
    var paymentDetail = Container(
      margin: EdgeInsets.fromLTRB(spacing_standard_new, spacing_standard_new,
          spacing_standard_new, spacing_standard_new),
      decoration: BoxDecoration(
          border: Border.all(color: appLayout_background, width: 1.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(spacing_standard_new,
                spacing_middle, spacing_standard_new, spacing_middle),
            child: text(lbl_payment_details,
                textColor: textPrimaryColor,
                fontSize: ts_medium_large,
                fontFamily: font_medium),
          ),
          Divider(
            height: 1,
            color: appLayout_background,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(spacing_standard_new,
                spacing_middle, spacing_standard_new, spacing_middle),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    text(lbl_offer),
                    text(text_offer_not_available,
                        textColor: textPrimaryColor, fontFamily: font_medium),
                  ],
                ),
                SizedBox(
                  height: spacing_standard,
                ),
                Row(
                  children: <Widget>[
                    text(lbl_shipping_charge),
                    text(lbl_free,
                        textColor: Colors.green, fontFamily: font_medium),
                  ],
                ),
                SizedBox(
                  height: spacing_standard,
                ),
                Row(
                  children: <Widget>[
                    text(lbl_total_amount),
                    text("\$70",
                        textColor: appColorPrimary,
                        fontFamily: font_bold,
                        fontSize: ts_medium_large),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
    var address = Container(
      width: double.infinity,
      color: appWhite,
      padding: EdgeInsets.all(spacing_standard_new),
      margin: EdgeInsets.all(spacing_standard_new),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          text(
              addressList[selectedPosition].first_name! +
                  " " +
                  addressList[selectedPosition].last_name!,
              textColor: textPrimaryColor,
              fontFamily: font_medium,
              fontSize: ts_medium_large),
          text(addressList[selectedPosition].address,
              textColor: textPrimaryColor, fontSize: ts_medium),
          text(
              addressList[selectedPosition].city! +
                  "," +
                  addressList[selectedPosition].state!,
              textColor: textPrimaryColor,
              fontSize: ts_medium),
          text(
              addressList[selectedPosition].country! +
                  "," +
                  addressList[selectedPosition].pinCode!,
              textColor: textPrimaryColor,
              fontSize: ts_medium),
          SizedBox(
            height: spacing_standard_new,
          ),
          text(addressList[selectedPosition].phone_number,
              textColor: textPrimaryColor, fontSize: ts_medium),
          SizedBox(
            height: spacing_standard_new,
          ),
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
              padding: EdgeInsets.all(spacing_standard),
              child: text(lbl_change_address,
                  fontSize: ts_medium,
                  fontFamily: font_medium,
                  textColor: appWhite),
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(40.0),
                  side: BorderSide(color: appColorPrimary, width: 1)),
              color: appColorPrimary,
              onPressed: () async {
                var pos = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AddressManagerScreen())) ??
                    selectedPosition;
                setState(() {
                  selectedPosition = pos;
                });
              },
            ),
          )
        ],
      ),
    );
    var bottomButtons = Container(
      height: 60,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: appShadowColor,
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
                    textColor: textPrimaryColor,
                    fontFamily: font_bold,
                    fontSize: ts_medium_large),
                text(lbl_see_price_detail),
              ],
            ),
          ),
          Expanded(
            child: InkWell(
              child: Container(
                child: text(lbl_continue,
                    textColor: appWhite,
                    fontSize: ts_medium_large,
                    fontFamily: font_medium),
                color: appColorPrimary,
                alignment: Alignment.center,
                height: double.infinity,
              ),
              onTap: () {
                CartPaymentScreen().launch(context);
              },
            ),
          )
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appWhite,
        title: text(order_summary,
            textColor: textPrimaryColor,
            fontSize: ts_normal,
            fontFamily: font_medium),
        iconTheme: IconThemeData(color: textPrimaryColor),
      ),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 70.0),
              child: Column(
                children: <Widget>[
                  isLoaded ? address : Container(),
                  cartList,
                  paymentDetail,
                ],
              ),
            ),
          ),
          Container(
            color: appWhite,
            child: bottomButtons,
          )
        ],
      ),
    );
  }
}
