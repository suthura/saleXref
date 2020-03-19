import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:salex/ui/MainScreens/Checkout/CheckoutPage.dart';
import 'package:salex/Controllers/ApiServices/addToCartService.dart';
import 'package:salex/ui/MainScreens/Common/logOut.dart';

class phoneList extends StatefulWidget {
  final context;
  final filteredphoneItem;
  final shopID;

  phoneList(this.context, this.filteredphoneItem, this.shopID, {Key key})
      : super(key: key);

  @override
  _phoneListState createState() => _phoneListState();
}

class _phoneListState extends State<phoneList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          print("checkout");
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                  builder: (context) => CheckoutPage(widget.shopID)),
              (Route<dynamic> route) => false);

          // Navigator.of(context).pushNamedAndRemoveUntil(
          //     "/Checkout", (Route<dynamic> route) => false);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Continue Checkout"),
            IconButton(
              icon: Icon(Icons.forward),
              onPressed: () {},
            )
          ],
        ),
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
                Text("My Phone List",
                    style: TextStyle(fontSize: 24, color: Colors.black)),
                logOut(),
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
                                      onPressed: () {
                                        setState(() {
                                          _isAdding = true;
                                        });
                                        final selectedPhone = {
                                          "IMEI": widget
                                              .filteredphoneItem[widget.index]
                                              .imei
                                        };
                                        AddToCartService.addToCart(
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
                                        "Add",
                                      ),
                                      textColor: Colors.white,
                                      color: Colors.indigoAccent,
                                      splashColor:
                                          Colors.white.withOpacity(0.5),
                                    )
                                  : FlatButton(
                                      onPressed: () {
                                        // final selectedPhone = {
                                        //   "imei": widget
                                        //       .filteredphoneItem[widget.index].imei,
                                        //   "brand": widget
                                        //       .filteredphoneItem[widget.index].brand
                                        // };
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
