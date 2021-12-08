import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import 'Hrview_chat_model.dart';
import 'models/user_chatmodel.dart';
class HrViewAndReplay extends StatefulWidget {
  const HrViewAndReplay({Key key}) : super(key: key);

  @override
  _HrViewAndReplayState createState() => _HrViewAndReplayState();
}

class _HrViewAndReplayState extends State<HrViewAndReplay> {
  List<HrChatResult> model = [];
  var Login_id="1";
  getChatResultdata() async {
    var Hrdata = {
      "login_id":Login_id,

    };
    var url = "http://192.168.29.44/automated_payrole/viewchat.php";


    http.Response response = await http.post(Uri.parse(url),body: Hrdata);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      final Hrchat = Hr_chatmodel.fromJson(data);
      setState(() {
        model = Hrchat.result;
        print(model);
      });

    }

  }

  @override
  void initState() {
    getChatResultdata();
  }

  // void getHttp() async {
  //   try {
  //     var response = await Dio().post('http://192.168.29.44/automated_payrole/viewchat.php');
  //     print(response);
  //   } catch (e) {
  //     print(e);
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hr view"),),
      body: getbody(),

    );
  }

  Widget getbody() {
    return ListView.builder(itemCount: model.length,
        itemBuilder: (context, index) {
          HrChatResult chats = model.elementAt(index);
          return getcard(date: chats.date,
              personName: chats.personName,
              message: chats.message);
        });
  }

  Widget getcard({
    String date,
    String personName,
    String message,


  }) {
    return InkWell(onLongPress: () {
      showalertdialogue();
    },
      child: Card(
          child: Column(
            children: [
              ListTile(
                title: Row(
                  children: [

                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("date${date} "),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [Text("name  ${personName}")],
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [Text("messege   ${message}")],
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),


            ],
          )),
    );
  }
  void showalertdialogue() {
    showDialog(
        context: context,
        builder: (Context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text("Add task"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  //controller: StdNamecontroller,
                  decoration: InputDecoration(hintText: "student name"),
                ),
                TextField(
                 // controller: StdPhonecontroller,
                  decoration: InputDecoration(hintText: "student phone"),
                ),

                Row(
                  children: [
                    RaisedButton(
                      onPressed: () {
                       // Stdname = StdNamecontroller.text;
                       // Stdphone = StdPhonecontroller.text;

                        //StdNamecontroller.clear();
                        //StdEmailcontroller.clear();

                       // addStdData(
                           // name: Stdname,
                           // phone: Stdphone,
                           // );
                        Navigator.of(context).pop(showalertdialogue);      //alert box clearing function!!!!!!
                      },
                      child: Text("Add"),
                    )
                  ],
                )
              ],
            ),
          ),
        ));

}}
