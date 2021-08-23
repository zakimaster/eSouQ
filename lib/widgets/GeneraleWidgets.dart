import 'dart:ui';
import 'package:esouq/Models/ChatMessagesModel.dart';
import 'package:esouq/Tools/GeneralTools.dart';
import 'package:esouq/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

Widget priceWidget(int? price, {bool applyStrike = false, double? fontSize, Color? textColor}) {
  return Text(
    applyStrike ? '$price' : '\$$price',
    style: TextStyle(
      decoration: applyStrike ? TextDecoration.lineThrough : TextDecoration.none,
      color: textColor != null
          ? textColor
          : applyStrike
          ? appStore.textSecondaryColor
          : appStore.textPrimaryColor,
      fontSize: fontSize != null
          ? fontSize
          : applyStrike
          ? 15
          : 18,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget totalItemCountWidget(int count) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Total Items', style: boldTextStyle()),
      Text('$count items', style: boldTextStyle()),
    ],
  );
}

Widget totalAmountWidget(int subTotal, int shippingCharges, int totalAmount) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Sub Total', style: boldTextStyle(size: 18)),
          priceWidget(subTotal),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Shipping Charges', style: boldTextStyle(size: 18)),
          priceWidget(shippingCharges),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Total Amount', style: boldTextStyle(size: 18)),
          priceWidget(totalAmount),
        ],
      ),
      20.height,
    ],
  );
}

class ChatMessageWidget extends StatelessWidget {
  const ChatMessageWidget({
    Key? key,
    required this.isMe,
    required this.data,
  }) : super(key: key);

  final bool isMe;
  final ChatMessageModel data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: isMe.validate() ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          margin: isMe.validate()
              ? EdgeInsets.only(top: 3.0, bottom: 3.0, right: 0, left: (GeneralTools(context).dynamicWidth(context) * 0.25).toDouble())
              : EdgeInsets.only(top: 4.0, bottom: 4.0, left: 0, right: (GeneralTools(context).dynamicWidth(context) * 0.25).toDouble()),
          decoration: BoxDecoration(
            color: !isMe ? appColorPrimary : appStore.appBarColor,
            boxShadow: defaultBoxShadow(),
            borderRadius: isMe.validate()
                ? BorderRadius.only(bottomLeft: Radius.circular(10), topLeft: Radius.circular(10), bottomRight: Radius.circular(0), topRight: Radius.circular(10))
                : BorderRadius.only(bottomLeft: Radius.circular(0), topLeft: Radius.circular(10), bottomRight: Radius.circular(10), topRight: Radius.circular(10)),
            border: Border.all(color: isMe ? Theme.of(context).dividerColor : Colors.transparent),
          ),
          child: Column(
            crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: Text(data.msg!, style: primaryTextStyle(color: !isMe ? white : appStore.textPrimaryColor))),
              Text(data.time!, style: secondaryTextStyle(color: !isMe ? white : appStore.textSecondaryColor, size: 12))
            ],
          ),
        ),
      ],
    );
  }
}