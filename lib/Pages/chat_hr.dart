import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;

import 'hr_dashboard.dart';
class ChatHr extends StatefulWidget {
  const ChatHr({Key key}) : super(key: key);

  @override
  _ChatHrState createState() => _ChatHrState();
}

class _ChatHrState extends State<ChatHr> {
  TextEditingController DateController = TextEditingController();
  TextEditingController NameController = TextEditingController();
  TextEditingController MessageController = TextEditingController();


  addmessage({date,person_name,Message,Login_id}) async {
    String date = DateController.text;
    String person_name = NameController.text;
    String Message = MessageController.text;
    String Login_id="1";
    var url = "http://192.168.29.44/automated_payrole/chat_user.php";
    var data = {
      "Login_id":Login_id,
      "date": date,
      "person_name": person_name,
      "message": Message,
    };
    var res = await http.post(url, body: data);
    var message = jsonDecode(res.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text(" chat with hr"),),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
              children: <Widget>[

                SizedBox(height: 120,),

                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    height: 60,
                    child: TextFormField(
                      controller: DateController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                              color: Colors.blue,
                              width: 2.0,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.black,
                              )
                          ),
                          hintText:DateFormat("yyyy-MM-dd").format(DateTime.now()).toString(),
                      ),),
                  ),
                ),





                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(

                    height: 130,
                    child:TextFormField(
                      controller: MessageController,
                      minLines: 5,
                      maxLines: 7,
                      decoration: InputDecoration(
                        hintText: 'Message',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 350,
                    height: 50,
                    child: ElevatedButton(onPressed:() {
                      setState(() {




                      });

                      addmessage();
                      Fluttertoast.showToast(
                          msg: "Added",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM // Also possible "TOP" and "CENTER"
                      );
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>add_camp_details  ()));
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>hr_dash()));
                    }, child: Text("Submit")),
                  ),
                ),
              ]
          ),

        ),

      ),
    );
  }
}
