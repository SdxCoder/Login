

import 'package:erply_assignment/core/constants/app_constants.dart';
import 'package:erply_assignment/main.dart';
import 'package:erply_assignment/ui/views/login_view.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

  class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.LayoutPanel:
          return MaterialPageRoute(builder: (_) => LayoutPanel());
      case RoutePaths.Login:
        return MaterialPageRoute(builder: (_) => LoginView());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}

