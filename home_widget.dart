
import 'package:bh_int/Product_run/snakers/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../models/sneaker_model.dart';
import '../product_ui/productPage.dart';
import '../product_ui/product_by_cart.dart';
import 'appstyle.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required Future<List<Sneakers>> product, required this.tabIndex,
  }) : _product = product;

  final Future<List<Sneakers>> _product;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> productByCat(
                            tabIndex: tabIndex,
                          )));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Our product",style: appstyle(23, Colors.black, FontWeight.w700),),
                            SizedBox(width: 85,),
                            Text(
                              'Show All',
                              style: appstyle(
                                  18,
                                  Colors.blueAccent,
                                  FontWeight.w500),
                            ),
                            Icon(
                              AntDesign.caretright,
                              size: 18,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.405,
                child:
                FutureBuilder<
                    List<Sneakers>>(
                    future: _product,
                    builder: (context, snapshot) {
                      if (snapshot
                          .connectionState ==
                          ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot
                          .hasError) {
                        return Text(
                            'Error ${snapshot.error}');
                      } else {
                        final product = snapshot.data;
                        return ListView.builder(
                            itemCount:3,
                            scrollDirection:
                            Axis.horizontal,
                            itemBuilder:
                                (context, index) {
                              final item = snapshot.data![index];
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => productPage(id: item.id, category: item.category,price: item.price, name: item.name, brand: item.brand,)));
                                },
                                child: ProductCart(
                                    prices: item.price,
                                    name: item.name,
                                    id: item.id,
                                    brand: item.brand,
                                    image: item.image[1],
                                    color : item.color
                                ),
                              );
                            });
                      }
                    })),
          ],
        ),
      ],
    );
  }
}