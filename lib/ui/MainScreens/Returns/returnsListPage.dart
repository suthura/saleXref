import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:salex/ui/MainScreens/Returns/returnsList.dart';
import 'package:salex/ui/MainScreens/Common/fabOptions.dart';

class ReturnsListPage extends StatefulWidget {
  ReturnsListPage({Key key}) : super(key: key);

  @override
  _ReturnsListPageState createState() => _ReturnsListPageState();
}

final backgroundColor = Colors.transparent;
double screenWidth, screenHeight;

class _ReturnsListPageState extends State<ReturnsListPage> {
  @override
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
            child: returnsList(context),
            options: getOptions(context)));
  }
}
