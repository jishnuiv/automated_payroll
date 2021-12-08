import 'dart:convert';

import 'package:automated_payroll/models/user_chatmodel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class UserChatView extends StatefulWidget {
  const UserChatView({Key key}) : super(key: key);

  @override
  _UserChatViewState createState() => _UserChatViewState();
}

class _UserChatViewState extends State<UserChatView> {
  List<ChatResult> model = [];
  var Login_id="1";
  // void getHttp() async {
  //   try {
  //     var response = await Dio().post('http://192.168.29.44/automated_payrole/viewchat.php');
  //     print(response);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  getChatResultdata() async {
    var userdata = {
      "login_id":Login_id,

    };
    var url = "http://192.168.29.44/automated_payrole/viewchat.php";


    http.Response response = await http.post(Uri.parse(url),body: userdata);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      final chat = User_chatmodel.fromJson(data);
      setState(() {
        model = chat.result;
        print(model);
      });

    }

  }

  @override
  void initState() {
    getChatResultdata();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(child: Text("View chat")),
        centerTitle: false,

      ),



      body: getbody(),

    );
  }
  Widget getbody() {

    return ListView.builder(itemCount: model.length,
        itemBuilder: (context,index){
          ChatResult chats = model.elementAt(index);
          return getcard(date:  chats.date,personName: chats.personName,message: chats.message);
        });
  }
}
Widget getcard({
  String date,
  String personName,
  String message,


})
{

  return InkWell(onLongPress: (){
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
