import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

logOut(context) {
  return InkWell(
    onTap: () {
      Alert(
        context: context,
        type: AlertType.warning,
        title: "Log out ?",
        desc: "Are you sure ?",
        buttons: [
          DialogButton(
            child: Text(
              "YES",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/Login', (Route<dynamic> route) => false);
            },
            width: 120,
          ),
          DialogButton(
            child: Text(
              "NO",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    },
    child: Icon(
      Icons.exit_to_app,
      color: Colors.black,
      size: 35,
    ),
  );
}
