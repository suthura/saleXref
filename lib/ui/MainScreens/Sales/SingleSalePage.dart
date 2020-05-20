import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:salex/Controllers/ApiServices/GetMyPhoneService.dart';
import 'package:salex/Models/singleSaleModel.dart';
import 'package:salex/ui/MainScreens/Dashboard/dashboard.dart';
import 'package:salex/ui/MainScreens/Common/fabOptions.dart';
import 'package:salex/Controllers/ApiServices/GetSingleSale.dart';
import 'package:salex/Models/saleModel.dart';
import 'package:salex/ui/MainScreens/Sales/SingleItem.dart';

class SingleSalePage extends StatefulWidget {
  final saleID;
  SingleSalePage(this.saleID, {Key key}) : super(key: key);

  @override
  _SingleSalePageState createState() => _SingleSalePageState();
}

List<SingleSaleItem> saleItem = List();
List<SingleSaleItem> filteredSaleItem = List();

int phoneCount;

final backgroundColor = Colors.transparent;
double screenWidth, screenHeight;
final Duration duration = const Duration(milliseconds: 200);

class _SingleSalePageState extends State<SingleSalePage> {
  @override
  void initState() {
    super.initState();
    callAPI();
  }

  callAPI() {
    final body = {"saleid": widget.saleID};

    GetSingleSaleService.getSale(body).then((saleFromServer) {
      setState(() {
        saleItem = saleFromServer;
        filteredSaleItem = saleItem;
        print(filteredSaleItem.length);
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
            child:SingleItem(filteredSaleItem),
            options: getOptions(context),
            ringDiameter: MediaQuery.of(context).size.width*0.8,));
  }
}
