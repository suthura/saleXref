import 'package:flutter/material.dart';

getOptions() {
  return <Widget>[
    IconButton(
        icon: Icon(Icons.home),
        onPressed: () {},
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
        color: Colors.black),
    IconButton(
        icon: Icon(Icons.shopping_basket),
        onPressed: () {},
        tooltip: "Cart",
        iconSize: 40.0,
        color: Colors.black),
  ];
}
