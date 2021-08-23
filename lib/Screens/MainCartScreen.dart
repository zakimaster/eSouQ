
import 'package:esouq/Models/AppData.dart';
import 'package:esouq/Models/CartListModel.dart';
import 'package:esouq/themes/colors.dart';
import 'package:esouq/widgets/GeneraleWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter/cupertino.dart';

import '../main.dart';

class MainCartList extends StatefulWidget{

  bool? mIsEditable;

  @override
  _MainCartListState createState() => _MainCartListState();
}

class _MainCartListState extends State<MainCartList>{

  List<CartListModel> data = AppData.cartList;

  var subTotal = 0;
  var totalAmount = 0;
  var shippingCharges = 0;
  var mainCount = 0;

  @override
  void initState() {
    super.initState();
   // init();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  init() async {
    calculate();
  }

 calculate() async {
    subTotal = 0;
    shippingCharges = 0;
    totalAmount = 0;

    data.forEach((element) {
      subTotal += ((element.discountPrice.toInt() ?? element.price.toInt()) * element.quantity);
    });

    shippingCharges = (subTotal * 10).toInt() ~/ 100;
    totalAmount = subTotal + shippingCharges;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    Widget checkOutBtn() {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(12),
        decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appDarkRed),
        child: Text('Checkout', style: boldTextStyle(color: white)),
      ).onTap(() {
        //DTOrderSummaryScreen(getCartProducts()).launch(context);
      });
    }

    Widget itemCart(CartListModel data) {
      return Container(
        decoration: boxDecorationRoundedWithShadow(8, backgroundColor: appStore.appBarColor!),
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
                Text(data.name, style: primaryTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis),
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
                      Text(data.quantity.toString(), style: boldTextStyle(color: whiteColor)),
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

    return Column(children:[
      Container(height:55,width: double.infinity,
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
      ),child: Center(child:Text('Cart',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),),

      ),SingleChildScrollView(child: cartItemList()),
      Container(height:50,width: double.infinity,
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
        ),child:
        Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[
          Center(child:
          Text('\$$totalAmount',style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),),
          checkOutBtn(),

      ]),)]);


  }


  }
