
import 'package:erply_assignment/provider_setup.dart';
import 'package:erply_assignment/ui/shared/app_theme.dart';
import 'package:erply_assignment/ui/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: LayoutPanel()),
    );
  }
}

class LayoutPanel extends StatelessWidget {
  const LayoutPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 600) {
          print(constraints.maxWidth);
          return LoginView(margins: 16, gutters: 16, columns: 4,);
        } 

        if(constraints.maxWidth < 720){
          return LoginView(margins: 16, gutters: 16, columns: 8,);
        }

        if(constraints.maxWidth < 840){
          return LoginView(margins: 24, gutters: 24, columns: 8,);
        }

        if(constraints.maxWidth > 840){
           return LoginView(margins: 24, gutters: 24, columns: 12,);
        }
      },
    );
  }
}
