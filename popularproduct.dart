
import 'package:bh_int/Product_run/snakers/staggered_til.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../models/sneaker_model.dart';
import '../product_ui/productPage.dart';



class PopularPackeg extends StatelessWidget {
  const PopularPackeg({
    super.key,
    required Future<List<Sneakers>> threeday, required this.tabIndex,
  }) : _threeday = threeday;

  final Future<List<Sneakers>> _threeday;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(
        future: _threeday,
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
            final threeday = snapshot.data;
            return StaggeredGridView.countBuilder(
                padding :EdgeInsets.zero,
                crossAxisCount : 2,
                crossAxisSpacing: 20,
                mainAxisSpacing:16,
                itemCount:
                threeday!.length,
                scrollDirection:
                Axis.vertical,
                staggeredTileBuilder: (index) => StaggeredTile.extent(
                    (index % 2 == 0 )? 1:1, (index % 4 ==1 || index % 4 == 3)
                    ?MediaQuery.of(context).size.height*0.35
                    : MediaQuery.of(context).size.height*0.33),
                itemBuilder:
                    (context, index) {
                  final item = snapshot.data![index];
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => productPage(id: item.id, category: item.category,price: item.price,name: item.name, brand: item.brand,)));
                    },
                    child:  StaggerTile
                      (id: item.id,
                      image: item.image[0],
                      name: item.name,
                      prices: item.price,
                      brand:item.brand,
                      color:item.color,
                    )
                  );
                });
          }
        });
  }
}
