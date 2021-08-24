import 'package:esouq/Models/AppData.dart';
import 'package:esouq/Tools/GeneralTools.dart';
import 'package:esouq/widgets/CategoriesCard.dart';
import 'package:esouq/widgets/HomeImagesCarousel.dart';
import 'package:esouq/widgets/PublicProductCard.dart';
import 'package:esouq/widgets/SearchView.dart';
import 'package:esouq/widgets/Sections.dart';
import 'package:esouq/widgets/TopSellProductItem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nb_utils/nb_utils.dart';

import 'SearchScreen.dart';

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

  ScrollController _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: NestedScrollView(
            floatHeaderSlivers: true,
            scrollDirection: Axis.vertical,
            controller: _controller,
            physics: BouncingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  actions: [
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        showSearch(
                            context: context,
                            delegate: SearchScreen(hintText: "Searching in"));
                        // showSearch(context: context, delegate: CSSearchBar(hintText: "Searching in $CSAppName", listData: getCloudboxList));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.camera_alt_outlined),
                      onPressed: () {
                        showSearch(
                            context: context,
                            delegate: SearchScreen(hintText: "Searching in"));
                        // showSearch(context: context, delegate: CSSearchBar(hintText: "Searching in $CSAppName", listData: getCloudboxList));
                      },
                    )
                  ],
                  expandedHeight: 120,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    title: Text("eSouQ", style: boldTextStyle(size: 20)),
                  ),
                ),
              ];
            },
            body: ListView(
                controller: _controller,
                physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        //SearchBar(),
                        Center(
                          child: HomeSliderSection(sectionData: [
                            'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
                            'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
                            'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
                            'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
                            'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
                            'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
                            'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
                          ]),
                        ),
                        SizedBox(height: 15),
                        Section('Categories', false),
                        SizedBox(height: 15),
                        Container(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 5.0, 10.0, 5.0),
                              child: Wrap(
                                spacing: 10.0,
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
                        ),
                        SizedBox(height: 15),
                        Section('Top sell', true),
                        SizedBox(height: 10),
                        Container(
                          height: GeneralTools(context).getHeight() * 0.33,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            scrollDirection: Axis.horizontal,
                            itemCount: AppData.productList.length,
                            itemBuilder: (_, i) =>
                                TopSellItems(item: AppData.productList[i]),
                            separatorBuilder: (_, __) => SizedBox(width: 10),
                          ),
                        ),
                        SizedBox(height: 15),
                        Section('New Arrivals', true),
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: StaggeredGridView.countBuilder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            scrollDirection: Axis.vertical,
                            crossAxisCount: 2,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                            itemCount: AppData.productList.length,
                            itemBuilder: (_, i) => PublicProductCard(
                              item: AppData.productList[i],
                            ),
                            staggeredTileBuilder: (int index) =>
                                new StaggeredTile.fit(1),
                          ),
                        ),
                      ])
                ])));
  }
}
