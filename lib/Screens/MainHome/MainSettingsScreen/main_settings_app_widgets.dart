import 'package:cached_network_image/cached_network_image.dart';
import 'package:esouq/Tools/AppConstants.dart';
import 'package:esouq/Tools/AppSizes.dart';
import 'package:esouq/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nb_utils/nb_utils.dart';

import 'package:esouq/widgets/GeneraleWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

Widget toolBarTitle(BuildContext context, String? title) {
  return text(title,
      fontSize: ts_large,
      textColor: appTextColorPrimary,
      fontFamily: font_bold);
}

Widget itemTitle(BuildContext context, var titleText,
    {var fontfamily = font_medium}) {
  return text(titleText,
      fontSize: ts_normal,
      fontFamily: fontfamily,
      textColor: appTextColorPrimary);
}

Widget itemSubTitle(BuildContext context, var titleText,
    {var fontFamily = font_regular,
    var fontsize = ts_normal,
    var colorThird = false,
    isLongText = true}) {
  return text(titleText,
      fontSize: fontsize,
      fontFamily: fontFamily,
      isLongText: isLongText,
      textColor: colorThird ? appTextColorThird : appTextColorSecondary);
}

AppBar appBarLayout(context, text, {darkBackground = true}) {
  return AppBar(
    elevation: 0,
    iconTheme: IconThemeData(color: appColorPrimary),
    title: toolBarTitle(context, text),
    backgroundColor: darkBackground ? appLayout_background : Colors.transparent,
  );
}

Widget networkImage(String? image,
    {String aPlaceholder = "",
    double? aWidth,
    double? aHeight,
    BoxFit fit = BoxFit.fill}) {
  return CachedNetworkImage(
    placeholder:
        placeholderWidgetFn() as Widget Function(BuildContext, String)?,
    imageUrl: '$image',
    width: aWidth,
    height: aHeight,
    fit: fit,
  );
}

Widget button(BuildContext context, buttonText, Color textColor,
    Color backcolor, VoidCallback callback) {
  return MaterialButton(
    textColor: textColor,
    color: backcolor,
    splashColor: Colors.grey.withOpacity(0.2),
    padding: EdgeInsets.only(top: 12, bottom: 12),
    child: text(buttonText,
        fontSize: ts_normal, fontFamily: font_medium, textColor: textColor),
    shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(spacing_control),
      side: BorderSide(color: appColorPrimary),
    ),
    onPressed: callback,
  );
}

Widget loadingWidgetMaker() {
  return Container(
    alignment: Alignment.center,
    child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: spacing_control,
      margin: EdgeInsets.all(4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
      child: Container(
        width: 45,
        height: 45,
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(strokeWidth: 3),
      ),
    ),
  );
}

Widget subType(context, key, VoidCallback callback, icon) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    textDirection: TextDirection.ltr,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      icon != null
          ? Image.asset(
              icon,
              width: 20,
              height: 20,
              color: appTextColorPrimary,
            ).paddingRight(spacing_standard)
          : SizedBox(),
      Expanded(child: itemTitle(context, key)),
      Icon(Icons.arrow_forward_ios, size: 16, color: appTextColorThird)
    ],
  )
      .paddingOnly(
          left: spacing_standard_new,
          right: 0,
          top: spacing_standard_new,
          bottom: spacing_standard_new)
      .onTap(callback);
}

Widget hdWidget(context) {
  return Container(
    decoration: BoxDecoration(
        color: appColorPrimary,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(spacing_control_half))),
    padding: EdgeInsets.only(
        top: 0, bottom: 0, left: spacing_control, right: spacing_control),
    child: text("HD",
        textColor: Colors.black, fontSize: ts_medium, fontFamily: font_bold),
  );
}

Widget formField(
  context,
  hint, {
  isEnabled = true,
  isDummy = false,
  controller,
  isPasswordVisible = false,
  isPassword = false,
  keyboardType = TextInputType.text,
  FormFieldValidator<String>? validator,
  onSaved,
  textInputAction = TextInputAction.next,
  FocusNode? focusNode,
  FocusNode? nextFocus,
  IconData? suffixIcon,
  maxLine = 1,
  suffixIconSelector,
}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword && isPasswordVisible,
    cursorColor: appColorPrimary,
    maxLines: maxLine,
    keyboardType: keyboardType,
    validator: validator,
    onSaved: onSaved,
    textInputAction: textInputAction,
    focusNode: focusNode,
    onFieldSubmitted: (arg) {
      if (nextFocus != null) {
        FocusScope.of(context).requestFocus(nextFocus);
      }
    },
    decoration: InputDecoration(
      focusedBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: appColorPrimary)),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: appTextColorPrimary)),
      labelText: hint,
      labelStyle: TextStyle(fontSize: ts_normal, color: appTextColorPrimary),
      suffixIcon: isPassword && isPasswordVisible
          ? GestureDetector(
              onTap: suffixIconSelector,
              child: Icon(suffixIcon, color: appColorPrimary, size: 20))
          : Icon(suffixIcon, color: appColorPrimary, size: 20),
      contentPadding: EdgeInsets.only(bottom: 2.0),
    ),
    style: TextStyle(
        fontSize: ts_normal,
        color: isDummy ? Colors.transparent : appTextColorPrimary,
        fontFamily: font_regular),
  );
}
