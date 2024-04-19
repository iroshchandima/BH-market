
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:country_code_picker/country_code_picker.dart';

import '../models/sneaker_model.dart';
import '../services/helper.dart';
import '../snakers/appstyle.dart';
import 'Order_success.dart';

class Placeproduct extends StatefulWidget {
  const Placeproduct({Key? key, required this.id, this.price, this.name}) : super(key: key);

  final id;
  final price;
  final name;

  @override
  State<Placeproduct> createState() => _CreateNewState();
}

class _CreateNewState extends State<Placeproduct> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _country = TextEditingController();
  String groupvalue = "Male";
  String groupvalue1 = "Mobile Number";
  late Future<Sneakers> _sneaker;

  @override
  void initState() {
    super.initState();
    _sneaker = Helper().getProductSneakersById(widget.id);
  }

  @override
  void dispose() {
    _controller.dispose();
    _phone.dispose();
    _username.dispose();
    _country.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(AntDesign.close),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40, left: 45),
                    child: Text(
                      'Place Your product ',
                      style: appstyle(25, Colors.black, FontWeight.bold),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Column(
                  children: [
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: 40,
                        width: 320,
                        child: TextField(
                          controller: _username,
                          decoration: InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        CountryCodePicker(
                          initialSelection: "US",
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          favorite: ['+1', "US"],
                          enabled: true,
                          hideMainText: false,
                          showFlag: true,
                          hideSearch: false,
                          showFlagDialog: true,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SizedBox(
                            height: 40,
                            width: 235,
                            child: TextField(
                              controller: _phone,
                              decoration: InputDecoration(
                                labelText: 'Phone Number',
                                border: OutlineInputBorder(),
                              ),
                              keyboardType: TextInputType.phone,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: 40,
                        width: 320,
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: 40,
                        width: 320,
                        child: TextField(
                          controller: _country,
                          decoration: InputDecoration(
                            labelText: 'Country',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.only(right: 160),
                      child: Text(
                        'Select Your Gender ',
                        style: appstyle(15, Colors.black54, FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Radio(
                            value: "Male",
                            groupValue: groupvalue,
                            onChanged: (value) {
                              setState(() {
                                groupvalue = value!;
                              });
                            },
                          ),
                          Text(
                            'Male',
                            style: appstyle(15, Colors.black54, FontWeight.w700),
                          ),
                          const SizedBox(width: 20),
                          Radio(
                            value: "Female",
                            groupValue: groupvalue,
                            onChanged: (value) {
                              setState(() {
                                groupvalue = value!;
                              });
                            },
                          ),
                          Text(
                            'Female',
                            style: appstyle(15, Colors.black54, FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.only(right: 160),
                      child: Text(
                        'Communication Method',
                        style: appstyle(15, Colors.black54, FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Radio(
                            value: "Mobile Number",
                            groupValue: groupvalue1,
                            onChanged: (value) {
                              setState(() {
                                groupvalue1 = value!;
                              });
                            },
                          ),
                          Text(
                            'Mobile Number',
                            style: appstyle(15, Colors.black54, FontWeight.w700),
                          ),
                          const SizedBox(width: 20),
                          Radio(
                            value: "Email",
                            groupValue: groupvalue1,
                            onChanged: (value) {
                              setState(() {
                                groupvalue1 = value!;
                              });
                            },
                          ),
                          Text(
                            'Email',
                            style: appstyle(15, Colors.black54, FontWeight.w700),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 15,),
                    MaterialButton(
                      onPressed: () {
                        String userEmail = _controller.text;
                        String userPhone = _phone.text;
                        String username = _username.text;
                        String country = _country.text;
                        String userId = widget.id.toString();
                        String name = widget.name.toString();
                        String price = widget.price.toString();

                        if (userEmail.isEmpty || userPhone.isEmpty || username.isEmpty || country.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Please fill in all fields'),
                            ),
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Order_success()),
                          );
                          sendEmail(userEmail, userPhone, username, country, userId, name, price);
                        }
                      },
                      splashColor: Colors.blue,
                      child: Text("Place product",style:appstyle(20, Colors.white, FontWeight.bold),),
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void sendEmail(String recipientEmail, String Phone, String nusername, String country, String userId, String name, String price,
      ) async {
    String username = 'app646479@gmail.com';
    String password = 'waqk bpay zkxz ybox';

    String Gender = groupvalue;
    String  media = groupvalue1;

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'nimesh')
      ..recipients.add(recipientEmail)
      ..subject = 'Travel Go'
      ..html =
          "<h4> Username  : $nusername <br> "
          "User Phone Number: $Phone  "
          "<br> Country is : $country "
          "<br> User's Gender: $Gender "
          "<br> Communication Method: $media  "
          "<br> Purchase product id : $userId "
          "<br> product name : $name "
          "<br> product price : $price </h4>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
        print('Message  not sent: ');
      }
    }
  }
}
