import 'package:automated_payroll/Pages/splash_screen.dart';
import 'package:automated_payroll/Pages/user_dashboard.dart';
import 'package:automated_payroll/Pages/user_login.dart';
import 'package:automated_payroll/Pages/user_view_chat.dart';
import 'package:automated_payroll/Pages/view_employee.dart';
import 'package:flutter/material.dart';

import '../HR_view_chat_replay.dart';
import '../view_location.dart';
import 'hr_dashboard.dart';

void main() {
  runApp(MyApp());

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      routes:{
    'dashboard':(context)=>hr_dash(),
      'user_dash':(context)=>user_dash(),
        'hr_dash':(context)=>hr_dash(),
      }
    );
  }
}
