import 'package:esouq/Screens/CustomerScreens/CustomerWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class DeliverForgotPasswordScreen extends StatefulWidget {
  @override
  DeliverForgotPasswordScreenState createState() =>
      DeliverForgotPasswordScreenState();
}

class DeliverForgotPasswordScreenState
    extends State<DeliverForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Forgot Password', elevation: 0),
      body: Column(
        children: [
          16.height,
          appTextFieldWidget(
              emailController, 'Email Address', TextFieldType.EMAIL),
          16.height,
          appButtonWidget(context, 'Send Password', () {
            finish(context);
          })
        ],
      ).paddingOnly(left: 16, right: 16),
    );
  }
}
