import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'appstyle.dart';

class NewItem extends StatelessWidget {
  const NewItem({
    super.key, required this.image, required this.price, required this.date,
  });

  final String image;
  final String price;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 0.6,
                spreadRadius: 1,
                offset: Offset(1, 1),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      image:DecorationImage(
                          image:
                          AssetImage(image,)),),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                      onTap: null,
                      child: const Icon(MaterialCommunityIcons.heart_outline,color: Colors.black54,),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          date, style: appstyle1(25, Colors.black, FontWeight.bold, 1.5,),
                        ),
                        Text(' product',
                          style: appstyle(25, Colors.black, FontWeight.w500),),],),
                    Row(
                      children: [
                        Text(price,
                          style: appstyle(20, Colors.black, FontWeight.w600,),),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
