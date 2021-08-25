import 'package:esouq/Screens/CustomerScreens/CostumerSignInScreen.dart';
import 'package:esouq/Screens/DeliverScreens/DeliverSignInScreen.dart';
import 'package:esouq/Screens/StoreScreens/StoreSignInScreen.dart';
import 'package:esouq/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nb_utils/nb_utils.dart';

class MainAccountLogin extends StatefulWidget {
  @override
  _MainAccountLoginState createState() => _MainAccountLoginState();
}

class _MainAccountLoginState extends State<MainAccountLogin> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Choose your account',
          style: GoogleFonts.ubuntu(
              textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: appStore.textSecondaryColor,
          )),
        ),
        SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                StoreSignInScreen().launch(context);
              },
              child: Icon(
                Icons.storefront_outlined,
                color: Colors.black45,
                size: 40,
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(CircleBorder()),
                padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                backgroundColor:
                    MaterialStateProperty.all(Colors.white), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.red; // <-- Splash color
                }),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            ElevatedButton(
              onPressed: () {
                CustomerSignInScreen().launch(context);
              },
              child: Icon(
                Icons.account_circle_outlined,
                color: Colors.black45,
                size: 40,
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(CircleBorder()),
                padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                backgroundColor:
                    MaterialStateProperty.all(Colors.white), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.red; // <-- Splash color
                }),
              ),
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        ElevatedButton(
          onPressed: () {
            DeliverSignInScreen().launch(context);
          },
          child: Icon(
            Icons.delivery_dining,
            color: Colors.black45,
            size: 40,
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(CircleBorder()),
            padding: MaterialStateProperty.all(EdgeInsets.all(20)),
            backgroundColor:
                MaterialStateProperty.all(Colors.white), // <-- Button color
            overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
              if (states.contains(MaterialState.pressed))
                return Colors.red; // <-- Splash color
            }),
          ),
        ),
      ],
    );
  }

  style(FontWeight bold) {}
}
