import 'package:flutter/material.dart';
import 'package:salex/ui/Login/login_page.dart';
import 'package:salex/ui/MainScreens/Dashboard/dashboarspage.dart';
import 'package:salex/ui/MainScreens/Phones/phoneListPage.dart';
import 'package:salex/ui/MainScreens/Shops/shopListPage.dart';
import 'package:salex/ui/MainScreens/Sales/saleListPage.dart';
import 'package:salex/ui/MainScreens/Returns/returnsListPage.dart';
import 'package:salex/ui/MainScreens/Checkout/CheckoutPage.dart';
import 'package:salex/ui/Troublelogin/forgotPassword.dart';

getRoutes() {
  return <String, WidgetBuilder>{
    "/forgotpw": (BuildContext context) => new ForgotPassword(),
    "/appRoute": (BuildContext context) => new LoginPage(),
    "/Home": (BuildContext context) => new HomePage(),
    // "/Phones": (BuildContext context) => new PhoneListPage(),
    "/Shops": (BuildContext context) => new ShopListPage(),
    "/Sales": (BuildContext context) => new SaleListPage(),
    "/Returns": (BuildContext context) => new ReturnsListPage(),
    "/Login": (BuildContext context) => new LoginPage(),
    // "/Checkout": (BuildContext context) => new CheckoutPage(),
  };
}
