import 'dart:io';

import 'package:esouq/Screens/CustomerScreens/CustomerWidgets.dart';
import 'package:esouq/Tools/AppConstants.dart';
import 'package:esouq/Tools/AppSizes.dart';
import 'package:esouq/Tools/AppStrings.dart';
import 'package:esouq/themes/colors.dart';
import 'package:esouq/widgets/GeneraleWidgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

class StoreSingUpScreen extends StatefulWidget {
  static String tag = '/StoreSingUpScreen';

  @override
  StoreSingUpScreennState createState() => StoreSingUpScreennState();
}

class StoreSingUpScreennState extends State<StoreSingUpScreen> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();

  var userProfile;
  late File imageFile;
  bool isLoading = false;
  bool loadFromFile = false;
  var selectedCategory;
  double _width = 0;
  double _height = 0;
  late GoogleMapController _controller;

  List<Marker> allMarkers = [];

  // PageController? _pageController;

  int? prevPage;

  @override
  void initState() {
    super.initState();
    init();
    /*atmList.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.shopName!),
          draggable: false,
          infoWindow: InfoWindow(
            title: element.shopName,
            snippet: element.address,
          ),
          position: element.locationCoords!));
    });*/
    /*_pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);*/
  }

  Future<void> init() async {
    //
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
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    selectedCategory = getCategories(context).first;
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    Widget _signupEmail() {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.height,
            Text('Create new\naccount', style: boldTextStyle(size: 30)),
            30.height,
            appTextFieldWidget(
                emailController, 'Email Address', TextFieldType.EMAIL,
                focus: emailFocus, nextFocus: phoneFocus),
            16.height,
            appTextFieldWidget(
                phoneController, 'Phone Number', TextFieldType.PHONE,
                focus: phoneFocus, nextFocus: passwordFocus),
            16.height,
            appTextFieldWidget(
                passwordController, 'Password', TextFieldType.PASSWORD,
                focus: passwordFocus),
            30.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Have an Account?', style: primaryTextStyle()),
                Text(' Sign In', style: boldTextStyle(color: appColorPrimary))
                    .onTap(() {
                  finish(context);
                }),
              ],
            ),
          ],
        ).paddingOnly(left: 16, right: 16),
      );
    }

    Widget profilePhoto() {
      return Container(
          width: _width,
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
                    : Image.asset("assets/images/ic_profile.png",
                        width: 95, height: 95, fit: BoxFit.cover),
              ).onTap(() {
                getImage(ImageSource.gallery);
              }),
              text("Change Store Avatar",
                      textColor: appTextColorPrimary,
                      fontFamily: font_bold,
                      fontSize: ts_medium)
                  .paddingTop(spacing_standard_new)
                  .onTap(() {})
            ],
          ).paddingOnly(top: 16));
    }

    Widget _storeInfo() {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profilePhoto(),
            40.height,
            appTextFieldWidget(nameController, 'Store name', TextFieldType.NAME,
                focus: nameFocus, nextFocus: emailFocus),
            16.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Category",
                  style: TextStyle(
                      fontSize: ts_medium_small,
                      fontFamily: font_regular,
                      color: appTextColorPrimary),
                ),
                Theme(
                  data: ThemeData(canvasColor: appLayout_background),
                  child: DropdownButton(
                    value: selectedCategory,
                    isExpanded: true,
                    onChanged: (dynamic newValue) {
                      setState(() {
                        selectedCategory = newValue;
                      });
                    },
                    items: getCategories(context).map((value) {
                      return DropdownMenuItem(
                        child: text(value,
                            fontSize: ts_normal,
                            textColor: appTextColorPrimary),
                        value: value,
                      );
                    }).toList(),
                  ),
                )
              ],
            )
          ],
        ).paddingOnly(left: 16, right: 16),
      );
    }

    Widget _storeLocation() {
      return Stack(
        children: <Widget>[
          Container(
            height: _height - 300,
            width: _width,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                  target: LatLng(20.817595, 72.954918), zoom: 12.0),
              markers: Set.from(allMarkers),
              onMapCreated: mapCreated,
            ),
          ),
          Positioned(
            bottom: 20.0,
            child: Container(
              height: 40.0,
              width: MediaQuery.of(context).size.width - 50,
              child: smallAddressWidget(context),
            ),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Store register',
          style: TextStyle(color: appTextColorPrimary),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: new Text(
                      'Account',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    content: Column(
                      children: <Widget>[
                        _signupEmail(),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Store info',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    content: Column(
                      children: <Widget>[
                        _storeInfo(),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Location',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    content: Column(
                      children: <Widget>[
                        _storeLocation(),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 2
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//------------------------------------------------------------

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(20.8092432, 72.9578672),
        zoom: 14.0,
        bearing: 45.0,
        tilt: 45.0)));
  }
}
