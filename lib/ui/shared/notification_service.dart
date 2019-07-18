import 'package:erply_assignment/ui/shared/app_theme.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

import 'app_theme.dart';

enum NotificationType { INFO, ACTION }

class NotificationService {
  
  static Flushbar notification(
      BuildContext context, String titleText, String messageText,
      {NotificationType notificationType = NotificationType.ACTION}) {

    Flushbar flush;

    if (notificationType == NotificationType.INFO) {
      return flush = Flushbar(
        titleText: Text(
          titleText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Theme.of(context).primaryColor,
          ),
        ),
        messageText: Text(
          messageText,
          style: TextStyle(
            color: Colors.white,
          ),
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
          color: Theme.of(context).primaryColor,
        ),
        duration: Duration(seconds: 3),
      )..show(context);
    }
    return flush = Flushbar(
      titleText: Text(
        titleText,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Theme.of(context).primaryColor,
        ),
      ),
      messageText: Text(
        messageText,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      mainButton: FlatButton(
          onPressed: () {
            flush.dismiss(true);
          },
          child: Text(
            "DISMIS",
            style: Theme.of(context).textTheme.button,
          )),
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
        color: Theme.of(context).primaryColor,
      ),
      duration: Duration(seconds: 3),
    )..show(context);
  }

  static Flushbar loginError(BuildContext context) {
    notification(
        context, "Login Error", "Wrong e-mail or password.\nTry-Again!");
  }

  static Flushbar loginSuccess(BuildContext context) {
    notification(context, "Success", "Logged-in successfully!", notificationType: NotificationType.INFO);
  }

  static Flushbar tooManyTries(BuildContext context) {
    notification(context, "Error", "Forgotten Account Details? ");
  }

  static Flushbar networkError(BuildContext context) {
    notification(
        context, "Netwrok Error", "An unknown netwrok error has occoured!");
  }
}
