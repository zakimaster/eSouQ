import 'package:esouq/Screens/CustomerScreens/CustomerWidgets.dart';
import 'package:esouq/Tools/AppImages.dart';
import 'package:esouq/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'StoreForgotPasswordScreen.dart';
import 'StoreSingUpScreen.dart';

class StoreSignInScreen extends StatefulWidget {
  static String tag = '/StoreSignInScreen';

  @override
  StoreSignInScreenState createState() => StoreSignInScreenState();
}

class StoreSignInScreenState extends State<StoreSignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            100.height,
            Text('Welcome to\neSouQ', style: boldTextStyle(size: 30)),
            30.height,
            appTextFieldWidget(
                emailController, 'Email Address', TextFieldType.EMAIL,
                focus: emailFocus, nextFocus: passwordFocus),
            16.height,
            appTextFieldWidget(
                passwordController, 'Password', TextFieldType.PASSWORD,
                focus: passwordFocus),
            16.height,
            Align(
                alignment: Alignment.centerRight,
                child: Text('Forgot Password?',
                        style: boldTextStyle(color: appColorPrimary))
                    .onTap(() {
                  StoreForgotPasswordScreen().launch(context);
                })),
            16.height,
            appButtonWidget(context, 'Sign In', () {
              //NBHomeScreen().launch(context);
            }),
            30.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?', style: primaryTextStyle()),
                Text(' Sign Up', style: boldTextStyle(color: appColorPrimary))
                    .onTap(() {
                  StoreSingUpScreen().launch(context);
                }),
              ],
            ),
            50.height,
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
