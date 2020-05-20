import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:salex/Models/shopModel.dart';
import 'package:salex/ui/MainScreens/Common/logOut.dart';
import 'package:intl/intl.dart';
import 'package:salex/ui/MainScreens/Sales/SingleSalePage.dart';

class SingleItem extends StatefulWidget {
  final filteredSaleItem;
  SingleItem(this.filteredSaleItem, {Key key}) : super(key: key);

  @override
  _SingleItemState createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  @override
  Widget build(BuildContext context) {
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
              Text("Sale Datails",
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

                  return Container(
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          Card(
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(widget.filteredSaleItem[index].brand +
                                        " " +
                                        widget.filteredSaleItem[index].pmodel +
                                        " " +
                                        widget.filteredSaleItem[index].capacity)
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                   color: Colors.grey 
                                  ),
                                  child: Text("IMEI : "+widget.filteredSaleItem[index].imei),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                   color: Colors.grey 
                                  ),
                                  child: Text("Price : "+widget.filteredSaleItem[index].price),
                                )
                              ],
                            ),
                          ),
                        ],
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
