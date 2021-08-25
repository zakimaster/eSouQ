import 'package:esouq/Models/ProductModel.dart';
import 'package:esouq/Tools/GeneralTools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PublicProductCard extends StatelessWidget {
  final Product item;
  const PublicProductCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  void onTap(BuildContext context) {
    /*Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => ItemDetailsSreen(item: item)));*/
  }
  String getLeftProduct(int inStock,int ordered){
    int sub = inStock - ordered;
    String t = 'Left $sub';
    return t;
  }

  @override
  Widget build(BuildContext context) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
    children: <Widget>[
      Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(item.image, fit: BoxFit.cover),
          ),
          Material(
            color: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius:
              BorderRadius.only(bottomRight: Radius.circular(8)),
            ),
            child: Icon(Icons.wifi_calling_sharp, color: Colors.black.withOpacity(0.8)),
          )
        ],
      ),
      buildInfo(context),
    ],
  );

  Widget buildInfo(BuildContext context) => Container(
    margin: EdgeInsets.fromLTRB(5,0,5,10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 4),
        Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text('\$${item.price}', style: Theme.of(context).textTheme.caption),
      ],
    ),
  );


}