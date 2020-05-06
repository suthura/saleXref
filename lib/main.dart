import 'package:flutter/material.dart';
import 'package:salex/ui/Login/login_page.dart';
import 'package:salex/ui/MainScreens/Dashboard/dashboarspage.dart';
import 'package:salex/Routes/Routes.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SaleX',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: new LoginPage(),
        // home: new HomePage(),
        routes: getRoutes());
  }
}
