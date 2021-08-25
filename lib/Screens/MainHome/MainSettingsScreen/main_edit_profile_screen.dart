import 'dart:io';

import 'package:esouq/Tools/AppConstants.dart';
import 'package:esouq/Tools/AppSizes.dart';
import 'package:esouq/Tools/AppStrings.dart';
import 'package:esouq/themes/colors.dart';
import 'package:esouq/widgets/GeneraleWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import 'main_settings_app_widgets.dart';

class EditProfileScreen extends StatefulWidget {
  static String tag = '/EditConsumerScreen';

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool passwordVisible = false;
  bool isRemember = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController dummycontroller = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _contactController = new TextEditingController();
  FocusNode _nameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _contactFocusNode = FocusNode();
  bool autoValidate = false;
  var contact;
  var name;
  var userProfile;
  var userName;
  var userEmail;
  var userId;
  late File imageFile;
  bool isLoading = false;
  bool loadFromFile = false;
  var selectedGender;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    setState(() {
      userProfile =
          "https://pickaface.net/gallery/avatar/jquan0755a199bfcb71d.png";
      userName = "Vicotria Becks";
      userEmail = "vicotriabecks@gmail.com";
      contact = "";
/*
      userId = pref.getInt(USER_ID);
      userProfile = pref.getString(USER_PROFILE) ?? '';
      userName = pref.getString(USERNAME) ?? '';
      userEmail = pref.getString(USER_EMAIL) ?? '';
      name = pref.getString(NAME) ?? '';
      contact = pref.getString(USER_CONTACT_NO) ?? '';
*/
      _nameController.text = userName;
      dummycontroller.text = "userName";
      _emailController.text = userEmail;
      _contactController.text = contact;
    });
  }

  showLoading(bool show) {
    setState(() {
      isLoading = show;
    });
  }

  Future getImage(ImageSource source) async {
    var image = await ImagePicker().pickImage(source: source);
    if (image != null) {
      imageFile = File(image.path);
      loadFromFile = true;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    selectedGender = getGenders(context).first;

    final profilePhoto = Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: spacing_standard_new,
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: loadFromFile
                  ? Image.file(
                      imageFile,
                      height: 95,
                      width: 95,
                      fit: BoxFit.cover,
                    )
                  : userProfile != null && userProfile.toString().isNotEmpty
                      ? networkImage(
                          userProfile,
                          aHeight: 95,
                          aWidth: 95,
                        )
                      : Image.asset('assets/user.png', width: 95, height: 95),
            ).onTap(() {
              getImage(ImageSource.gallery);
            }),
            text("Change Avatar",
                    textColor: appTextColorPrimary,
                    fontFamily: font_bold,
                    fontSize: ts_medium)
                .paddingTop(spacing_standard_new)
                .onTap(() {})
          ],
        ).paddingOnly(top: 16));

    final fields = Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          formField(
            context,
            "Email",
            controller: _emailController,
            focusNode: _emailFocusNode,
            nextFocus: _nameFocusNode,
            validator: (String? value) {
              if (!value.validateEmail()) return "Enter valid email";
              return null;
            },
            onSaved: (String? value) {
              userEmail = value;
            },
            suffixIcon: Icons.mail_outline,
          ).paddingBottom(spacing_standard_new),
          formField(
            context,
            "Name",
            controller: _nameController,
            focusNode: _nameFocusNode,
            nextFocus: _contactFocusNode,
            validator: (value) {
              return value!.isEmpty ? "Enter valid name" : null;
            },
            onSaved: (String? value) {
              name = value;
            },
            suffixIcon: Icons.person_outline,
          ).paddingBottom(spacing_standard_new),
          formField(
            context,
            "Phone Number",
            controller: _contactController,
            focusNode: _contactFocusNode,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.done,
            validator: (value) {
              return value!.isEmpty ? "Phone No Required" : null;
            },
            onSaved: (String? value) {
              contact = value;
            },
            suffixIcon: Icons.phone,
          ).paddingBottom(spacing_standard_new),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Gender",
                style: TextStyle(
                    fontSize: ts_medium_small,
                    fontFamily: font_regular,
                    color: appTextColorPrimary),
              ),
              Theme(
                data: ThemeData(canvasColor: appLayout_background),
                child: DropdownButton(
                  value: selectedGender,
                  isExpanded: true,
                  onChanged: (dynamic newValue) {
                    setState(() {
                      selectedGender = newValue;
                    });
                  },
                  items: getGenders(context).map((value) {
                    return DropdownMenuItem(
                      child: text(value,
                          fontSize: ts_normal, textColor: appTextColorPrimary),
                      value: value,
                    );
                  }).toList(),
                ),
              )
            ],
          ).paddingBottom(spacing_standard_new),
        ],
      ),
    ).paddingOnly(
        left: spacing_standard_new, right: spacing_standard_new, top: 36);

    return Scaffold(
      backgroundColor: appWhite,
      appBar: appBarLayout(context, "Edit Profile"),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                profilePhoto,
                fields,
                SizedBox(
                  width: double.infinity,
                  child: button(
                    context,
                    'Save',
                    appWhite,
                    appColorPrimary,
                    () {
                      if (isLoading) {
                        return;
                      }
                      final form = _formKey.currentState!;
                      if (form.validate()) {
                        form.save();
//                      saveProfile(context);
                      } else {
                        setState(() => autoValidate = true);
                      }
                    },
                  ).paddingOnly(top: 30, left: 18, right: 18, bottom: 30),
                )
              ],
            ),
          ),
          loadingWidgetMaker().visible(isLoading)
        ],
      ),
    );
  }
}
