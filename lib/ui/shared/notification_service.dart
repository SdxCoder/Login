import 'package:erply_assignment/ui/shared/app_theme.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

import 'app_theme.dart';

class NotificationService {


  static Flushbar loginError() {
    Flushbar flush;
    return flush = Flushbar(
      titleText: Text(
        "Login Error",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: primaryColor,
           ),
      ),
      messageText: Text(
        "Wrong e-mail or password.\nTry-Again!",
        style:
            TextStyle(color: Colors.white,),
      ),
      mainButton: FlatButton(
        onPressed: () {
          flush.dismiss(true);
        },
        child: Text("DISMIS", style: btnTextStyleBold,)
      ),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
      aroundPadding: EdgeInsets.all(8),
      overlayBlur: 0.0001,
      overlayColor: overlayColor,
      borderRadius: 8,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      icon: Icon(
        Icons.error,
        color: primaryColor,
      ),
      duration: Duration(seconds: 3),
    );
  }


  static Flushbar loginSuccess() {
    Flushbar flush;
    return flush = Flushbar(
      titleText: Text(
        "Success",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: primaryColor,
            fontFamily: "ShadowsIntoLightTwo"),
      ),
      messageText: Text("Logged-in successfully!", style: TextStyle(color: Colors.white),),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
      aroundPadding: EdgeInsets.all(8),
      overlayBlur: 0.0001,
      overlayColor: overlayColor,
      borderRadius: 8,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      icon: Icon(
        Icons.check_circle,
        color: primaryColor,
      ),
      duration: Duration(seconds: 3),
    );
  }


  static Flushbar tooManyTries() {
    Flushbar flush;
    return flush = Flushbar(
      titleText: Text(
        "Error",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: primaryColor,
            fontFamily: "ShadowsIntoLightTwo"),
      ),
      messageText: Text("Forgotten Account Details? ", style: TextStyle(color: Colors.white) ),
      mainButton: FlatButton(
        onPressed: () {
          flush.dismiss(true);
        },
        child: Text("DISMIS", style: btnTextStyleBold,)
      ),
      flushbarStyle: FlushbarStyle.FLOATING,
      flushbarPosition: FlushbarPosition.TOP,
      aroundPadding: EdgeInsets.all(8),
      overlayBlur: 0.0001,
      overlayColor: overlayColor,
      borderRadius: 8,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.slowMiddle,
      icon: Icon(
        Icons.error,
        color: primaryColor,
      ),
      duration: Duration(seconds: 3),
    );
  }



}
