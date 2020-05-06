import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:salex/Models/saleModel.dart';
import 'package:salex/ui/MainScreens/Sales/salesList.dart';
import 'package:salex/ui/MainScreens/Common/fabOptions.dart';
import 'package:salex/Controllers/ApiServices/GetMySalesService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SaleListPage extends StatefulWidget {
  SaleListPage({Key key}) : super(key: key);

  @override
  _SaleListPageState createState() => _SaleListPageState();
}

List<SaleItem> saleItem = List();
List<SaleItem> filteredSaleItem = List();

final backgroundColor = Colors.transparent;
double screenWidth, screenHeight;

class _SaleListPageState extends State<SaleListPage> {
  @override
  void initState() {
    super.initState();
    callAPI();
  }

  callAPI() async {
    SharedPreferences authDetail = await SharedPreferences.getInstance();

    GetMySalesService.getSales(authDetail.getString("usertoken"))
        .then((saleFromServer) {
      setState(() {
        saleItem = saleFromServer;
        filteredSaleItem = saleItem;
        print("Sale list updated");
      });
    });
  }

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
            child: saleList(filteredSaleItem),
            options: getOptions(context)));
  }
}
