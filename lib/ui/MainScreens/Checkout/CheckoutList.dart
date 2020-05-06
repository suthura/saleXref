import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:salex/Models/phoneModel.dart';
import 'package:salex/ui/MainScreens/Phones/phoneListPage.dart';
import 'package:salex/Controllers/ApiServices/RemoveFromCartService.dart';
import 'package:salex/Controllers/ApiServices/SaveMySaleService.dart';
import 'package:salex/Controllers/ApiServices/ChangeAvailabilityService.dart';
import 'package:salex/ui/MainScreens/Common/logOut.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slider_button/slider_button.dart';

double screenWidth, screenHeight;
double total = 0.0;

class itemList extends StatefulWidget {
  final context;
  final filteredphoneItem;
  final shopID;
  final shopName;
  itemList(this.context, this.filteredphoneItem, this.shopID, this.shopName,
      {Key key})
      : super(key: key);

  @override
  _itemListState createState() => _itemListState();
}

class _itemListState extends State<itemList> {
  @override
  Widget build(BuildContext context) {
    total = 0;
    for (var i = 0; i < widget.filteredphoneItem.length; i++) {
      total = total + double.parse(widget.filteredphoneItem[i].price);
    }
    print(total);

    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SliderButton(
            vibrationFlag: false,
            action: () async {
              if (total > 0.0) {
                List _cartIndexs = [];

                ///Do something here OnSlide
                for (var i = 0; i < widget.filteredphoneItem.length; i++) {
                  final saleItem = {"IMEI": widget.filteredphoneItem[i].imei};
                  ChangeAvailabilityService.changeAvailability(saleItem)
                      .then((success) {
                    if (success) {
                      print(widget.filteredphoneItem[i].imei + ' sold');
                    } else {
                      print(widget.filteredphoneItem[i].imei + ' error');
                    }
                  });

                  print(saleItem);

                  final item = {
                    "brand": widget.filteredphoneItem[i].brand,
                    "model": widget.filteredphoneItem[i].pmodel,
                    "capacity": widget.filteredphoneItem[i].capacity,
                    "imei": widget.filteredphoneItem[i].imei,
                    "price": widget.filteredphoneItem[i].price,
                  };
                  _cartIndexs.add(item);
                }
                DateTime now = DateTime.now();
                SharedPreferences authDetail = await SharedPreferences.getInstance();
                final salesList = {
                  "shopid": widget.shopID,
                  "shopname": widget.shopName,
                  "token":authDetail.getString("usertoken"),
                  "saledata": _cartIndexs,
                  "total": total,
                  "saletime": now.toString()
                };

                SaveMySaleService.saveMySale(salesList).then((success) {
                  if (success) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/Sales', (Route<dynamic> route) => false);
                    // print("Sale Success");
                  } else {
                    print("sale failed");
                  }
                });

                // print(widget.shopID);
                // print(_cartIndexs);

                // print(widget.filteredphoneItem.length);
              } else {
                print("no items in cart");
              }
            },

            ///Put label over here
            label: Text(
              "Slide to Confirm !",
              style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: 17),
            ),
            icon: Center(
                child: Icon(
              Icons.navigate_next,
              color: Colors.white,
              size: 40.0,
            )),

