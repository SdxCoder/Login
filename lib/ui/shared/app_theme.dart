
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


final overlayColor = const Color(0xff000000).withAlpha(150);


ThemeData themeData = ThemeData(
    primaryColor: Color(hexColor('#f6cc60')),
    primaryColorDark: Color(hexColor('c29c39')),
    accentColor: Color(hexColor('006cff')),
    buttonColor: Color(hexColor('006cff')),
    splashColor: Color(hexColor('c29c39')),
    scaffoldBackgroundColor: Color(hexColor('f6cc60')),
    disabledColor: Color(hexColor('006cff')).withOpacity(0.7),
    highlightColor: Color(hexColor('f6cc60')),
    hintColor: Color(hexColor('b3b3b3')),
    cursorColor: Color(hexColor('312914')),
    textTheme: TextTheme(
      body1: TextStyle(fontSize: 14, color: Color(hexColor('312914'))),
      body2: TextStyle(fontSize: 14, color: Color(hexColor('312914')), fontWeight: FontWeight.bold),
      caption: TextStyle(fontSize: 14, color: Color(hexColor('312914'))),
      display1: TextStyle(fontSize: 18, color: Color(hexColor('312914'))),
      display2: TextStyle(fontSize: 22, color: Color(hexColor('312914'))),
      display3: TextStyle(fontSize: 26, color: Color(hexColor('312914'))),
      display4: TextStyle(fontSize: 36, color: Color(hexColor('312914'))),
      button: TextStyle(fontSize: 14, color: Color(hexColor('ffffff')), fontWeight: FontWeight.w300),
      headline:  TextStyle(fontSize: 16, color: Color(hexColor('312914')), fontWeight: FontWeight.bold),
      overline:  TextStyle(fontSize: 10, color: Color(hexColor('312914'))),
      subhead:  TextStyle(fontSize: 14, color: Color(hexColor('312914'))),
      subtitle:  TextStyle(fontSize: 12, color: Color(hexColor('312914')), fontWeight: FontWeight.bold),
      title:  TextStyle(fontSize: 18, color: Color(hexColor('312914'))),
    )
);


hexColor(String hexCode){
  String colorst = '0xff' + hexCode.replaceAll('#', '');
  int color = int.parse(colorst);
  return color;
}