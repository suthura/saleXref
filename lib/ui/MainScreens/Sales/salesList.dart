import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:salex/Models/shopModel.dart';
import 'package:salex/ui/MainScreens/Common/logOut.dart';
import 'package:intl/intl.dart';
import 'package:salex/ui/MainScreens/Sales/SingleSalePage.dart';

class saleList extends StatefulWidget {
  final filteredSaleItem;
  saleList(this.filteredSaleItem, {Key key}) : super(key: key);

  @override
  _saleListState createState() => _saleListState();
}

class _saleListState extends State<saleList> {
  @override
  Widget build(BuildContext context) {
    var formatter = new DateFormat('yyyy-MM-dd kk:mm:ss');

    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
            colors: [
              // Theme.Colors.loginGradientStart,
              // Theme.Colors.loginGradientEnd
              Colors.white,
              Colors.white70
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Icon(
                Icons.monetization_on,
                color: Colors.black,
                size: 35,
              ),
              Text("My Sales List",
                  style: TextStyle(fontSize: 24, color: Colors.black)),
              logOut(context),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          // Container(
          //   child:
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  // print(widget.filteredSaleItem.length);

                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SingleSalePage(widget.filteredSaleItem[index].saleID)));
                      print(widget.filteredSaleItem[index].saleID);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Container(
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          gradient: new LinearGradient(
                              colors: [Color(0xFFF6BDC0), Color(0xFFEA4C46)],
                              begin: const FractionalOffset(0.0, 0.0),
                              end: const FractionalOffset(1.0, 1.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                          child: ListTile(
                            title: Text(widget.filteredSaleItem[index].shopname,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                            subtitle: Text(formatter
                                .format(DateTime.parse(
                                    widget.filteredSaleItem[index].saletime))
                                .toString()),
                            trailing: Text(
                                "Rs : " + widget.filteredSaleItem[index].total,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider(height: 16);
                },
                itemCount: widget.filteredSaleItem.length),
          ),
          // ),
        ],
      ),
    );
  }
}
