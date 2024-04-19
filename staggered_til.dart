import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'appstyle.dart';

class StaggerTile extends StatefulWidget {
  const StaggerTile(
      {super.key,
      required this.image,
      required this.name,
      required this.prices,
      required this.brand,
      required this.color,
      required this.id});
  final String id;
  final String image;
  final String name;
  final String prices;
  final String brand;
  final String color;

  @override
  State<StaggerTile> createState() => _StaggerTileState();
}

class _StaggerTileState extends State<StaggerTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.image),
            Container(
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.name,
                        style: appstyle1(
                          19,
                          Colors.black,
                          FontWeight.bold,
                          1.5,
                        ),
                      ),
                       ]
                   ),
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
                          Text(
                            'Price :  ',
                            style: appstyle(15, Colors.grey, FontWeight.w500),
                          ),
                          Text(
                            widget.prices,
                            style: appstyle(
                              15,
                              Colors.black,
                              FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Color:  ',
                            style: appstyle(15, Colors.grey, FontWeight.w500),
                          ),
                          Text(
                            widget.color,
                            style: appstyle(
                              15,
                              Colors.blueAccent,
                              FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}