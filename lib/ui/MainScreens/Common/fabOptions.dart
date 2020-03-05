import 'package:flutter/material.dart';

getOptions(context) {
  return <Widget>[
    IconButton(
        icon: Icon(Icons.home),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pushNamed('/Home');
        },
        tooltip: "Home",
        iconSize: 40.0,
        color: Colors.black),
    IconButton(
        icon: Icon(Icons.phone_android),
        onPressed: () {},
        tooltip: "Phones",
        iconSize: 40.0,
        color: Colors.black),
    IconButton(
        icon: Icon(Icons.store),
        onPressed: () {},
        tooltip: "Shops",
        iconSize: 40.0,
        color: Colors.black),
    IconButton(
        icon: Icon(Icons.monetization_on),
        onPressed: () {},
        tooltip: "Sales",
        iconSize: 40.0,
        color: Colors.black),
    IconButton(
        icon: Icon(Icons.assignment_returned),
        onPressed: () {},
        tooltip: "Returns",
        iconSize: 40.0,
        color: Colors.black)
  ];
}
