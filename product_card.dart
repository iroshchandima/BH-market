import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:iconsax/iconsax.dart';
import 'appstyle.dart';

class ProductCart extends StatefulWidget {
  const ProductCart(
      {super.key,
      required this.prices,
      required this.brand,
      required this.id,
      required this.name,
      required this.image,
      required this.color});

  final String prices;
  final String brand;
  final String id;
  final String name;
  final String image;
  final String color;

  @override
  State<ProductCart> createState() => _ProductCartState();
}

class _ProductCartState extends State<ProductCart> {
  @override
  Widget build(BuildContext context) {
    bool selected = true;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 20, 0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * 0.5,
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
                    height: MediaQuery.of(context).size.height * 0.23,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(widget.image)),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: GestureDetector(
                      onTap: null,
                      child: const Icon(
                        MaterialCommunityIcons.heart_outline,
                        color: Colors.black54,
                      ),
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
                          widget.name, style: appstyle1(25, Colors.black, FontWeight.bold, 1.5,),
                        ),
                       ],),
                    Row(
                      children: [
                        Text(
                          widget.brand, style: appstyle1(18, Colors.blue, FontWeight.w500, 1.5,),),
                        SizedBox(width: 10,),
                        const Icon(Iconsax.verify5,color: Colors.blue,size: 20),
                      ],
                    ),

                    Row(
                      children: [
                        Text('Price :  ',
                          style: appstyle(15, Colors.grey, FontWeight.w500),),
                        Text(widget.prices,
                          style: appstyle(20, Colors.black, FontWeight.w600,),),
                      ],
                    ),
                    Row(
                      children: [
                        Text('Color  :  ',
                          style: appstyle(15, Colors.grey, FontWeight.w500),),
                        Text(widget.color ,
                          style: appstyle(15, Colors.blueAccent, FontWeight.w600,),),
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

