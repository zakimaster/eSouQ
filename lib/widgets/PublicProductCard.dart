import 'package:esouq/Models/ProductModel.dart';
import 'package:esouq/Tools/GeneralTools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PublicProductItems extends StatelessWidget {
  final Product item;
  const PublicProductItems({
    Key? key,
    required this.item,
  }) : super(key: key);

  void onTap(BuildContext context) {
    /*Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => ItemDetailsSreen(item: item)));*/
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        width: GeneralTools.width * 0.25,
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black26, width: 1.0),
          borderRadius: BorderRadius.circular(15),
        ),
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: item.hashCode,
                  child: Image.asset(
                    item.image,
                    height: constraints.maxHeight * 0.4,
                  ),
                ),
                SizedBox(height: 10),
                Text(item.name, style: TextStyle(fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,)),
                Text(item.description, style: TextStyle(fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,)),
                Spacer(),Wrap(direction: Axis.horizontal,
                    children :[ Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$${item.price}',
                          style: TextStyle(fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,).copyWith(fontWeight: FontWeight.w700),
                        ),
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),]),
              ],
            );
          },
        ),
      ),
    );
  }
}