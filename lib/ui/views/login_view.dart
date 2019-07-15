import 'package:erply_assignment/core/viewmodels/views/login_view_model.dart';
import 'package:erply_assignment/ui/shared/app_theme.dart';
import 'package:erply_assignment/ui/shared/ui_utils.dart';
import 'package:erply_assignment/ui/views/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:overlay_support/overlay_support.dart';

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
                  splashColor: primaryColor,
                  highlightColor: primaryColor,
                  onTap: () {},
                  child: Text(
                    "Add manager account",
                    style: actionTextStyle,
                  ))),
        )
      ],
    );
    _height = MediaQuery.of(context).size.height - _appBar.preferredSize.height;
    return _appBar;
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return BaseWidget(
        model: LoginViewModel(authenticationService: Provider.of(context)),
        child: null,
        builder: (context, model, child) {
          return Scaffold(
                appBar: _AppBar(context),
                backgroundColor: primaryColor,
                body: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Center(
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
                height: _height * 0.30,
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
              _loginForm(model),
              SizedBox(
                height: _height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      width: _width * 0.7,
                      child: InkWell(
                          onTap: () {},
                          child: Center(
                              child: Text(
                            "Forget account details",
                            style: actionTextStyle,
                          )))),
                  InkWell(
                    onTap: () {},
                    child: Image.asset('images/settings.png'),
                  )
                ],
              ),
            ],
          ),
                    ),
                  ),
                ));
        });
  }


  // Login Form

  Widget _loginForm(model) {
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
              padding: EdgeInsets.symmetric(
                  horizontal: 20, vertical: model.buzy ? 8.5 : 14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () async {
                SystemChannels.textInput.invokeMethod('TextInput.hide');
                var isAthenticated = await model.login(
                    _emailController.text, _passwordController.text);
                if (isAthenticated) {
                  _emailController.clear();
                  _passwordController.clear();
                } else {
                  showMessage(context);
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
                          style: btnTextStyle,
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

  /**
   * notify user for success or error 
   */

  showMessage(context) {
    showOverlayNotification((context) {
      return Card(
        margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 100),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: Icon(Icons.warning),
            title: Text('Login Error', style: startupMessageTextStyle,),
            subtitle: RichText(
              text: TextSpan(children: [
                TextSpan(text: "Wrong "),
                TextSpan(text: "username ", style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "or "),
                TextSpan(text: "password", style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "password", style: TextStyle(fontWeight: FontWeight.bold,color: primaryColor)),
              ]),
            ),
            trailing: IconButton(
                icon: Icon(Icons.close, color: secondaryColor,),
                onPressed: () {
                  OverlaySupportEntry.of(context).dismiss();
                }),
          ),
        ),
      );
    }, duration: Duration(milliseconds: 4000));
  }
}
