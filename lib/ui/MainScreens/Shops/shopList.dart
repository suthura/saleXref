import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:salex/ui/MainScreens/Common/logOut.dart';

Widget shopList(context) {
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
          height: 50,
        ),
        // Container(
        //   child:
        Expanded(
          child: PageView(
            controller: PageController(viewportFraction: 1),
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            children: <Widget>[
              
            ],
          ),
        ),
        // ),
      ],
    ),
  );
  // ),
  //   ),
  // ),
  // );
}
