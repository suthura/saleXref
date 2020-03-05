import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:salex/Controllers/ApiServices/VerifyEmailService.dart';
import 'package:salex/ui/MainScreens/homepage.dart';
import 'package:salex/Animations/FadeAnimation.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:salex/style/theme.dart' as Theme;

class ResetPassword extends StatefulWidget {
  final resetEmail;
  ResetPassword({Key key, this.resetEmail}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _resetCode = TextEditingController();
  String _errorTxt = '';
  ProgressDialog prd;

  @override
  void initState() {
    setState(() {
      _errorTxt = "";
    });
    log(widget.resetEmail);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    prd = new ProgressDialog(context, type: ProgressDialogType.Normal);
    // pr.style(message: 'Sending Email..');

    prd.style(
        message: 'Verifying Your \nAccount...',
        borderRadius: 10.0,
        progressWidget: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/loading2.gif'),
                    fit: BoxFit.cover))),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progressTextStyle: TextStyle(fontFamily: 'Montserrat', fontSize: 4));

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            _errorTxt = "";
          });
        },
        child: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  Theme.Colors.loginGradientStart,
                  Theme.Colors.loginGradientEnd
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 1.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50.0, left: 14),
                child: Container(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.black,
                    iconSize: 38,
                    onPressed: () {
                      log('Clikced on back btn');
                      Navigator.of(context).pop();
                    },
                  ),
                  alignment: Alignment.centerLeft,
                ),
              ),
              SizedBox(height: 12),
              FadeAnimation(
                0.8,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(64, 75, 105, 1),
                        fontFamily: 'Montserrat',
                        fontSize: 22),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              FadeAnimation(
                0.9,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                  child: RichText(
                    text: TextSpan(
                        text: "Reset code was sent your email. Please \n"
                            "enter ther code and create new password.",
                        style: TextStyle(
                            color: Color.fromRGBO(64, 75, 105, 1),
                            fontSize: 16)),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FadeAnimation(
                1.1,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7.0, horizontal: 25),
                  child: TextField(
                    controller: _resetCode,
                    maxLength: 6,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide:
                                new BorderSide(color: Color(0xFFE0E0E0))),
                        labelText: 'Reset Code',
                        errorText: _errorTxt,
                        errorBorder: _errorTxt.isEmpty
                            ? OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Color(0xFFE0E0E0)))
                            : null,
                        focusedBorder: _errorTxt.isNotEmpty
                            ? OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFE0E0E0)))
                            : null),
                  ),
                ),
              ),
              FadeAnimation(
                1.2,
                Container(
                  padding: EdgeInsets.only(top: 32),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        if (checkNull()) {
                          setState(() {
                            _errorTxt = "";
                          });

                          if (validatePhone()) {
                            prd.show();
                            log('clicked on reset btn');

                            final body = {
                              "email": widget.resetEmail,
                              "code": _resetCode.text
                            };

                            VerifyEmailService.VerifyEmail(body)
                                .then((success) {
                              if (success) {
                                log('account verified');

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomePage()));
                              } else {
                                prd.hide();
                                setState(() {
                                  _errorTxt = "Invalid Code! Check Again";
                                });
                              }
                            });
                          }

                          // Navigator.of(context).pushNamed("/resetpw");
                        } else {
                          prd.hide();
                          setState(() {
                            _errorTxt = "You should fill out this field !";
                          });
                        }
                      },
                      child: Container(
                        height: 51,
                        width: MediaQuery.of(context).size.width / 1.12,
                        decoration: BoxDecoration(
                            color: Theme.Colors.loginGradientEnd,

                            // gradient: LinearGradient(
                            //   colors: [Color(0xFFFFA726), Color(0xFFef5350)],
                            // ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Center(
                          child: Text(
                            'Login'.toUpperCase(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool checkNull() {
    if (_resetCode.text == '') {
      return false;
    } else {
      return true;
    }
  }

  bool validatePhone() {
    if (_resetCode.text.length == 6) {
      print("valid code");
      return true;
    } else {
      setState(() {
        _errorTxt = "The reset code must contain 6 digits !";
      });
      return false;
    }
  }
}
