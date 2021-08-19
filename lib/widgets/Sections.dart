import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String title;
  final bool isVisible;

  const Section(
      this.title,
      this.isVisible,{
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 17.0, height: 1,fontWeight: FontWeight.bold),
              ),
              InkWell(
                child: isVisible? Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      'View all',
                      style: TextStyle(
                        fontSize: 12.0,
                        height: 1,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ) : SizedBox(height: 12,),
                onTap: () {},
              )
            ],
          ),
        ),

      ],
    );
  }
}