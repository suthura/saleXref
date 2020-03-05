import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:salex/ui/MainScreens/Dashboard/dashboard.dart';
import 'package:salex/ui/MainScreens/Common/fabOptions.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

final backgroundColor = Colors.transparent;
double screenWidth, screenHeight;
final Duration duration = const Duration(milliseconds: 200);

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: FabCircularMenu(
          fabOpenIcon: Icon(
            Icons.menu,
            size: 40,
          ),
          child: dashboard(context),
          options: getOptions(context)
        ));
  }
}
