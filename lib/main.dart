import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LayoutPanel()
    );
  }
}

class LayoutPanel extends StatelessWidget {
  const LayoutPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
         if(constraints.maxWidth < 600){
           return Text("Mobile");
         }
          else{
           return Text("Tablet");
         }
      },
    );
  }
}



