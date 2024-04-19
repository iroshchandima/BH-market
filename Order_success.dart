import 'package:flutter/material.dart';
import '../../featuers/shop/screens/home.dart';
import '../snakers/Check_out_Btn.dart';
import '../snakers/appstyle.dart';

class Order_success extends StatefulWidget {
  const Order_success({super.key});

  @override
  State<Order_success> createState() => _Order_successState();
}

class _Order_successState extends State<Order_success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
        height: MediaQuery.of(context).size.height,
    child: Stack(
    children: [
    Container(
    height: MediaQuery.of(context).size.height*1.5,
    decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage("assets/images/animations/success_celebration_800x600 - Copy.gif"),
    fit: BoxFit.fill),),
    child:
        Padding(
          padding: const EdgeInsets.only(top:80.0),
          child: Container(
            child: Column(
              children: [
                Text('Congratulations !',style: appstyle(40, Colors.black, FontWeight.bold),),
                SizedBox(height: 15,),
                Center(
              child: SizedBox(
                height: 300,
                 width: 450,
                 child: Image.asset("assets/images/animations/success_celebration_800x600.gif",fit: BoxFit.fill,),
              ),
            ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Text('Your  Package is \n      Successful !',style: appstyle(30, Colors.black, FontWeight.bold),),
                ),

                SizedBox(height: 10,),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(padding: EdgeInsets.all(20),
                    child: CheckoutButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      label: "Back Home",
                    ),
                  ),
                ),

              ], ),
          ),
        ),
  ),
    ],),
    ),);
  }
}
