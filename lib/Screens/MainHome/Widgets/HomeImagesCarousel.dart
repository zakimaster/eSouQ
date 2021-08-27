import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../widgets/SliderIndicator/effects/worm_effect.dart';
import '../../../widgets/SliderIndicator/smooth_page_indicator.dart';

class HomeSliderSection extends StatefulWidget {
  final List<String> banners;

  const HomeSliderSection({Key? key, required this.banners}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeSliderSectionState();
  }
}

class _HomeSliderSectionState extends State<HomeSliderSection> {
  String reason = '';
  int _current = 0;
  final CarouselController _controller = CarouselController();

  void onPageChange(int index, CarouselPageChangedReason changeReason) {
    setState(() {
      reason = changeReason.toString();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.banners
        .map((item) => Container(
              child: Container(
                margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Image.network(item, fit: BoxFit.cover, width: 1000.0),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                          ),
                        ),
                      ],
                    )),
              ),
            ))
        .toList();

    if (widget.banners.isEmpty) {
      return const SizedBox();
    }
    //final list = banners.items;
    return Stack(fit: StackFit.passthrough, children: <Widget>[
      Container(
        height: 150.0,
        child: CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
              scrollDirection: Axis.horizontal,
            )),
      ),
      Positioned(
          bottom: 12.0,
          right: 0.0,
          left: 0.0,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            AnimatedSmoothIndicator(
              5,
              activeIndex: _current,
              count: widget.banners.length,
              effect: WormEffect(offset: 5),
              textDirection: TextDirection.ltr,
              onDotClicked: (int index) {},
            ),
          ]))
    ]);
  }
}
