import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';
import 'package:salex/Controllers/ApiServices/GetMyShopService.dart';
import 'package:salex/ui/MainScreens/Shops/shopList.dart';
import 'package:salex/ui/MainScreens/Common/fabOptions.dart';
import 'package:salex/Models/shopModel.dart';

class ShopListPage extends StatefulWidget {
  ShopListPage({Key key}) : super(key: key);

  @override
  _ShopListPageState createState() => _ShopListPageState();
}

List<ShopItem> shopItem = List();
List<ShopItem> filteredshopItem = List();

final backgroundColor = Colors.transparent;
double screenWidth, screenHeight;

class _ShopListPageState extends State<ShopListPage> {
  Position _currentPosition;

  @override
  void initState() {
    super.initState();
    callAPI();
    _getCurrentLocation();

    // if (_currentPosition != null) {
    //   print(_currentPosition.latitude);
    //   print(_currentPosition.longitude);
    // }
  }

  callAPI() {
    GetMyShopService.getShops().then((shopFromServer) {
      setState(() {
        shopItem = shopFromServer;
        filteredshopItem = shopItem;
        print("shop list updated");
      });
    });
  }

  _getCurrentLocation() async {
    _currentPosition = await Geolocator()
        .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
    print(_currentPosition.latitude.toString());
    print(_currentPosition.longitude.toString());

  }

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
            child: shopList(context, filteredshopItem,_currentPosition),
            options: getOptions(context)));
  }
}
