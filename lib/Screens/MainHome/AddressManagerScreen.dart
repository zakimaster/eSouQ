import 'package:esouq/Models/AddressListModel.dart';
import 'package:esouq/Tools/AppConstants.dart';
import 'package:esouq/Tools/AppExtension.dart';
import 'package:esouq/Tools/AppSizes.dart';
import 'package:esouq/Tools/AppStrings.dart';
import 'package:esouq/themes/colors.dart';
import 'package:esouq/widgets/GeneraleWidgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

import 'Widgets/AddAddress.dart';

class AddressManagerScreen extends StatefulWidget {
  static String tag = '/AddressManagerScreen';

  @override
  AddressManagerScreenState createState() => AddressManagerScreenState();
}

class AddressManagerScreenState extends State<AddressManagerScreen> {
  List<AddressModel> addressList = [];
  int? selectedAddressIndex = 0;
  var primaryColor;
  var mIsLoading = true;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    setState(() {
      mIsLoading = true;
    });
    var addresses = await loadAddresses();
    setState(() {
      addressList.clear();
      addressList.addAll(addresses);
      isLoaded = true;
      mIsLoading = false;
    });
  }

  deleteAddress(AddressModel model) async {
    setState(() {
      addressList.remove(model);
    });
  }

  editAddress(AddressModel model) async {
    var bool = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => AddNewAddress(
                      addressModel: model,
                    ))) ??
        false;
    if (bool) {
      fetchData();
    }
  }

  @override
  Widget build(BuildContext context) {
    final listView = ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(
          top: spacing_standard_new, bottom: spacing_standard_new),
      itemBuilder: (item, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: spacing_standard_new),
          child: Slidable(
            actionPane: SlidableDrawerActionPane(),
            actions: <Widget>[
              IconSlideAction(
                caption: 'Edit',
                color: Colors.green,
                icon: Icons.edit,
                onTap: () => editAddress(addressList[index]),
              )
            ],
            secondaryActions: <Widget>[
              IconSlideAction(
                caption: 'Delete',
                color: Colors.redAccent,
                icon: Icons.delete_outline,
                onTap: () => deleteAddress(addressList[index]),
              ),
            ],
            child: InkWell(
              onTap: () {
                setState(() {
                  selectedAddressIndex = index;
                });
              },
              child: Container(
                padding: EdgeInsets.all(spacing_standard_new),
                margin: EdgeInsets.only(
                  right: spacing_standard_new,
                  left: spacing_standard_new,
                ),
                color: appWhite,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Radio(
                        value: index,
                        groupValue: selectedAddressIndex,
                        onChanged: (dynamic value) {
                          setState(() {
                            selectedAddressIndex = value;
                          });
                        },
                        activeColor: primaryColor),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text(
                              addressList[index].first_name! +
                                  " " +
                                  addressList[index].last_name!,
                              textColor: appTextColorPrimary,
                              fontFamily: font_medium,
                              fontSize: ts_medium_large),
                          text(addressList[index].address,
                              textColor: appTextColorPrimary,
                              fontSize: ts_medium),
                          text(
                              addressList[index].city! +
                                  "," +
                                  addressList[index].state!,
                              textColor: appTextColorPrimary,
                              fontSize: ts_medium),
                          text(
                              addressList[index].country! +
                                  "," +
                                  addressList[index].pinCode!,
                              textColor: appTextColorPrimary,
                              fontSize: ts_medium),
                          SizedBox(
                            height: spacing_standard_new,
                          ),
                          text(addressList[index].phone_number,
                              textColor: appTextColorPrimary,
                              fontSize: ts_medium),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      shrinkWrap: true,
      itemCount: addressList.length,
    );

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              color: blackColor,
              icon: Icon(Icons.add),
              onPressed: () async {
                var bool = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                AddNewAddress())) ??
                    false;
                if (bool) {
                  fetchData();
                }
              })
        ],
        iconTheme: IconThemeData(color: appTextColorPrimary),
        title: text(lbl_address_manager,
            textColor: appTextColorPrimary,
            fontSize: ts_normal,
            fontFamily: font_medium),
        backgroundColor: whiteColor,
      ),
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          listView,
          SizedBox(
            width: double.infinity,
            child: MaterialButton(
              color: appColorPrimary,
              elevation: 0,
              padding: EdgeInsets.all(spacing_standard_new),
              child: text("Save",
                  textColor: white,
                  fontFamily: font_medium,
                  fontSize: ts_medium_large),
              onPressed: () {
                Navigator.pop(context, selectedAddressIndex);
              },
            ),
          )
        ],
      ),
    );
  }
}
