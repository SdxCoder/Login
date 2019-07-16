import 'dart:io';

import 'package:erply_assignment/core/viewmodels/views/login_view_model.dart';
import 'package:erply_assignment/ui/shared/app_theme.dart';
import 'package:erply_assignment/ui/shared/app_theme.dart' as prefix0;
import 'package:erply_assignment/ui/shared/notification_service.dart';
import 'package:erply_assignment/ui/shared/ui_utils.dart';
import 'package:erply_assignment/ui/views/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flushbar/flushbar.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Screen _screen;
  double _width;
  double _height;

  Widget _AppBar(BuildContext context) {
    AppBar _appBar = AppBar(
      elevation: 0,
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Center(
              child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  splashColor: splashColor,
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Add manager account",
                      style: actionTextStyle,
                    ),
                  ))),
        )
      ],
    );

    if (Platform.isIOS) {
      return SafeArea(
        child: _appBar,
      );
    }
    _height = MediaQuery.of(context).size.height - _appBar.preferredSize.height;
    return _appBar;
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;

    return BaseWidget(
        model: LoginViewModel(authenticationService: Provider.of(context)),
        child: null,
        builder: (context, model, child) {
          return Scaffold(
              appBar: _AppBar(context),
              backgroundColor: primaryColor,
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: _height * 0.03),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: _height * 0.07,
                            ),
                            Image.asset(
                              'images/receptionist.png',
                              width: _width * 0.5,
                              height: _height * 0.3,
                            ),
                            SizedBox(
                              height: _height * 0.03,
                            ),
                            Center(
                              child: Text(
                                " Log in with your \nmanager account",
                                style: startupMessageTextStyle,
                              ),
                            ),
                            SizedBox(
                              height: _height * 0.07,
                            ),
                            _loginForm(model, context),
                            SizedBox(
                              height: _height * 0.03,
                            ),
                            InkWell(
                                borderRadius: BorderRadius.circular(50),
                                splashColor: splashColor,
                                onTap: () {},
                                child: Container(
                                  width: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                  "Forget account details",
                                  style: actionTextStyle,
                                ),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: _width * 0.1,
                      child: IconButton(
                        splashColor: primaryColorDark,
                        onPressed: () {},
                        icon: Image.asset('images/settings.png'),
                      ),
                    )
                  ],
                ),
              ));
        });
  }

  // Login Form

  Widget _loginForm(model, BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          Container(
            width: _width * 0.65,
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                  hintText: "E-mail",
                  hintStyle: hintTextStyle,
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none)),
            ),
          ),
          SizedBox(
            height: _height * 0.02,
          ),
          Container(
            width: _width * 0.65,
            child: TextFormField(
              obscureText: true,
              controller: _passwordController,
              decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: hintTextStyle,
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none)),
            ),
          ),
          SizedBox(
            height: _height * 0.02,
          ),
          Container(
            width: _width * 0.65,
            child: RaisedButton(
              color: secondaryColor,
              disabledColor: secondaryColor.withAlpha(200),
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: model.buzy ? 8.5 : 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: (_emailController.text.isEmpty &
                      _passwordController.text.isEmpty)
                  ? null
                  : () async {
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      var isAthenticated = await model.login(
                          _emailController.text, _passwordController.text);
                      if (isAthenticated) {
                        NotificationService.loginSuccess()..show(context);

                        model.setCounter(0);

                        _emailController.clear();

                        _passwordController.clear();
                      } else {
                        if (model.loginTries > 3) {
                          NotificationService.tooManyTries()..show(context);
                        } else {
                          NotificationService.loginError()..show(context);
                        }
                      }
                    },
              child: model.buzy
                  ? Center(
                      child: SizedBox(
                          height: 27,
                          width: 27,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.white,
                            strokeWidth: 2,
                          )),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Log-in",
                          style: btnTextStyleLight,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset('images/key.png')
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
