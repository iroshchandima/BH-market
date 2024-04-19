
import 'package:bh_int/Product_run/product_ui/placeproduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

import '../controller/Product_provider.dart';
import '../models/sneaker_model.dart';
import '../services/helper.dart';
import '../snakers/Check_out_Btn.dart';
import '../snakers/appstyle.dart';


class productPage extends StatefulWidget {
  const productPage({super.key, required this.id, required this.category, required this.price, required this.name, required this.brand});

  final String id;
  final String category;
  final String price;
  final String name;
  final String brand;

  @override
  State<productPage> createState() => _productPageState();
}

class _productPageState extends State<productPage> {


  late Future<Sneakers> _sneaker;
  final PageController pageController = PageController();

  void getItems(){
    _sneaker = Helper().getProductSneakersById(widget.id);
  }

  @override
  void initState() {
    super.initState();
    getItems();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      FutureBuilder<Sneakers>(
          future: _sneaker,
          builder: (context, snapshot) {
            if (snapshot
                .connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error ${snapshot.error}');
            } else {
              final sneaker = snapshot.data!;
              return Consumer<ProductNotifier>(
                  builder: (context, productNotifier, child) {
                    return CustomScrollView(
                      slivers: [
                        SliverAppBar(
                            automaticallyImplyLeading: false,
                            leadingWidth: 100,

                            title: Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(AntDesign.close),
                                  ),

                                  GestureDetector(
                                    onTap: null,
                                    child: const Icon(Ionicons.ellipsis_horizontal),
                                  ),
                                ],
                              ),
                            ),

                            pinned: true,
                            snap: false,
                            floating: true,
                            backgroundColor: Colors.transparent,
                            expandedHeight: MediaQuery.of(context).size.height,
                            flexibleSpace: FlexibleSpaceBar(
                              background: Stack(
                                children: [
                                  SizedBox(height: MediaQuery.of(context).size.height * 0.7,
                                    width: MediaQuery.of(context).size.width,
                                    child: PageView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: sneaker.image.length,
                                        controller: pageController,
                                        onPageChanged: (page) {
                                          productNotifier.activepage = page;
                                        },
                                        itemBuilder: (context, int index) {
                                          return Stack(
                                            children: [
                                              Container(
                                                height: MediaQuery.of(context).size.height * 0.4,
                                                width: MediaQuery.of(context).size.width*1,
                                                color: Colors.grey.shade300,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(0),
                                                  child: Image.asset(sneaker.image[index],fit: BoxFit.contain,),
                                                ),
                                              ),
                                              Positioned(
                                                top: MediaQuery.of(context).size.height * 0.1,
                                                right: 20,
                                                child: Icon(AntDesign.hearto,
                                                  color: Colors.black,),),
                                              Padding(
                                                padding: const EdgeInsets.only(top:310),
                                                child: Positioned(bottom: 0, right: 0, left: 0,
                                                  height: MediaQuery.of(context).size.height * 0.3,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: List<Widget>.generate(
                                                      sneaker.image.length, (index) =>
                                                        Padding(
                                                          padding: EdgeInsets.symmetric(horizontal: 4),
                                                          child: CircleAvatar(radius: 5,
                                                            backgroundColor: productNotifier.activepage != index ? Colors.grey
                                                                : Colors.blue,
                                                          ),
                                                        ),),

                                                  ),),
                                              ),
                                            ],
                                          );
                                        }
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 330.0),
                                    child: Positioned(
                                      bottom: 30,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                        child: Container(
                                          height: MediaQuery.of(context).size.height * 8,
                                          width: MediaQuery.of(context).size.width,
                                          color: Colors.white,
                                          child: Padding(
                                            padding: EdgeInsets.all(12),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(

                                                  children: [
                                                    Text(
                                                      sneaker.name,
                                                      style: TextStyle(fontSize: 35, color: Colors.red, fontWeight: FontWeight.bold),
                                                    ),
                                                    SizedBox(width: 15,),
                                                    RatingBar.builder(
                                                        initialRating:4,
                                                        minRating:1,
                                                        direction:Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount:5,
                                                        itemSize:25,
                                                        itemPadding:EdgeInsets.symmetric(horizontal: 1),
                                                        itemBuilder:(context,_) =>
                                                            Icon(Icons.star,
                                                              size: 25,
                                                              color: Colors.black,),
                                                        onRatingUpdate:(rating){

                                                        }
                                                    ),
                                                    SizedBox(width: 70,),
                                                  ],
                                                ),
                                                SizedBox(height: 10,),

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
                                                    Text('Color : ',style: appstyle(20, Colors.grey, FontWeight.w600),),
                                                    Text(sneaker.color,style: appstyle(20, Colors.blueAccent, FontWeight.w600),),
                                                  ],
                                                ),

                                                Row(
                                                  children: [
                                                    Text('Price : ' ,style: appstyle(30, Colors.black45, FontWeight.normal),),
                                                    Text(
                                                      sneaker.price,
                                                      style: TextStyle(fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600),
                                                    ),

                                                  ],
                                                ),

                                                SizedBox(height: 10,),
                                                Row(
                                                  children: [

                                                    SizedBox(width: 20,),
                                                  ],
                                                ),
                                                SizedBox(height: 5,),

                                                Row(
                                                  children: [
                                                    Text('Warranty Period : ',style: appstyle(23, Colors.black54, FontWeight.w600),),
                                                    Text(
                                                      sneaker.warrant,
                                                      style: TextStyle(fontSize: 23, color: Colors.black, fontWeight: FontWeight.w600),
                                                    ),
                                                  ],
                                                ),


                                                Row(
                                                  children: [
                                                    Text('Category : ',style: appstyle(23, Colors.black54, FontWeight.w600),),
                                                    Text(
                                                      sneaker.category,
                                                      style: TextStyle(fontSize: 23, color: Colors.black, fontWeight: FontWeight.w600),
                                                    ),
                                                  ],
                                                ),

                                                Row(
                                                  children: [
                                                    Text('Size : ',style: appstyle(23, Colors.black54, FontWeight.w600),),
                                                    Text(
                                                      sneaker.size,
                                                      style: TextStyle(fontSize: 23, color: Colors.black, fontWeight: FontWeight.w600),
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(height: 10,),
                                                Text('About',style: appstyle(23, Colors.black, FontWeight.w600),),
                                                Text(
                                                  sneaker.about,
                                                  style: TextStyle(fontSize: 20, color: Colors.black54, fontWeight: FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Align(
                                                  alignment: Alignment.bottomCenter,
                                                  child: Padding(padding: EdgeInsets.all(0),
                                                    child: CheckoutButton(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(builder: (context) => Placeproduct(id: sneaker.id,price: sneaker.price, name: sneaker.name,)),
                                                        );
                                                      },
                                                      label: "Place Order",
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),

                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                      ],
                    );
                  }
              );
            }
          }),);
  }
}

