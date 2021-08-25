import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'CustomerWidgets.dart';

class CostumerForgotPasswordScreen extends StatefulWidget {
  @override
  CostumerForgotPasswordScreenState createState() =>
      CostumerForgotPasswordScreenState();
}

class CostumerForgotPasswordScreenState
    extends State<CostumerForgotPasswordScreen> {
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
