import 'package:esouq/Models/AppData.dart';
import 'package:esouq/Models/ProductModel.dart';
import 'package:esouq/Models/category.dart';
import 'package:esouq/Tools/AppExtension.dart';
import 'package:esouq/Tools/GeneralTools.dart';
import 'package:esouq/Screens/MainHome/Widgets/CategoriesCard.dart';
import 'package:esouq/Screens/MainHome/Widgets/HomeImagesCarousel.dart';
import 'package:esouq/Screens/MainHome/Widgets/PublicProductCard.dart';
import 'package:esouq/widgets/Sections.dart';
import 'package:esouq/Screens/MainHome/Widgets/TopSellProductItem.dart';
import 'package:flutter/cupertino.dart';
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

  List<Category> catlist = [];
  List<String> banners = [];
  List<Product> newestProducts = [];
  List<Product> featuredProducts = [];

  onCategorySelected(category) {
    /*Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CategoryScreen(),
      ),
    );*/
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    loadCategory().then((categories) {
      setState(() {
        catlist.clear();
        catlist.addAll(categories);
      });
    }).catchError((error) {
      toast(error);
    });
    List<Product> products = await loadProducts();
    List<Product> featured = [];
    products.forEach((product) {
      if (product.featured!) {
        featured.add(product);
      }
    });
    List<String> banner = [];
    for (var i = 1; i < 7; i++) {
      banner
          .add("assets/shophop/img/products/banners/b" + i.toString() + ".jpg");
    }
    setState(() {
      newestProducts.clear();
      featuredProducts.clear();
      banners.clear();
      banners.addAll(banner);
      newestProducts.addAll(products);
      featuredProducts.addAll(featured);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  ScrollController _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CustomScrollView(slivers: <Widget>[
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
              onPressed: () {},
            )
          ],
          expandedHeight: 120,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: RichText(
              text: TextSpan(
                text: 'eSouQ ',
                style: boldTextStyle(size: 20),
                children: <TextSpan>[
                  TextSpan(
                      text: 'smart shopping',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Colors.black26)),
                ],
              ),
            ),
            //background: Image.asset('assets/'),
          ),
          backgroundColor: Colors.white),
      SliverToBoxAdapter(
          child: newestProducts.isNotEmpty ? bodyContainer() : Container())
    ]));
  }

  Widget bodyContainer() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          //SearchBar(),
          Center(
            child: HomeSliderSection(banners: banners),
          ),
          SizedBox(height: 15),
          Section('Categories', false),
          SizedBox(height: 15),
          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                child: Wrap(
                  spacing: 10.0,
                  children: catlist.map((c) {
                    return CategoryCard(
                      title: c.name!,
                      iconPath: c.image!,
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
              itemCount: featuredProducts.length,
              itemBuilder: (_, i) => TopSellItems(item: featuredProducts[i]),
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
              itemCount: newestProducts.length,
              itemBuilder: (_, i) => PublicProductCard(
                item: newestProducts[i],
              ),
              staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
            ),
          ),
        ]);
  }
}
