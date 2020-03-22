import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:salex/ui/MainScreens/Checkout/CheckoutList.dart';
import 'package:salex/ui/MainScreens/Common/fabOptions.dart';
import 'package:salex/Controllers/ApiServices/GetMyCartService.dart';
import 'package:salex/Models/phoneModel.dart';
import 'dart:async';

class CheckoutPage extends StatefulWidget {
  final shopID;
  final shopName;
  CheckoutPage(this.shopID, this.shopName, {Key key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

List<PhoneItem> phoneItem = List();
List<PhoneItem> filteredphoneItem = List();

final backgroundColor = Colors.transparent;
double screenWidth, screenHeight;
final Duration duration = const Duration(milliseconds: 200);

class _CheckoutPageState extends State<CheckoutPage> {
  Timer _timer;
  @override
  void initState() {
    _timer =
        new Timer.periodic(Duration(seconds: 1), (Timer timer) => callAPI());
    // callAPI();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  callAPI() {
    GetMyCartService.getCart().then((phoneFromServer) {
      setState(() {
        phoneItem = phoneFromServer;
        filteredphoneItem = phoneItem;
        print("cart list updated");
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
            child: itemList(context, filteredphoneItem,widget.shopID ,widget.shopName),
            options: getOptions(context)));
  }
}
