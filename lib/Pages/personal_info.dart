import 'package:automated_payroll/Pages/camara.dart';
import 'package:automated_payroll/Pages/locationcount.dart';
import 'package:flutter/material.dart';

import '../view_location.dart';

class personal_info extends StatefulWidget {
  const personal_info({Key key}) : super(key: key);

  @override
  _personal_infoState createState() => _personal_infoState();
}

class _personal_infoState extends State<personal_info> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: size.height * 0.3),

            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 40),
              // child: TextField(
              //   // controller: UsernameController,
              //   decoration: InputDecoration(
              //       labelText: "Enter your name"
              //   ),
              // ),
            ),
            SizedBox(height: size.height * 0.03),

        ButtonTheme(
          minWidth: 305.0,
          height: 50.0,
          child: RaisedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => location_camara()));
            },
            child: Text("update picture"),
          ),
        ),

            SizedBox(height: size.height * 0.03),

            ButtonTheme(
              minWidth: 305.0,
              height: 50.0,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserLocation()));
                },
                child: Text("My location"),
              ),
            ),

          ],

        ),

      ),

    );
  }
}
