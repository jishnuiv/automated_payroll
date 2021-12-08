import 'package:automated_payroll/Pages/chat_users.dart';
import 'package:automated_payroll/Pages/user_login.dart';
import 'package:automated_payroll/Pages/view_employee.dart';
import 'package:flutter/material.dart';

import '../HR_view_chat_replay.dart';
import '../add_person.dart';

class hr_dash extends StatefulWidget {
  const hr_dash({Key key}) : super(key: key);

  @override
  _hr_dashState createState() => _hr_dashState();
}

class _hr_dashState extends State<hr_dash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Center(child: Text("Hr Home")),
        backgroundColor: Colors.blueAccent,
        centerTitle: false,
      ),



      body:Container(
        child: GridView.extent(
          primary: false,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          maxCrossAxisExtent: 200.0,
          children: <Widget>[

            //   Container(
            //   padding: const EdgeInsets.all(8),
            //   child: const Text('First', style: TextStyle(fontSize: 20)),
            //   color: Colors.yellow,
            // ),


            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => viewemployee()));
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
                      Center(child: Text('', style: TextStyle(fontSize: 15,color: Colors.black))),
                    ],
                  ),
                  color: Colors.white,
                ),
              ),
            ),

            InkWell(
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => HrViewAndReplay()));
              },
              child: Card(
                shadowColor: Colors.black,
                child:   Container(
                  padding: const EdgeInsets.all(8),
                  child:  Column(
                    children: [
                      Center(
                        child: Icon(Icons.reply,size: 100,color: Colors.black,),
                      ),
                      Center(child: Text('View/Replay', style: TextStyle(fontSize: 15,color: Colors.black))),
                    ],
                  ),
                  color: Colors.white,
                ),
              ),
            ),



            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => viewemployee()));
              },
              child: Card(
                shadowColor: Colors.black,
                child:   Container(
                  padding: const EdgeInsets.all(8),
                  child:  Column(
                    children: [
                      Center(
                        child: Icon(Icons.person,size: 100,color: Colors.black,),
                      ),
                      Center(child: Text('View Profile', style: TextStyle(fontSize: 15,color: Colors.black))),
                    ],
                  ),
                  color: Colors.white,
                ),
              ),
            ),


            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => chat_users()));
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
                      Center(child: Text('Chat users', style: TextStyle(fontSize: 15,color: Colors.black))),
                    ],
                  ),
                  color: Colors.white,
                ),
              ),
            ),



            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
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



    );
  }
}
