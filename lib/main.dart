import 'package:flutter/material.dart';
import 'package:salex/ui/Login/login_page.dart';
import 'package:salex/ui/MainScreens/Dashboard/dashboarspage.dart';
import 'package:salex/ui/Troublelogin/forgotPassword.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SaleX',
      theme: new ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: new LoginPage(),
      // home: new HomePage(),
      routes: <String, WidgetBuilder>{
        // login and resgistration routes
        "/forgotpw": (BuildContext context) => new ForgotPassword(),
        "/appRoute": (BuildContext context) => new LoginPage(),
        "/Home": (BuildContext context) => new HomePage(),
      },
    );
  }
}