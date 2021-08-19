

import 'package:esouq/Models/AppData.dart';
import 'package:esouq/Tools/GeneralTools.dart';
import 'package:esouq/themes/Theme.dart';
import 'package:esouq/themes/light_color.dart';
import 'package:esouq/widgets/CategoriesCard.dart';
import 'package:esouq/widgets/HomeImagesCarousel.dart';
import 'package:esouq/widgets/SearchView.dart';
import 'package:esouq/widgets/Sections.dart';
import 'package:esouq/widgets/TopSellProductItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int photoIndex = 0;

  onCategorySelected(category) {
    /*Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryScreen(),
      ),
    );*/
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SearchBar(),Center(child: HomeSliderSection(sectionData: ['https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
              'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
              'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
              'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
              'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
              'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
              'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',]),),
            SizedBox(height: 15),Section(
              'Categories', false
            ),SizedBox(height: 15),Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Wrap(
                    spacing: 15.0,
                    children: AppData.categories.map((c) {
                      return CategoryCard(
                        title: c.title,
                        iconPath: c.iconPath,
                        onTap: () {
                          onCategorySelected(c);
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),SizedBox(height: 15),Section(
                'Top sell', true
            ),SizedBox(height: 15),Container(
              height: GeneralTools(context).getHeight() * 0.25,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          scrollDirection: Axis.horizontal,
          itemCount: AppData.productList.length,
          itemBuilder: (_, i) => TopSellItems(item: AppData.productList[i]),
          separatorBuilder: (_, __) => SizedBox(width: 10),
        ),
      )],
        ),
      ),
    );
  }

}
