import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salex/ui/MainScreens/Common/logOut.dart';
import 'package:flip_card/flip_card.dart';
import 'package:salex/ui/MainScreens/Phones/phoneListPage.dart';

Widget shopList(context, filteredshopItem) {
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
              Icons.store,
              color: Colors.black,
              size: 35,
            ),
            Text("My Shops List",
                style: TextStyle(fontSize: 24, color: Colors.black)),
            logOut(),
          ],
        ),

        SizedBox(
          height: 10,
        ),
        // Container(
        //   child:
        Expanded(
          child: PageView(
            controller: PageController(viewportFraction: 1),
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            children: <Widget>[
              ListView.builder(
                itemBuilder: (context, itmIndex) {
                  GlobalKey<FlipCardState> index = GlobalKey<FlipCardState>();
                  return FlipCard(
                    key: index,
                    direction: FlipDirection.VERTICAL,
                    flipOnTouch: false,
                    front: _buildFront(itmIndex, filteredshopItem, index),
                    back:
                        _buildBack(itmIndex, filteredshopItem, index, context),
                  );
                },
                itemCount: filteredshopItem.length,
              )
            ],
          ),
        ),
      ],
    ),
  );
}

final baseTextStyle = const TextStyle();

final headerTextStyle = baseTextStyle.copyWith(
    color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.w600);

final regularTextStyle = baseTextStyle.copyWith(
    color: const Color(0xffb6b2df), fontSize: 9.0, fontWeight: FontWeight.w400);

final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);

Widget _buildFront(itmIndex, filteredshopItem, index) {
  return new Container(
      height: 170.0,
      margin: const EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 0.0,
      ),
      child: new Stack(
        children: <Widget>[
          Container(
            margin: new EdgeInsets.fromLTRB(50.0, 16.0, 16.0, 16.0),
            constraints: new BoxConstraints.expand(),
            decoration: new BoxDecoration(
              color: new Color(0xFF333366),
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(8.0),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: new Offset(0.0, 10.0),
                ),
              ],
            ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(height: 25.0),
                new Text(
                  filteredshopItem[itmIndex].name,
                  style: headerTextStyle,
                ),
                new Container(height: 20.0),
                new Text(filteredshopItem[itmIndex].city,
                    style: subHeaderTextStyle),
                new Container(
                    // margin: new EdgeInsets.symmetric(vertical: 8.0),
                    height: 2.0,
                    width: 18.0,
                    color: new Color(0xff00c6ff)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 105,
              width: 105,
              margin: EdgeInsets.only(left: 0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFE0E0E0), width: 5),
                color: Color(0xFF81C784),
              ),
              // margin: new EdgeInsets.symmetric(vertical: 16.0),
              // alignment: FractionalOffset.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text('20 Km'),
                  Text('Ahead'),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8, bottom: 62),
            alignment: FractionalOffset.centerLeft,
            child: new Image(
              image: new AssetImage("assets/img/shop.png"),
              height: 25.0,
              width: 25.0,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 15),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
              ),
              child: Container(
                // alignment: FractionalOffset.centerRight,
                child: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.syncAlt,
                    size: 20,
                    color: Color(0xFFf44336),
                  ),
                  onPressed: () {
                    index.currentState.toggleCard();
                    print("flip button");
                  },
                ),
              ),
            ),
          )
        ],
      ));
}

Widget _buildBack(itmIndex, filteredshopItem, index, context) {
  return new Container(
      height: 170.0,
      margin: const EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 0.0,
      ),
      child: new Stack(
        children: <Widget>[
          Container(
            margin: new EdgeInsets.fromLTRB(50.0, 16.0, 16.0, 16.0),
            constraints: new BoxConstraints.expand(),
            decoration: new BoxDecoration(
              color: new Color(0xFF333366),
              shape: BoxShape.rectangle,
              borderRadius: new BorderRadius.circular(8.0),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  offset: new Offset(0.0, 10.0),
                ),
              ],
            ),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(height: 25.0),
                new Text(
                  filteredshopItem[itmIndex].name,
                  style: headerTextStyle,
                ),
                new Container(height: 20.0),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                        icon: Icon(FontAwesomeIcons.cartPlus),
                        onPressed: () {
                          // Navigator.of(context).pop();
                          print(filteredshopItem[itmIndex].shopID);
                          // Navigator.of(context).pushNamed('/Phones');
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PhoneListPage(
                                  filteredshopItem[itmIndex].shopID)));
                        },
                        tooltip: "Sell Here",
                        iconSize: 40.0,
                        color: Colors.redAccent),
                    IconButton(
                        icon: Icon(Icons.navigation),
                        onPressed: () {
                          // Navigator.of(context).pop();
                          // Navigator.of(context).pushNamed('/Shops');
                        },
                        tooltip: "Navigate Here",
                        iconSize: 40.0,
                        color: Colors.redAccent),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 105,
              width: 105,
              margin: EdgeInsets.only(left: 0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xFFE0E0E0), width: 5),
                color: Color(0xFF81C784),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Text('18 Km'),
                  Text('Ahead'),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8, bottom: 62),
            alignment: FractionalOffset.centerLeft,
            child: new Image(
              image: new AssetImage("assets/img/shop.png"),
              height: 25.0,
              width: 25.0,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 15),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
              ),
              child: Container(
                // alignment: FractionalOffset.centerRight,
                child: IconButton(
                  icon: Icon(
                    FontAwesomeIcons.syncAlt,
                    size: 20,
                    color: Color(0xFFf44336),
                  ),
                  onPressed: () {
                    index.currentState.toggleCard();
                    print("flip button");
                  },
                ),
              ),
            ),
          )
        ],
      ));
}
