import 'package:esouq/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

Widget appTextFieldWidget(TextEditingController controller, String hintText,
    TextFieldType textFieldType,
    {FocusNode? focus, FocusNode? nextFocus}) {
  return AppTextField(
    controller: controller,
    textFieldType: textFieldType,
    textStyle: primaryTextStyle(size: 14),
    focus: focus,
    nextFocus: nextFocus,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      filled: true,
      fillColor: grey.withOpacity(0.1),
      hintText: hintText,
      hintStyle: secondaryTextStyle(),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
    ),
  );
}

Widget appButtonWidget(BuildContext context, String text, Function onTap) {
  return AppButton(
    text: text,
    textStyle: boldTextStyle(color: white),
    color: appColorPrimary,
    onTap: onTap,
    width: context.width(),
  ).cornerRadiusWithClipRRect(20);
}

AppBar appBarwidget(BuildContext context, {String? title}) {
  return AppBar(
    leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          finish(context);
        }),
    title: Text('$title', style: boldTextStyle(color: black, size: 20)),
    backgroundColor: white,
    centerTitle: true,
  );
}

InputDecoration inputDecoration(BuildContext context,
    {String? hintText, Widget? prefixIcon}) {
  return InputDecoration(
    contentPadding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
    filled: true,
    fillColor: grey.withOpacity(0.1),
    hintText: hintText,
    hintStyle: secondaryTextStyle(),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
    prefixIcon: prefixIcon,
  );
}
