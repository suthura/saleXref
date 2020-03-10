import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:salex/ui/MainScreens/Common/logOut.dart';

Widget phoneList(context, filteredphoneItem) {
  return Container(
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
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Stack(
              children: <Widget>[
                new IconButton(
                  icon: new Icon(
                    Icons.shopping_cart,
                    color: Colors.black45,
                  ),
                  onPressed: null,
                ),
                new Positioned(
                    child: new Stack(
                  children: <Widget>[
                    new Icon(Icons.brightness_1,
                        size: 20.0, color: Colors.red[700]),
                    new Positioned(
                        top: 3.0,
                        right: 7,
                        child: new Center(
                          child: new Text(
                            "5",
                            style: new TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ],
                )),
              ],
            ),
          ],
        ),
        // SizedBox(
        //   height: 10,
        // ),
        Expanded(
          child: PageView(
            controller: PageController(viewportFraction: 1),
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            children: <Widget>[
              ListView.builder(
                itemBuilder: (context, index) {
                  return SimpleFoldingCell(
                      frontWidget: _buildFrontWidget(index, filteredphoneItem),
                      innerTopWidget:
                          _buildInnerTopWidget(index, filteredphoneItem),
                      innerBottomWidget:
                          _buildInnerBottomWidget(index, filteredphoneItem),
                      cellSize: Size(MediaQuery.of(context).size.width, 125),
                      padding: EdgeInsets.all(15),
                      animationDuration: Duration(milliseconds: 300),
                      borderRadius: 10,
                      onOpen: () => print('$index cell opened'),
                      onClose: () => print('$index cell closed'));
                },
                itemCount: filteredphoneItem.length,
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildFrontWidget(index, filteredphoneItem) {
  return Builder(
    builder: (BuildContext context) {
      return Container(
          color: Color(0xFF1abc9c),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  filteredphoneItem[index].brand +
                      "  " +
                      filteredphoneItem[index].pmodel,
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
  );
}

Widget _buildInnerTopWidget(index, filteredphoneItem) {
  return Container(
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
                    filteredphoneItem[index].brand +
                        " : " +
                        filteredphoneItem[index].pmodel,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800)),
              ],
            ),
            Row(
              children: <Widget>[
                Text("IMEI - " + filteredphoneItem[index].imei,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w800)),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Capacity - " + filteredphoneItem[index].capacity,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w800)),
              ],
            ),
            Row(
              children: <Widget>[
                Text("Price - " + filteredphoneItem[index].price,
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
  );
}

Widget _buildInnerBottomWidget(index, filteredphoneItem) {
  return Builder(builder: (context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Row(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        SimpleFoldingCellState foldingCellState =
                            context.ancestorStateOfType(
                                TypeMatcher<SimpleFoldingCellState>());
                        foldingCellState?.toggleFold();
                      },
                      child: Text(
                        "Close",
                      ),
                      textColor: Colors.white,
                      color: Colors.indigoAccent,
                      splashColor: Colors.white.withOpacity(0.5),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        "Add",
                      ),
                      textColor: Colors.white,
                      color: Colors.indigoAccent,
                      splashColor: Colors.white.withOpacity(0.5),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  });
}
