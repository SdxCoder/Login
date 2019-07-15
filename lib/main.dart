
import 'package:erply_assignment/core/services/apiservices/api_authentication_service.dart';
import 'package:erply_assignment/core/services/apiservices/api_launch_app_service.dart';
import 'package:erply_assignment/provider_setup.dart';
import 'package:erply_assignment/ui/shared/app_theme.dart';
import 'package:erply_assignment/ui/shared/app_theme.dart' as prefix0;
import 'package:erply_assignment/ui/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: OverlaySupport(
              child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
             primaryColor: primaryColor
            ),
            home: LayoutPanel()),
      ),
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
          return LoginView();
        } else {
          return Center(child: Text("Tablet"));
        }
      },
    );
  }
}
