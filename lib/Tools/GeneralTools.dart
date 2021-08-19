import 'package:flutter/cupertino.dart';

class GeneralTools {

  static double width =0;
  static double height = 0;
  final BuildContext context;

  GeneralTools(this.context);

  void init() {
    final MediaQueryData _mediaQueryData = MediaQuery.of(context);
    width = _mediaQueryData.size.width;
    height = _mediaQueryData.size.height;
  }

  double getHeight(){
    init();
    return height;
  }
  double getWidth(){
    init();
    return width;
  }

}