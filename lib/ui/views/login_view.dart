import 'dart:io';

import 'package:erply_assignment/core/viewmodels/views/login_view_model.dart';
import 'package:erply_assignment/ui/shared/app_theme.dart';
import 'package:erply_assignment/ui/shared/notification_service.dart';
import 'package:erply_assignment/ui/shared/ui_utils.dart';
import 'package:erply_assignment/ui/views/adduser_view.dart';
import 'package:erply_assignment/ui/views/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  final double margins;
  final double gutters;
  final int columns;
  const LoginView({Key key, this.margins, this.gutters, this.columns})
      : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  Widget _AppBar(BuildContext context) {
    AppBar _appBar = AppBar(
      elevation: 0,
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Center(
              child: InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Add manager account",
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(color: Theme.of(context).accentColor),
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
    return _appBar;
  }

  @override
  Widget build(BuildContext context) {
    Grid(context, widget.gutters, widget.margins, widget.columns);

    return BaseWidget(
        model: LoginViewModel(
            authenticationService: Provider.of(context),
            connectivityService: Provider.of(context),
            loginStorageService: Provider.of(context)),
        child: null,
        builder: (context, model, child) {
          return Scaffold(
              appBar: _AppBar(context),
              body: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: Grid.giveColSpan(4),
                        child: Column(
                          children: <Widget>[
                            Image.asset('images/receptionist.png',
                                width: Grid.giveColSpan(3, increaseBy: 30)),
                            SizedBox(
                              height: widget.gutters,
                            ),
                            Center(
                              child: Text(" Log in with your \nmanager account",
                                  style: Theme.of(context).textTheme.display1),
                            ),
                            SizedBox(
                              height: widget.gutters,
                            ),
                            _loginForm(model, context),
                            SizedBox(
                              height: widget.gutters,
                            ),
                            InkWell(
                                borderRadius: BorderRadius.circular(50),
                                onTap: () {},
                                child: Container(
                                  width: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        "Forget account details",
                                        style: Theme.of(context)
                                            .textTheme
                                            .body1
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .accentColor),
                                      ),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: widget.gutters,
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: Grid.gutter,
                      child: IconButton(
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
            child: Theme(
              data: themeData.copyWith(splashColor: Colors.transparent),
              child: TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    hintText: "E-mail",
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none)),
              ),
            ),
          ),
          SizedBox(
            height: widget.gutters,
          ),
          Container(
            child: Theme(
              data: themeData.copyWith(splashColor: Colors.transparent),
              child: TextFormField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                    hoverColor: Colors.transparent,
                    hintText: "Password",
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none)),
              ),
            ),
          ),
          SizedBox(
            height: widget.gutters,
          ),
          Container(
            child: RaisedButton(
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: model.buzy ? 8.5 : 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: (_emailController.text.isEmpty &
                      _passwordController.text.isEmpty)
                  ? null
                  : () async {
                      SystemChannels.textInput.invokeMethod('TextInput.hide');

                      var hasNetwork = await model.checkConnectivity();

                      if (!hasNetwork) {
                        NotificationService.networkError(context);
                        return;
                      }

                      var isAthenticated = await model.login(
                          _emailController.text, _passwordController.text);

                      if (isAthenticated) {
                        NotificationService.loginSuccess(context);

                        model.setCounter(0);

                        _emailController.clear();

                        _passwordController.clear();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddUserView(
                                margins: widget.margins,
                                gutters: widget.gutters,
                                columns: widget.columns,
                              )),
                        );
                      } else {
                        if (model.loginTries > 3) {
                          NotificationService.tooManyTries(context);
                        } else {
                          NotificationService.loginError(context);
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
                          style: Theme.of(context).textTheme.button,
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
