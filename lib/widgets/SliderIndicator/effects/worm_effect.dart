import 'package:esouq/widgets/SliderIndicator/painters/indicator_painter.dart';
import 'package:esouq/widgets/SliderIndicator/painters/worm_painter.dart';
import 'package:flutter/material.dart';

import 'indicator_effect.dart';

class WormEffect extends IndicatorEffect {
  const WormEffect({
    double offset=5,
    double dotWidth = 16.0,
    double dotHeight = 16.0,
    double spacing = 8.0,
    double radius = 16,
    Color dotColor = Colors.grey,
    Color activeDotColor = Colors.indigo,
    double strokeWidth = 1.0,
    PaintingStyle paintStyle = PaintingStyle.fill,
  }) : super(
          dotWidth: dotWidth,
          dotHeight: dotHeight,
          spacing: spacing,
          radius: radius,
          strokeWidth: strokeWidth,
          paintStyle: paintStyle,
          dotColor: dotColor,
          activeDotColor: activeDotColor,
        );

  @override
  IndicatorPainter buildPainter(int count, double offset) {
    return WormPainter(count: count, offset: offset, effect: this);
  }
}
