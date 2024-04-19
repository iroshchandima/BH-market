import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';

import '../snakers/appstyle.dart';

class chat extends StatefulWidget {
  const chat({super.key});

  @override
  State<chat> createState() => _chatState();
}

class _chatState extends State<chat> {

  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _feedback = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _feedback.dispose();
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
            'Send Your FeedBack',
            style: appstyle(25, Colors.black, FontWeight.bold),
          ),
        )
        ],
        ),

                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: SizedBox(height: 40),
                ),
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

                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 40,
                    width: 320,
                    child: TextField(
                      controller: _email,
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
                    height: 100,
                    width: 320,
                    child: TextField(
                      controller: _feedback,
                      decoration: InputDecoration(
                        labelText: 'Feedback :',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ),

                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.only(left: 105),
                  child: MaterialButton(
                    onPressed: () {
                      String Username = _username.text;
                      String useremail = _email.text;
                      String Feedback = _feedback.text;

                      if (Username.isEmpty || useremail.isEmpty || Feedback.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Send Your Feedback'),
                          ),
                        );
                      } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Feedback Sending Succesful'),
                              ),
                        );
                        sendEmail(Username, useremail, Feedback);
                      }
                    },
                    splashColor: Colors.blue,
                    child: Text("Send Feedback",style:appstyle(20, Colors.white, FontWeight.bold),),
                    color: Colors.black,
                  ),
                )
    ],),
    ),
      )
     );

}
  void sendEmail(String Username, String useremail, String Feedback) async {

    String username = 'app646479@gmail.com';
    String password = 'waqk bpay zkxz ybox';

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username, 'nimesh')
      ..recipients.add(useremail)
      ..subject = 'hoe to check send mali 57300'
      ..html =
          "<h4> Username  : Username :  $Username <br> Email Address: $useremail<br> Feedback : $Feedback </h4>";

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

