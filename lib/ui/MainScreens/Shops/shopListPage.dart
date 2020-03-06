import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:salex/ui/MainScreens/Shops/shopList.dart';
import 'package:salex/ui/MainScreens/Common/fabOptions.dart';

class ShopListPage extends StatefulWidget {
  ShopListPage({Key key}) : super(key: key);

  @override
  _ShopListPageState createState() => _ShopListPageState();
}

final backgroundColor = Colors.transparent;
double screenWidth, screenHeight;

class _ShopListPageState extends State<ShopListPage> {
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
            child: shopList(context),
            options: getOptions(context)));
  }
}
