import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:salex/ui/MainScreens/logOut.dart';

Widget dashboard(context) {
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
              Icons.home,
              color: Colors.black,
              size: 35,
            ),
            Text("My Dashboard",
                style: TextStyle(fontSize: 24, color: Colors.black)),
            logOut(),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          height: 200,
          child: PageView(
            controller: PageController(viewportFraction: 0.8),
            scrollDirection: Axis.horizontal,
            pageSnapping: true,
            children: <Widget>[
              Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  gradient: new LinearGradient(
                      colors: [Color(0xFF1abc9c), Color(0xFF1abc9c)],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/img/sale.png', width: 80),
                    ),
                    Text(
                      "Your Total Sales :",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      "Rs .25000",
                      style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    )
                  ],
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 100,
              ),
              Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  gradient: new LinearGradient(
                      colors: [Color(0xFFe57373), Color(0xFFe57373)],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Image.asset('assets/img/smartphone.png', width: 80),
                    ),
                    Text("Your Available Phones",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900)),
                    Text("Rs .25000",
                        style: TextStyle(
                            color: Colors.amberAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.w900))
                  ],
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 100,
              ),
              Container(
                decoration: new BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  gradient: new LinearGradient(
                      colors: [Color(0xFFFFB74D), Color(0xFFFFB74D)],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/img/sale2.png', width: 80),
                    ),
                    Text("Your Total Sales",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900)),
                    Text("Rs .25000",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w900))
                  ],
                ),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                width: 100,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Recent Transactions",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        SizedBox(
          height: 15,
        ),
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
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
                        title: Text("Test Title",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                        subtitle: Text("sample"),
                        trailing: Text("sample trail",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(height: 16);
              },
              itemCount: 5),
        )
      ],
    ),
  );
  // ),
  //   ),
  // ),
  // );
}
