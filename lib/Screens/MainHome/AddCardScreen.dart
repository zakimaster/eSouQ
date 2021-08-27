import 'package:esouq/Models/PaymentCardModel.dart';
import 'package:esouq/Tools/AppConstants.dart';
import 'package:esouq/Tools/AppSizes.dart';
import 'package:esouq/Tools/AppStrings.dart';
import 'package:esouq/themes/colors.dart';
import 'package:esouq/widgets/GeneraleWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class AddCardScreen extends StatefulWidget {
  static String tag = '/AddCardScreen';
  PaymentCard? paymentCard;

  AddCardScreen({this.paymentCard});

  @override
  AddCardScreenState createState() => AddCardScreenState();
}

class AddCardScreenState extends State<AddCardScreen> {
  var cvvCont = TextEditingController();
  var nameCont = TextEditingController();
  var cardNumberCont = TextEditingController();
  var months = [
    "",
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
    "10",
    "11",
    "12"
  ];
  var years = [
    "",
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
    "2025",
    "2026",
    "2027",
    "2028",
    "2029",
    "2030",
    "2031"
  ];
  String? selectedMonth = "";
  String? selectedYear = "";

  @override
  void initState() {
    super.initState();
    if (widget.paymentCard != null) {
      setState(() {
        cvvCont.text = widget.paymentCard!.cvv;
        nameCont.text = widget.paymentCard!.holderName;
        cardNumberCont.text = widget.paymentCard!.cardNo;
        selectedMonth = widget.paymentCard!.month;
        selectedYear = widget.paymentCard!.year;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appWhite,
        title: text(lbl_add_card,
            textColor: appTextColorPrimary,
            fontSize: ts_normal,
            fontFamily: font_bold),
        iconTheme: IconThemeData(color: appTextColorPrimary),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(spacing_standard_new),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              headingText(hint_card_number),
              SizedBox(
                height: spacing_standard_new,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                autofocus: false,
                maxLength: 16,
                controller: cardNumberCont,
                textCapitalization: TextCapitalization.words,
                style: TextStyle(
                    color: appTextColorPrimary,
                    fontFamily: font_regular,
                    fontSize: ts_medium),
                decoration: InputDecoration(
                    filled: false,
                    counterText: "",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(spacing_control)),
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(spacing_control)),
                        borderSide: BorderSide(color: Colors.grey, width: 0))),
              ),
              SizedBox(
                height: spacing_standard_new,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        headingText("Month"),
                        SizedBox(
                          height: spacing_standard_new,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 1),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(spacing_control))),
                          child: DropdownButton<String>(
                            underline: SizedBox(),
                            value: selectedMonth,
                            isExpanded: true,
                            items: months.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: text(value,
                                    fontSize: ts_medium,
                                    textColor: appTextColorPrimary),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedMonth = newValue;
                              });
                            },
                          ),
                        )
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  SizedBox(
                    width: spacing_standard_new,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        headingText("Year"),
                        SizedBox(
                          height: spacing_standard_new,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.fromLTRB(20.0, 4.0, 8.0, 4.0),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.5),
                                  width: 1),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(spacing_control))),
                          child: DropdownButton<String>(
                            underline: SizedBox(),
                            value: selectedYear,
                            isExpanded: true,
                            items: years.map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: text(value,
                                    fontSize: ts_medium,
                                    textColor: appTextColorPrimary),
                              );
                            }).toList(),
                            onChanged: (newValue) {
                              setState(() {
                                selectedYear = newValue;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: spacing_standard_new,
              ),
              headingText(lbl_cvv),
              SizedBox(
                height: spacing_standard_new,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                autofocus: false,
                controller: cvvCont,
                maxLength: 3,
                obscureText: true,
                textCapitalization: TextCapitalization.words,
                style: TextStyle(
                    color: appTextColorPrimary,
                    fontFamily: font_regular,
                    fontSize: ts_medium),
                decoration: InputDecoration(
                    filled: false,
                    counterText: "",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(spacing_control)),
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(spacing_control)),
                        borderSide: BorderSide(color: Colors.grey, width: 0))),
              ),
              SizedBox(
                height: spacing_standard_new,
              ),
              headingText(hint_card_holder_name),
              SizedBox(
                height: spacing_standard_new,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                autofocus: false,
                controller: nameCont,
                textCapitalization: TextCapitalization.words,
                style: TextStyle(
                    color: appTextColorPrimary,
                    fontFamily: font_regular,
                    fontSize: ts_medium),
                decoration: InputDecoration(
                    filled: false,
                    counterText: "",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(spacing_control)),
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(spacing_control)),
                        borderSide: BorderSide(color: Colors.grey, width: 0))),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                // height: double.infinity,
                child: MaterialButton(
                  padding: EdgeInsets.all(spacing_standard),
                  child: text(lbl_add_card,
                      fontSize: ts_normal,
                      fontFamily: font_medium,
                      textColor: appWhite),
                  textColor: appWhite,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0)),
                  color: appColorPrimary,
                  onPressed: () => {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
