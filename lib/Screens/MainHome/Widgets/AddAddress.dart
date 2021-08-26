import 'package:esouq/Tools/AppStrings.dart';
import 'package:esouq/themes/colors.dart';
import 'package:esouq/widgets/GeneraleWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AddNewAddress extends StatefulWidget {
  static String tag = '/AddAddress';

  @override
  AddNewAddressState createState() => AddNewAddressState();
}

class AddNewAddressState extends State<AddNewAddress> {
  String? _selectedLocation = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appLayout_background,
      appBar: appBar(context, "New Address"),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      editTextGreyOutlinedRoundedStyle(FullName),
                      SizedBox(height: 16),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: editTextGreyOutlinedRoundedStyle(PinCode)),
                          SizedBox(width: 16),
                          Expanded(
                              child: editTextGreyOutlinedRoundedStyle(City)),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child:
                                  editTextGreyOutlinedRoundedStyle(StateLabel)),
                          SizedBox(width: 16),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 16, right: 16),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: appBorderGreyColor,
                                    width: 1,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))),
                              width: MediaQuery.of(context).size.width,
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                value: _selectedLocation,
                                items: <String>['Home', 'Work']
                                    .map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value,
                                        style: primaryTextStyle(
                                            size: 16,
                                            color: appTextColorSecondary)),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedLocation = newValue;
                                  });
                                },
                              )),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 16),
                      editTextGreyOutlinedRoundedStyle(Address),
                      SizedBox(height: 16),
                      editTextGreyOutlinedRoundedStyle(MobileNumber),
                      SizedBox(height: 16),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        decoration: BoxDecoration(
                            color: appTextColorPrimary,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: defaultBoxShadow()),
                        child: Text(AddAddress,
                                style: primaryTextStyle(color: appWhite))
                            .center(),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