            ///Change All the color and size from here.
            width: screenWidth - 100,
            alignLabel: Alignment.center,
            // radius: 10,
            buttonColor: Color(0xffd60000),
            // backgroundColor: Color(0xff534bae),
            // highlightedColor: Colors.white,
            // baseColor: Colors.red,
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [Colors.white, Colors.white70],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(
                  Icons.phone_android,
                  color: Colors.black,
                  size: 35,
                ),
                Text("Cart",
                    style: TextStyle(fontSize: 24, color: Colors.black)),
                logOut(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text("Total : $total",
                    style: TextStyle(fontSize: 24, color: Colors.black)),
              ],
            ),
            Expanded(
              child: PageView(
                controller: PageController(viewportFraction: 1),
                scrollDirection: Axis.horizontal,
                pageSnapping: true,
                children: <Widget>[
                  ListView.builder(
                    itemBuilder: (context, index) {
                      return SimpleFoldingCell(
                          frontWidget: _buildFrontWidget(
                              index, widget.filteredphoneItem),
                          innerTopWidget: _buildInnerTopWidget(
                              index, widget.filteredphoneItem),
                          innerBottomWidget: _buildInnerBottomWidget(
                              index, widget.filteredphoneItem),
                          cellSize:
                              Size(MediaQuery.of(context).size.width, 125),
                          padding: EdgeInsets.all(15),
                          animationDuration: Duration(milliseconds: 300),
                          borderRadius: 10,
                          onOpen: () => print('$index cell opened'),
                          onClose: () => print('$index cell closed'));
                    },
                    itemCount: widget.filteredphoneItem.length,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _buildFrontWidget extends StatefulWidget {
  final index;
  final filteredphoneItem;
  _buildFrontWidget(this.index, this.filteredphoneItem, {Key key})
      : super(key: key);

  @override
  __buildFrontWidgetState createState() => __buildFrontWidgetState();
}

class __buildFrontWidgetState extends State<_buildFrontWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Builder(
        builder: (BuildContext context) {
          return Container(
              color: Color(0xFF1abc9c),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      widget.filteredphoneItem[widget.index].brand +
                          "  " +
                          widget.filteredphoneItem[widget.index].pmodel,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800)),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: FlatButton(
                            onPressed: () {
                              SimpleFoldingCellState foldingCellState =
                                  context.ancestorStateOfType(
                                      TypeMatcher<SimpleFoldingCellState>());
                              foldingCellState?.toggleFold();
                            },
                            child: Text(
                              "View More",
                            ),
                            textColor: Colors.white,
                            color: Color(0xFFFFA726),
                            splashColor: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}

class _buildInnerTopWidget extends StatefulWidget {
  final index;
  final filteredphoneItem;
  _buildInnerTopWidget(this.index, this.filteredphoneItem, {Key key})
      : super(key: key);

  @override
  __buildInnerTopWidgetState createState() => __buildInnerTopWidgetState();
}

class __buildInnerTopWidgetState extends State<_buildInnerTopWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Color(0xFFe57373),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/img/samsung.png',
                width: 100.0, height: 100.0, fit: BoxFit.contain),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text(
                        widget.filteredphoneItem[widget.index].brand +
                            " : " +
                            widget.filteredphoneItem[widget.index].pmodel,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 20.0,
                            fontWeight: FontWeight.w800)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                        "IMEI - " + widget.filteredphoneItem[widget.index].imei,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                            fontWeight: FontWeight.w800)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                        "Capacity - " +
                            widget.filteredphoneItem[widget.index].capacity,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                            fontWeight: FontWeight.w800)),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                        "Price - " +
                            widget.filteredphoneItem[widget.index].price,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                            fontSize: 15.0,
                            fontWeight: FontWeight.w800)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _buildInnerBottomWidget extends StatefulWidget {
  final index;
  final filteredphoneItem;
  _buildInnerBottomWidget(this.index, this.filteredphoneItem, {Key key})
      : super(key: key);

  @override
  __buildInnerBottomWidgetState createState() =>
      __buildInnerBottomWidgetState();
}

class __buildInnerBottomWidgetState extends State<_buildInnerBottomWidget> {
  bool _isAdding = false;
  @override
  Widget build(BuildContext context) {
    // print(widget.filteredphoneItem[widget.index].inCart);
    return Container(
      child: Builder(builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  children: <Widget>[
                    _isAdding
                        ? Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.red,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  SimpleFoldingCellState foldingCellState =
                                      context.ancestorStateOfType(TypeMatcher<
                                          SimpleFoldingCellState>());
                                  foldingCellState?.toggleFold();
                                },
                                child: Text(
                                  "Close",
                                ),
                                textColor: Colors.white,
                                color: Colors.indigoAccent,
                                splashColor: Colors.white.withOpacity(0.5),
                              ),
                              ((widget.filteredphoneItem[widget.index]
                                          .inCart) ==
                                      false)
                                  ? FlatButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Add",
                                      ),
                                      textColor: Colors.white,
                                      color: Colors.indigoAccent,
                                      splashColor:
                                          Colors.white.withOpacity(0.5),
                                    )
                                  : FlatButton(
                                      onPressed: () {
                                        setState(() {
                                          _isAdding = true;
                                        });
                                        final selectedPhone = {
                                          "IMEI": widget
                                              .filteredphoneItem[widget.index]
                                              .imei
                                        };
                                        RemoveFromCartService.removeFromCart(
                                                selectedPhone)
                                            .then((success) {
                                          if (success) {
                                            setState(() {
                                              _isAdding = false;
                                            });
                                            print("added");
                                          } else {
                                            setState(() {
                                              _isAdding = false;
                                            });
                                            print("error");
                                          }
                                        });
                                      },
                                      child: Text(
                                        "Remove",
                                      ),
                                      textColor: Colors.white,
                                      color: Colors.indigoAccent,
                                      splashColor:
                                          Colors.white.withOpacity(0.5),
                                    ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
