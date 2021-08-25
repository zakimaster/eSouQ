import 'package:esouq/Tools/AppImages.dart';
import 'package:esouq/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'CostumerForgotPasswordScreen.dart';
import 'CostumerSingUpScreen.dart';
import 'CustomerWidgets.dart';

class CustomerSignInScreen extends StatefulWidget {
  static String tag = '/CustomerSignInScreen';

  @override
  CustomerSignInScreenState createState() => CustomerSignInScreenState();
}

class CustomerSignInScreenState extends State<CustomerSignInScreen> {
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
                  CostumerForgotPasswordScreen().launch(context);
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
                  CostumerSingUpScreen().launch(context);
                }),
              ],
            ),
            50.height,
            Row(
              children: [
                Divider(thickness: 2).expand(),
                8.width,
                Text('Or Sign In with', style: secondaryTextStyle()),
                8.width,
                Divider(thickness: 2).expand(),
              ],
            ),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppButton(
                  child: Row(
                    children: [
                      Image.asset(FacebookLogo, width: 20, height: 20),
                      8.width,
                      Text('Facebook', style: primaryTextStyle(color: white)),
                    ],
                  ),
                  onTap: () {},
                  width: (context.width() - (3 * 16)) * 0.5,
                  color: FacebookColor,
                  elevation: 0,
                ).cornerRadiusWithClipRRect(20),
                16.width,
                AppButton(
                  child: Row(
                    children: [
                      Image.asset(GoogleLogo, width: 20, height: 20),
                      8.width,
                      Text('Google', style: primaryTextStyle(color: black)),
                    ],
                  ),
                  onTap: () {},
                  width: (context.width() - (3 * 16)) * 0.5,
                  elevation: 0,
                  shapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(width: 1, color: grey)),
                ),
              ],
            ),
          ],
        ).paddingOnly(left: 16, right: 16),
      ),
    );
  }
}
