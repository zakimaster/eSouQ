import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Config.dart';

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

  double dynamicWidth(BuildContext context) {
    return isMobile ? context.width() : Config.applicationMaxWidth;
  }
}