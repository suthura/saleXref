import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:salex/Controllers/ApiServices/GetMyPhoneService.dart';
import 'package:salex/ui/MainScreens/Dashboard/dashboard.dart';
import 'package:salex/ui/MainScreens/Common/fabOptions.dart';
import 'package:salex/Controllers/ApiServices/GetMySalesService.dart';
import 'package:salex/Models/saleModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

List<SaleItem> saleItem = List();
List<SaleItem> filteredSaleItem = List();

int phoneCount;

final backgroundColor = Colors.transparent;
double screenWidth, screenHeight;
final Duration duration = const Duration(milliseconds: 200);

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    callAPI();
  }

  callAPI() async {
    SharedPreferences authDetail = await SharedPreferences.getInstance();
    print(authDetail.getString("usertoken"));

    GetMySalesService.getSales(authDetail.getString("usertoken"))
        .then((saleFromServer) {
      setState(() {
        saleItem = saleFromServer;
        filteredSaleItem = saleItem;
        print("Sale list updated");
      });
    });

    GetMyPhoneService.getPhones(authDetail.getString("usertoken"))
        .then((phoneFromServer) {
      setState(() {
        phoneCount = phoneFromServer.length;

        print("phone count updated");
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
            child: dashboard(context, filteredSaleItem, phoneCount),
           options: getOptions(context),
            ringDiameter: MediaQuery.of(context).size.width*0.8,));
  }
}
