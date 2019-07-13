import 'package:flutter/material.dart';

// class Screen extends StatelessWidget {
//   final Widget child;
//   Screen({Key key, this.child}) : super(key: key);

//   var _width;

//   var _height;

//   var _oreintation;

//   get width => _width;

//   get height => _height;

//   get oreintation => _oreintation;

//   @override
//   Widget build(BuildContext context) {
//     _width = MediaQuery.of(context).size.width;
//     _height = MediaQuery.of(context).size.height;
//     _oreintation = MediaQuery.of(context).orientation;
//     return child;
//   }
// }

class Screen{
  final BuildContext context;

  var _width;

  var _height;

  var _oreintation;

  get width => _width;

  get height => _height;

  get oreintation => _oreintation;

  Screen(this.context) {
     _width = MediaQuery.of(context).size.width;
     _height = MediaQuery.of(context).size.height;
     _oreintation = MediaQuery.of(context).orientation;
     print(height);
  }
}