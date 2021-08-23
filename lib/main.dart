import 'package:esouq/Screens/HomeScreen.dart';
import 'package:esouq/themes/AppStore.dart';
import 'package:esouq/themes/Theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nb_utils/nb_utils.dart';
import 'Tools/AppConstants.dart';

AppStore appStore = AppStore();

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await initialize();

  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));
 // appStore.isDarkModeOn;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: '$mainAppName${!isMobile ? ' ${platformName()}' : ''}',
      debugShowCheckedModeBanner: false,
      theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
      home: HomeScreen(),
    );
  }
}




