import 'dart:convert';
import 'package:automated_payroll/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class viewemployee extends StatefulWidget {


  @override
  _viewemployeeState createState() => _viewemployeeState();
}

class _viewemployeeState extends State<viewemployee> {

  List<Result> model = [];

  getemploydata() async {
    var url = "http://192.168.29.44/automated_payrole/viewemployee.php";

    http.Response response = await http.post(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      final em = Employee_model.fromJson(data);
      setState(() {
        model = em.result;
      });

    }

  }

  @override
  void initState() {
    getemploydata();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("View Employee"),
        centerTitle: false,

      ),



body: getbody(),
    );
  }
  Widget getbody() {

    return ListView.builder(itemCount: model.length,
        itemBuilder: (context,index){
      Result employee = model.elementAt(index);
      return getcard(name: employee.name,organisation: employee.organisation,
          mobile: employee.mobile,address: employee.address,employeeId: employee.employeeId);
    });
  }
}
Widget getcard({
  String employeeId,
  String name,
  String address,
  String mobile,
  String organisation,

}) {

  return InkWell(onLongPress: (){
  },
    child: Card(
        child: Column(
          children: [
            ListTile(
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.orange,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${employeeId} "),
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
                    children: [Text("district   ${name}")],
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
                    children: [Text("localbody   ${address}")],
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
                    children: [Text("email   ${mobile}")],
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
                    children: [Text("email   ${organisation}")],
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ],
        )),
  );
}
