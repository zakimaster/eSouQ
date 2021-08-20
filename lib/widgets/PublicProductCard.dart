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
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: Stack(
        children: [
          ClipRRect(
            child: Image.asset(item.image),
            borderRadius: BorderRadius.circular(10),
          ),
          Positioned(
            bottom: 5,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  '${item.price}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          )
        ],
      ),);
  }


}