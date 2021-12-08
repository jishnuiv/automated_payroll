import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../salary_model.dart';
class ViewSalary extends StatefulWidget {
  const ViewSalary({Key key}) : super(key: key);

  @override
  _ViewSalaryState createState() => _ViewSalaryState();
}

class _ViewSalaryState extends State<ViewSalary> {
  List<SalResult> model = [];
  var Login_id="1";
  getChatResultdata() async {
    var userdata = {
      "id":Login_id,

    };
    var url = "http://192.168.29.44/automated_payrole/salary_view.php";


    http.Response response = await http.post(Uri.parse(url),body: userdata);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      final chat = Salary_model.fromJson(data);
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
        title: Center(child: Text("view salary")),
        centerTitle: false,

      ),



      body: getbody(),
    );

  }
  Widget getbody() {

    return ListView.builder(itemCount: model.length,
        itemBuilder: (context,index){
          SalResult chats = model.elementAt(index);
          return getcard(date:chats.month ,salary:chats.salary);
        });
  }
  Widget getcard({
    String date,
    String salary,



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
                      children: [Text("salary   ${salary}")],
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),


            ],
          )),
    );
  }

}

