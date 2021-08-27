import 'package:esouq/Models/PaymentCardModel.dart';
import 'package:esouq/Tools/AppConstants.dart';
import 'package:esouq/Tools/AppImages.dart';
import 'package:esouq/Tools/AppSizes.dart';
import 'package:esouq/Tools/AppStrings.dart';
import 'package:esouq/themes/colors.dart';
import 'package:esouq/widgets/GeneraleWidgets.dart';
import 'package:esouq/widgets/SliderWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'AddCardScreen.dart';

class CartPaymentScreen extends StatefulWidget {
  static String tag = '/CartPaymentScreen';

  @override
  CartPaymentScreenState createState() => CartPaymentScreenState();
}

class CartPaymentScreenState extends State<CartPaymentScreen> {
  List<PaymentCard> mPaymentCards = [];

  @override
  void initState() {
    super.initState();
    mPaymentCards.add(PaymentCard());
    mPaymentCards.add(PaymentCard());
    mPaymentCards.add(PaymentCard());
    mPaymentCards.add(PaymentCard());
    mPaymentCards.add(PaymentCard());
    mPaymentCards.add(PaymentCard());
  }

  @override
  Widget build(BuildContext context) {
    var paymentDetail = Container(
      margin: EdgeInsets.only(
          top: spacing_standard_new, bottom: spacing_standard_new),
      decoration:
          BoxDecoration(border: Border.all(color: appWhite, width: 1.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(spacing_standard_new,
                spacing_middle, spacing_standard_new, spacing_middle),
            child: text(lbl_payment_details,
                textColor: appTextColorPrimary,
                fontSize: ts_medium_large,
                fontFamily: ts_medium),
          ),
          Divider(
            height: 1,
            color: appWhite,
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
                        textColor: appTextColorPrimary, fontFamily: ts_medium),
                  ],
                ),
                SizedBox(
                  height: spacing_standard,
                ),
                Row(
                  children: <Widget>[
                    text(lbl_shipping_charge),
                    text(lbl_free,
                        textColor: Colors.green, fontFamily: ts_medium),
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appWhite,
        title: text(title_payment,
            textColor: appTextColorPrimary,
            fontSize: ts_normal,
            fontFamily: font_bold),
        iconTheme: IconThemeData(color: appTextColorPrimary),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(spacing_standard_new),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  text(lbl_quick_pay,
                      textColor: appTextColorPrimary,
                      fontFamily: font_bold,
                      fontSize: ts_medium_large),
                  MaterialButton(
                    textColor: appColorPrimary,
                    padding: EdgeInsets.only(
                        left: spacing_standard_new,
                        right: spacing_standard_new,
                        top: 0,
                        bottom: 0),
                    child: text(lbl_add_card,
                        fontSize: ts_medium, textColor: appColorPrimary),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(spacing_large),
                      side: BorderSide(color: appColorPrimary),
                    ),
                    onPressed: () {
                      AddCardScreen().launch(context);
                    },
                  )
                ],
              ),
            ),
            PaymentCards(mPaymentCards),
            Padding(
              padding: const EdgeInsets.all(spacing_standard_new),
              child: Column(
                children: <Widget>[
                  divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: spacing_standard_new,
                          bottom: spacing_standard_new),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.credit_card,
                            color: appTextColorPrimary,
                          ),
                          SizedBox(
                            width: spacing_standard_new,
                          ),
                          text(lbl_pay_with_debit_credit_card,
                              textColor: appTextColorPrimary,
                              fontFamily: ts_medium,
                              fontSize: ts_medium_large),
                        ],
                      ),
                    ),
                  ),
                  divider(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context, true);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: spacing_standard_new,
                          bottom: spacing_standard_new),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.credit_card,
                            color: appTextColorPrimary,
                          ),
                          SizedBox(
                            width: spacing_standard_new,
                          ),
                          text(lbl_caon_delivery,
                              textColor: appTextColorPrimary,
                              fontFamily: ts_medium,
                              fontSize: ts_medium_large),
                        ],
                      ),
                    ),
                  ),
                  divider(),
                  paymentDetail
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PaymentCards extends StatelessWidget {
  List<PaymentCard> mSliderList;

  PaymentCards(this.mSliderList);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    width = width - 50;
    return ACarouselSlider(
      viewportFraction: 0.9,
      height: 210,
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
      items: mSliderList.map((slider) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 210,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    card,
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: 210,
                  ),
                  Padding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              text("Debit card",
                                  textColor: appWhite,
                                  fontSize: ts_medium_large,
                                  fontFamily: font_bold),
                              text("MVK Bank",
                                  textColor: appWhite,
                                  fontSize: ts_medium_large,
                                  fontFamily: font_bold)
                            ],
                          ),
                          SizedBox(
                            height: spacing_middle,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Image.asset(
                                  chip,
                                  width: 50,
                                  height: 30,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  height: spacing_standard_new,
                                ),
                                text("3434 3434 3434",
                                    textColor: appWhite,
                                    fontFamily: ts_medium,
                                    fontSize: ts_medium_large),
                                text("valid 12/12",
                                    textColor: appWhite, fontSize: ts_medium),
                                SizedBox(
                                  height: spacing_standard,
                                ),
                                Expanded(
                                    child: text("JOHN",
                                        textColor: appWhite,
                                        fontFamily: ts_medium,
                                        fontSize: ts_medium)),
                              ],
                            ),
                          )
                        ],
                      ),
                      padding: EdgeInsets.all(14)),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
