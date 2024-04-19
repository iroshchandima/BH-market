
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../models/sneaker_model.dart';
import '../services/helper.dart';
import '../snakers/appstyle.dart';
import '../snakers/popularproduct.dart';


class productByCat extends StatefulWidget {
  const productByCat({super.key,  this.tabIndex});

  final int? tabIndex;

  @override
  State<productByCat> createState() => _productByCatState();
}

class _productByCatState extends State<productByCat> with TickerProviderStateMixin {
  late final TabController _tabController =
  TabController(length: 1, vsync: this);

  late Future<List<Sneakers>> _product;

  void getproduct() {
    _product = Helper().getProductSneakers();
  }

  @override
  void initState() {
    super.initState();
    getproduct();
  }

  double _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height*1.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/image/success_celebration_800x600 - Copy.gif"),
                    fit: BoxFit.fill),),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.pop(context);
                          },
                          child: Icon(AntDesign.close,color: Colors.black,),
                        ),

                        GestureDetector(
                          onTap:(){
                            filter();
                          },
                          child: Icon(FontAwesome.sliders,color: Colors.black,),
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.black,
                    labelStyle:
                    appstyle(24, Colors.white, FontWeight.bold),
                    unselectedLabelColor: Colors.black54.withOpacity(0.3),
                    tabs: const [
                      Tab(
                        text: 'product',
                      ),
                    ],),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*0.23,
                left: 16,right: 12,),
              child: ClipRect(
                child: TabBarView(controller: _tabController ,
                    children:[
                      PopularPackeg(threeday: _product,
                        tabIndex:0,),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic>filter(){
    double _value = 0;
    return showModalBottomSheet(context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      builder: (context) => Container(
        height:MediaQuery.of(context).size.height*0.82,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: Radius.circular(25),
              topLeft: Radius.circular(25)
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: 5,
              width: 40,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black38,
              ) ,
            ),

          ],
        ),
      ),);
  }
}

