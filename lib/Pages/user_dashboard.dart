import 'package:automated_payroll/Pages/logout_details.dart';
import 'package:automated_payroll/Pages/personal_info.dart';
import 'package:automated_payroll/Pages/user_view_chat.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'View_salary.dart';
import 'chat_hr.dart';

class user_dash extends StatefulWidget {
  const user_dash({Key key}) : super(key: key);

  @override
  _user_dashState createState() => _user_dashState();
}

class _user_dashState extends State<user_dash> {
  TextEditingController pnamecontroller = TextEditingController();
  TextEditingController datecontroller = TextEditingController();
  TextEditingController messegecontroller = TextEditingController();

  String date = "";
  String pname = "";
  String messege = "";


  AddDetails(
      {date,
        pname,
        messege,
       }) async {
    var parameters = {
      "first_name": pname,
      "last_name": pname,
      "username": messege,

    };
    // print(parameters);
    http.Response result = await http.post(
        Uri.parse("http://localhost/automated_payrole/chat_hr.php"),
        body: parameters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("User Home"),
        backgroundColor: Colors.blueAccent,
        centerTitle: false,
      ),



      body:Container(
        child: Card(
          child: GridView.extent(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            maxCrossAxisExtent: 400.0,
            children: <Widget>[

              //   Container(
              //   padding: const EdgeInsets.all(8),
              //   child: const Text('First', style: TextStyle(fontSize: 20)),
              //   color: Colors.yellow,
              // ),


              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => personal_info()));
                },

                child: Card(
                  shadowColor: Colors.black,
                  child:   Container(
                    padding: const EdgeInsets.all(8),
                    child:  Column(

                      children: [
                        Center(
                          child: Icon(Icons.location_on,size: 100,color: Colors.black,),
                        ),
                        Center
                          (child: Text('Personal Info',
                            style: TextStyle(fontSize: 15,color: Colors.black))),
                      ],
                    ),
                    color: Colors.white,
                  ),
                ),
              ),


              InkWell(
                onTap: () {
                  //
                  //
              Navigator.push(context, MaterialPageRoute(builder: (context) => ChatHr()));
                },
                child: Card(
                  shadowColor: Colors.black,
                  child:   Container(
                    padding: const EdgeInsets.all(8),
                    child:  Column(
                      children: [
                        Center(
                          child: Icon(Icons.chat,size: 100,color: Colors.black,),
                        ),
                        Center(child: Text('Chat Hr', style: TextStyle(fontSize: 15,color: Colors.black))),
                      ],
                    ),
                    color: Colors.white,
                  ),
                ),
              ),


              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => UserChatView()));
                },
                child: Card(
                  shadowColor: Colors.black,
                  child:   Container(
                    padding: const EdgeInsets.all(8),
                    child:  Column(
                      children: [
                        Center(
                          child: Icon(Icons.message,size: 100,color: Colors.black,),
                        ),
                        Center(child: Text('View Chat', style: TextStyle(fontSize: 15,color: Colors.black))),
                      ],
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ViewSalary()));
                },
                child: Card(
                  shadowColor: Colors.black,
                  child:   Container(
                    padding: const EdgeInsets.all(8),
                    child:  Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Icon(Icons.monetization_on_sharp,size: 100,color: Colors.black,),
                        ),
                        Center(child: Text('View salary', style: TextStyle(fontSize: 15,color: Colors.black))),
                      ],
                    ),
                    color: Colors.white,
                  ),
                ),
              ),



              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => logout()));
                },
                child: Card(
                  shadowColor: Colors.black,
                  child:   Container(
                    padding: const EdgeInsets.all(8),
                    child:  Column(
                      children: [
                        Center(
                          child: Icon(Icons.logout,size: 100,color: Colors.black,),
                        ),
                        Center(child: Text('logout', style: TextStyle(fontSize: 15,color: Colors.black))),
                      ],
                    ),
                    color: Colors.white,
                  ),
                ),
              ),


            ],

          ),
        ),
      ),

    );
  }
}
