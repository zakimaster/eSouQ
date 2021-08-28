import 'dart:convert';

import 'package:esouq/Models/ProductModel.dart';
import 'package:esouq/Models/ReviewModel.dart';
import 'package:esouq/Tools/AppConstants.dart';
import 'package:esouq/Tools/AppExtension.dart';
import 'package:esouq/Tools/AppSizes.dart';
import 'package:esouq/Tools/AppStrings.dart';
import 'package:esouq/themes/colors.dart';
import 'package:esouq/widgets/GeneraleWidgets.dart';
import 'package:esouq/widgets/LinearPercentIndicator.dart';
import 'package:esouq/widgets/RatingBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'OrderSummaryScreen.dart';

// ignore: must_be_immutable
class PublicProductDetail extends StatefulWidget {
  static String tag = '/PublicProductDetail';
  Product? product;

  PublicProductDetail({this.product});

  @override
  PublicProductDetailState createState() => PublicProductDetailState();
}

class PublicProductDetailState extends State<PublicProductDetail> {
  var position = 0;
  bool isExpanded = false;
  var selectedColor = -1;
  var selectedSize = -1;
  double fiveStar = 0;
  double fourStar = 0;
  double threeStar = 0;
  double twoStar = 0;
  double oneStar = 0;
  List<Review> list = [];
  bool autoValidate = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var products = await loadProducts();
    setState(() {
      list.clear();
      list.addAll(products);
    });
    setRating();
  }

  Future<List<Review>> loadProducts() async {
    String jsonString = await loadContentAsset('assets/data/reviews.json');
    final jsonResponse = json.decode(jsonString);
    return (jsonResponse as List).map((i) => Review.fromJson(i)).toList();
  }

  setRating() {
    fiveStar = 0;
    fourStar = 0;
    threeStar = 0;
    twoStar = 0;
    oneStar = 0;
    list.forEach((review) {
      switch (review.rating) {
        case 5:
          fiveStar++;
          break;
        case 4:
          fourStar++;
          break;
        case 3:
          threeStar++;
          break;
        case 2:
          twoStar++;
          break;
        case 1:
          oneStar++;
          break;
      }
    });
    fiveStar = (fiveStar * 100) / list.length;
    fourStar = (fourStar * 100) / list.length;
    threeStar = (threeStar * 100) / list.length;
    twoStar = (twoStar * 100) / list.length;
    oneStar = (oneStar * 100) / list.length;
    print(fiveStar);
  }

  @override
  void dispose() {
    changeStatusColor(Colors.white);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(Colors.transparent);

    var width = MediaQuery.of(context).size.width;

    var sliderImages = Container(
      height: 380,
      child: PageView.builder(
        itemCount: widget.product!.images!.length,
        itemBuilder: (context, index) {
          return Image.asset(
              "assets/shophop/img/products" +
                  widget.product!.images![index].src!,
              width: width,
              height: width * 1.05,
              fit: BoxFit.cover);
        },
        onPageChanged: (index) {
          position = index;
          setState(() {});
        },
      ),
    );

    var productInfo = Padding(
      padding: EdgeInsets.all(14),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              text(widget.product!.name,
                  textColor: appTextColorPrimary,
                  fontFamily: ts_medium,
                  fontSize: ts_normal),
              text(
                widget.product!.on_sale!
                    ? widget.product!.sale_price.toCurrencyFormat()
                    : widget.product!.price.toCurrencyFormat(),
                textColor: appColorPrimary,
                fontSize: ts_normal,
                fontFamily: ts_medium,
              )
            ],
          ),
          SizedBox(height: spacing_standard),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          left: 12, right: 12, top: 0, bottom: 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(spacing_standard_new)),
                        color: double.parse(widget.product!.average_rating!) < 2
                            ? Colors.red
                            : double.parse(widget.product!.average_rating!) < 4
                                ? Colors.orange
                                : Colors.green,
                      ),
                      child: Row(
                        children: <Widget>[
                          text("3.0", textColor: appWhite),
                          SizedBox(width: spacing_control_half),
                          Icon(Icons.star, color: appWhite, size: 12),
                        ],
                      ),
                    ),
                    SizedBox(width: spacing_standard),
                    text(list.length.toString() + " Reviewer")
                  ],
                ),
              ),
              Text(
                widget.product!.regular_price.toString().toCurrencyFormat()!,
                style: TextStyle(
                    color: appTextColorSecondary,
                    fontFamily: font_regular,
                    fontSize: ts_medium_large,
                    decoration: TextDecoration.lineThrough),
              )
            ],
          )
        ],
      ),
    );

    var colorList = [];
    widget.product!.attributes!.forEach((element) {
      if (element.name == 'Color') colorList.addAll(element.options!);
    });

    var colors = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: colorList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            selectedColor = index;
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.all(7),
            margin: EdgeInsets.only(right: spacing_large),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: appTextColorPrimary, width: 0.5),
                color: getColorFromHex(colorList[index])),
            child: selectedColor == index
                ? Icon(Icons.done, color: appWhite, size: 12)
                : Container(),
          ),
        );
      },
    );

    var sizeList = [];
    widget.product!.attributes!.forEach((element) {
      if (element.name == 'Size') sizeList.addAll(element.options!);
    });

    var brandList = [];
    widget.product!.attributes!.forEach((element) {
      if (element.name == 'Brand') brandList.addAll(element.options!);
    });

    var bands = "";
    brandList.forEach((brand) {
      bands = bands + brand.toString() + ", ";
    });

    var sizes = ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: sizeList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            selectedSize = index;
            setState(() {});
          },
          child: Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(right: spacing_large),
            decoration: selectedSize == index
                ? BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: appTextColorPrimary, width: 0.5),
                    color: appColorPrimary)
                : BoxDecoration(),
            child: Center(
                child: text(sizeList[index],
                    textColor:
                        selectedSize == index ? appWhite : appTextColorPrimary,
                    fontSize: ts_medium_large,
                    fontFamily: ts_medium)),
          ),
        );
      },
    );

    var reviews = ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: list.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(bottom: spacing_standard_new),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding:
                        EdgeInsets.only(left: 12, right: 12, top: 1, bottom: 1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(spacing_standard_new)),
                        color: list[index].rating! < 2
                            ? Colors.red
                            : list[index].rating! < 4
                                ? Colors.orange
                                : Colors.green),
                    child: Row(
                      children: <Widget>[
                        text(list[index].rating.toString(),
                            textColor: appWhite),
                        SizedBox(width: spacing_control_half),
                        Icon(Icons.star, color: appWhite, size: 12)
                      ],
                    ),
                  ),
                  SizedBox(width: spacing_standard_new),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        text(list[index].name,
                            textColor: appTextColorPrimary,
                            fontSize: ts_medium,
                            fontFamily: ts_medium),
                        text(list[index].review, fontSize: ts_medium),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: spacing_standard),
              Image.asset(
                  "assets/shophop/img/products" +
                      widget.product!.images![0].src!,
                  width: 90,
                  height: 110,
                  fit: BoxFit.fill),
              SizedBox(height: spacing_standard),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(4),
                        margin: EdgeInsets.only(right: spacing_standard),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: list[index].verified!
                                ? Colors.green
                                : Colors.grey.withOpacity(0.5)),
                        child: Icon(
                            list[index].verified! ? Icons.done : Icons.clear,
                            color: appWhite,
                            size: 14),
                      ),
                      text(
                          list[index].verified!
                              ? lbl_verified
                              : lbl_not_verified,
                          textColor: appTextColorPrimary,
                          fontFamily: ts_medium,
                          fontSize: ts_medium)
                    ],
                  ),
                  text("26 June 2019", fontSize: ts_medium)
                ],
              )
            ],
          ),
        );
      },
    );

    var descriptionTab = SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(spacing_standard_new),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                text(widget.product!.description,
                    maxLine: 3, isLongText: isExpanded, fontSize: 16.0),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.all(spacing_control_half),
                    color: appWhite,
                    child: text(isExpanded ? "Read Less" : "Read More",
                        textColor: appTextColorPrimary, fontSize: ts_medium),
                  ),
                  onTap: () {
                    isExpanded = !isExpanded;
                    setState(() {});
                  },
                )
              ],
            ),
            SizedBox(height: spacing_standard_new),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 40,
                    decoration:
                        BoxDecoration(border: Border.all(color: appWhite)),
                    padding: EdgeInsets.only(
                        left: spacing_middle, right: spacing_middle),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            style: TextStyle(
                                fontSize: ts_medium,
                                color: appTextColorPrimary),
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Pincode"),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 25,
                          color: appWhite,
                          margin: EdgeInsets.only(
                              left: spacing_middle, right: spacing_middle),
                        ),
                        text("Check Availability",
                            textColor: appTextColorPrimary, fontSize: ts_small)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: spacing_standard_new,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    text(lbl_delivered_by, fontSize: ts_medium),
                    text("25 June, Monday",
                        textColor: appTextColorPrimary,
                        fontSize: ts_medium,
                        fontFamily: ts_medium)
                  ],
                )
              ],
            ),
            SizedBox(height: spacing_standard_new),
            text(lbl_colors,
                textColor: appTextColorPrimary,
                fontFamily: ts_medium,
                fontSize: ts_medium_large),
            Container(height: 50, child: colors),
            sizeList.isNotEmpty
                ? text(lbl_size,
                    textColor: appTextColorPrimary,
                    fontFamily: ts_medium,
                    fontSize: ts_medium_large)
                : SizedBox(),
            Container(height: 50, child: sizes)
          ],
        ),
      ),
    );
    var moreInfoTab = SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 16, top: 20, right: 16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                          top: spacing_control, bottom: spacing_control),
                      color: appLayout_background,
                      child: text(lbl_length,
                          textColor: appTextColorPrimary,
                          fontFamily: ts_medium,
                          fontSize: ts_medium_large)),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          top: spacing_control,
                          bottom: spacing_control,
                          left: spacing_large),
                      color: appLayout_background,
                      child: text(widget.product!.dimensions!.length! + " cm",
                          textColor: appTextColorPrimary,
                          fontFamily: ts_medium,
                          fontSize: ts_medium_large)),
                )
              ],
            ),
            SizedBox(
              height: spacing_standard,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                          top: spacing_standard, bottom: spacing_standard),
                      color: appLayout_background,
                      child: text(lbl_height,
                          textColor: appTextColorPrimary,
                          fontFamily: ts_medium,
                          fontSize: ts_medium_large)),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          top: spacing_standard,
                          bottom: spacing_standard,
                          left: spacing_large),
                      color: appLayout_background,
                      child: text(widget.product!.dimensions!.height! + " cm",
                          textColor: appTextColorPrimary,
                          fontFamily: ts_medium,
                          fontSize: ts_medium_large)),
                )
              ],
            ),
            SizedBox(
              height: spacing_standard,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                          top: spacing_standard, bottom: spacing_standard),
                      color: appLayout_background,
                      child: text(lbl_width,
                          textColor: appTextColorPrimary,
                          fontFamily: ts_medium,
                          fontSize: ts_medium_large)),
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(
                          top: spacing_standard,
                          bottom: spacing_standard,
                          left: spacing_large),
                      color: appLayout_background,
                      child: text(widget.product!.dimensions!.width! + " cm",
                          textColor: appTextColorPrimary,
                          fontFamily: ts_medium,
                          fontSize: ts_medium_large)),
                )
              ],
            ),
            SizedBox(
              height: spacing_standard,
            ),
            IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(
                            top: spacing_standard, bottom: spacing_standard),
                        color: appLayout_background,
                        child: text(lbl_brand,
                            textColor: appTextColorPrimary,
                            fontFamily: ts_medium,
                            fontSize: ts_medium_large)),
                  ),
                  Expanded(
                    child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                            top: spacing_standard,
                            bottom: spacing_standard,
                            left: spacing_large),
                        color: appLayout_background,
                        child: text(bands,
                            textColor: appTextColorPrimary,
                            fontFamily: ts_medium,
                            fontSize: ts_medium_large,
                            isLongText: true)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
    var reviewsTab = SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 60),
      child: Container(
        margin: EdgeInsets.only(left: 16, top: 20, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(spacing_standard_new),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: width * 0.33,
                    width: width * 0.33,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.1)),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        reviewText("3.0",
                            size: 28.0, fontSize: 30.0, fontFamily: font_bold),
                        text(list.length.toString() + " Reviews",
                            fontSize: ts_medium),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: spacing_standard_new,
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            reviewText(5),
                            ratingProgress(fiveStar, Colors.green)
                          ],
                        ),
                        SizedBox(
                          height: spacing_control_half,
                        ),
                        Row(
                          children: <Widget>[
                            reviewText(4),
                            ratingProgress(fourStar, Colors.green)
                          ],
                        ),
                        SizedBox(
                          height: spacing_control_half,
                        ),
                        Row(
                          children: <Widget>[
                            reviewText(3),
                            ratingProgress(threeStar, Colors.amber)
                          ],
                        ),
                        SizedBox(
                          height: spacing_control_half,
                        ),
                        Row(
                          children: <Widget>[
                            reviewText(2),
                            ratingProgress(twoStar, Colors.amber)
                          ],
                        ),
                        SizedBox(
                          height: spacing_control_half,
                        ),
                        Row(
                          children: <Widget>[
                            reviewText(1),
                            ratingProgress(oneStar, Colors.red)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: spacing_standard_new,
            ),
            Divider(
              height: 1,
            ),
            SizedBox(
              height: spacing_standard_new,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                text(lbl_reviews,
                    textColor: appTextColorPrimary,
                    fontFamily: ts_medium,
                    fontSize: ts_normal),
                MaterialButton(
                  textColor: appColorPrimary,
                  padding: EdgeInsets.only(
                      left: spacing_standard_new,
                      right: spacing_standard_new,
                      top: 0,
                      bottom: 0),
                  child: text(lbl_rate_now,
                      fontSize: ts_medium, textColor: appColorPrimary),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(spacing_large),
                    side: BorderSide(color: appColorPrimary),
                  ),
                  onPressed: () {
                    showRatingDialog(context);
                  },
                )
              ],
            ),
            reviews
          ],
        ),
      ),
    );
    var bottomButtons = Container(
      height: 60,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.7),
            blurRadius: 16,
            spreadRadius: 2,
            offset: Offset(3, 1))
      ], color: appWhite),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: text(lbl_add_to_cart,
                  textColor: appTextColorPrimary,
                  fontSize: ts_medium_large,
                  fontFamily: ts_medium),
              color: appWhite,
              alignment: Alignment.center,
              height: double.infinity,
            ),
          ),
          Expanded(
            child: Container(
              child: text(lbl_buy_now,
                  textColor: appWhite,
                  fontSize: ts_medium_large,
                  fontFamily: ts_medium),
              color: appColorPrimary,
              alignment: Alignment.center,
              height: double.infinity,
            ).onTap(() {
              CheckoutSummaryScreen().launch(context);
            }),
          )
        ],
      ),
    );

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          DefaultTabController(
            length: 3,
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                changeStatusColor(
                    innerBoxIsScrolled ? Colors.white : Colors.transparent);
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 460,
                    floating: false,
                    pinned: true,
                    titleSpacing: 0,
                    backgroundColor: appWhite,
                    iconTheme: IconThemeData(color: appTextColorPrimary),
                    actionsIconTheme: IconThemeData(color: appTextColorPrimary),
                    actions: <Widget>[
                      Container(
                        padding: EdgeInsets.all(spacing_standard),
                        margin: EdgeInsets.only(right: spacing_standard_new),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.1)),
                        child: Icon(Icons.favorite_border,
                            color: appTextColorPrimary, size: 18),
                      ),
                      cartIcon(context, 3)
                    ],
                    title: text(innerBoxIsScrolled ? widget.product!.name : "",
                        textColor: appTextColorPrimary,
                        fontSize: ts_normal,
                        fontFamily: ts_medium),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                        children: <Widget>[
                          sliderImages,
                          productInfo,
                        ],
                      ),
                      collapseMode: CollapseMode.pin,
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: _SliverAppBarDelegate(
                      TabBar(
                        labelColor: appColorPrimary,
                        indicatorColor: appColorPrimary,
                        unselectedLabelColor: appTextColorPrimary,
                        tabs: [
                          Tab(text: lbl_description),
                          Tab(text: lbl_tab_more_info),
                          Tab(text: lbl_reviews),
                        ],
                      ),
                    ),
                    pinned: true,
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  descriptionTab,
                  moreInfoTab,
                  reviewsTab,
                ],
              ),
            ),
          ),
          bottomButtons
        ],
      ),
    );
  }

  Widget reviewText(rating,
      {size = 15.0,
      fontSize = ts_medium_large,
      fontFamily = ts_medium,
      textColor = appTextColorPrimary}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        text(rating.toString(),
            textColor: textColor, fontFamily: fontFamily, fontSize: fontSize),
        SizedBox(width: spacing_control),
        Icon(Icons.star, color: Colors.amber, size: size)
      ],
    );
  }

  Widget ratingProgress(value, color) {
    return Expanded(
      child: LinearPercentIndicator(
        lineHeight: 10.0,
        percent: value / 100,
        linearStrokeCap: LinearStrokeCap.roundAll,
        backgroundColor: Colors.grey.withOpacity(0.2),
        progressColor: color,
      ),
    );
  }

  void showRatingDialog(BuildContext context) {
    showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: boxDecoration(
                        bgColor: appWhite,
                        showShadow: false,
                        radius: spacing_middle),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: text("Review",
                              fontSize: 24.0,
                              fontFamily: font_bold,
                              textColor: appTextColorPrimary),
                        ),
                        Divider(
                          thickness: 0.5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(spacing_large),
                          child: RatingBar(
                            onRatingChanged: (v) {},
                            initialRating: 0.0,
                            emptyIcon: Icon(Icons.star).icon!,
                            filledIcon: Icon(Icons.star).icon!,
                            filledColor: Colors.amber,
                            emptyColor: Colors.grey.withOpacity(0.5),
                            size: 40,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: spacing_large, right: spacing_large),
                          child: Form(
                            key: _formKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: TextFormField(
                              controller: controller,
                              keyboardType: TextInputType.multiline,
                              maxLines: 5,
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Review Filed Required!"
                                    : null;
                              },
                              style: TextStyle(
                                  fontFamily: font_regular,
                                  fontSize: ts_normal,
                                  color: appTextColorPrimary),
                              decoration: new InputDecoration(
                                hintText: 'Describe your experience',
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1),
                                ),
                                filled: false,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(spacing_large),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: MaterialButton(
                                  textColor: appColorPrimary,
                                  child: text(lbl_cancel,
                                      fontSize: ts_normal,
                                      textColor: appColorPrimary),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                    side: BorderSide(color: appColorPrimary),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pop(ConfirmAction.CANCEL);
                                  },
                                ),
                              ),
                              SizedBox(
                                width: spacing_standard_new,
                              ),
                              Expanded(
                                child: MaterialButton(
                                  color: appColorPrimary,
                                  textColor: Colors.white,
                                  child: text(lbl_submit,
                                      fontSize: ts_normal, textColor: appWhite),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                  ),
                                  onPressed: () {
                                    final form = _formKey.currentState!;
                                    if (form.validate()) {
                                      form.save();
                                    } else {
                                      setState(() => autoValidate = true);
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      color: appWhite,
      child: Container(child: _tabBar),
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
