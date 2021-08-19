import 'package:esouq/Models/ProductModel.dart';
import 'package:esouq/Tools/GeneralTools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class TopSellItems extends StatelessWidget {
  final Product item;
  const TopSellItems({
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
    child: Container(
        width: GeneralTools.width * 0.25,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black26, width: 0.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: item.hashCode,
                  child: ClipRRect(
                    borderRadius:BorderRadius.only(topLeft:Radius.circular(15),topRight:Radius.circular(15),bottomLeft:Radius.circular(0),bottomRight:Radius.circular(0)),
                      child:Image.asset(
                    item.image,
                    height: constraints.maxHeight * 0.45,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
                ),
                Stack(
                    alignment: AlignmentDirectional.bottomStart,
                    children:[Container(
                    padding: const EdgeInsets.all(5),
                    child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:[Text(item.name, style: TextStyle(fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,))
               ,Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: Text(
                      '\$${item.price}',
                      style: TextStyle(fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,).copyWith(fontWeight: FontWeight.w700),
                    )),
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Icon(
                        Icons.more_vert,
                        size: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),Text(
                          getLeftProduct(item.inStock, item.ordered),
                            style: TextStyle(fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,).copyWith(fontWeight: FontWeight.w700),
                        ),
                ]))])],
            );
          },
        ),
      ),);
  }


}