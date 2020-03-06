import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:salex/ui/MainScreens/Sales/salesList.dart';
import 'package:salex/ui/MainScreens/Common/fabOptions.dart';

class SaleListPage extends StatefulWidget {
  SaleListPage({Key key}) : super(key: key);

  @override
  _SaleListPageState createState() => _SaleListPageState();
}

final backgroundColor = Colors.transparent;
double screenWidth, screenHeight;

class _SaleListPageState extends State<SaleListPage> {
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
            child: saleList(context),
            options: getOptions(context)));
  }
}
