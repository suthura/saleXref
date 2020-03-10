import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:salex/ui/MainScreens/Phones/phoneList.dart';
import 'package:salex/ui/MainScreens/Common/fabOptions.dart';
import 'package:salex/Controllers/ApiServices/GetMyPhoneService.dart';
import 'package:salex/Models/phoneModel.dart';

class PhoneListPage extends StatefulWidget {
  PhoneListPage({Key key}) : super(key: key);

  @override
  _PhoneListPageState createState() => _PhoneListPageState();
}

List<PhoneItem> phoneItem = List();
List<PhoneItem> filteredphoneItem = List();

final backgroundColor = Colors.transparent;
double screenWidth, screenHeight;
final Duration duration = const Duration(milliseconds: 200);

class _PhoneListPageState extends State<PhoneListPage> {
  @override
  void initState() {
    super.initState();
    callAPI();
  }

  callAPI() {
    GetMyPhoneService.getPhones().then((phoneFromServer) {
      setState(() {
        phoneItem = phoneFromServer;
        filteredphoneItem = phoneItem;
        print("updated");
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
            child: phoneList(context, filteredphoneItem),
            options: getOptions(context)));
  }
}
