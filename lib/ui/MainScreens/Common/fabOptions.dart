import 'package:flutter/material.dart';

getOptions(context) {
  return <Widget>[
    IconButton(
        icon: Icon(Icons.home),
        onPressed: () {
          // Navigator.of(context).pop();
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/Home', (Route<dynamic> route) => false);
        },
        tooltip: "Home",
        iconSize: 40.0,
        color: Colors.black),
    // IconButton(
    //     icon: Icon(Icons.phone_android),
    //     onPressed: () {
    //       Navigator.of(context).pop();
    //       Navigator.of(context).pushNamed('/Phones');
    //     },
    //     tooltip: "Phones",
    //     iconSize: 40.0,
    //     color: Colors.black),
    IconButton(
        icon: Icon(Icons.store),
        onPressed: () {
          // Navigator.of(context).pop();
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/Shops', (Route<dynamic> route) => false);
        },
        tooltip: "Shops",
        iconSize: 40.0,
        color: Colors.black),
    IconButton(
        icon: Icon(Icons.monetization_on),
        onPressed: () {
          // Navigator.of(context).pop();
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/Sales', (Route<dynamic> route) => false);
        },
        tooltip: "Sales",
        iconSize: 40.0,
        color: Colors.black),
    IconButton(
        icon: Icon(Icons.assignment_returned),
        onPressed: () {
          // Navigator.of(context).pop();
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/Returns', (Route<dynamic> route) => false);
        },
        tooltip: "Returns",
        iconSize: 40.0,
        color: Colors.black)
  ];
}
