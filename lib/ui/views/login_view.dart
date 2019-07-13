import 'package:erply_assignment/core/viewmodels/views/login_view_model.dart';
import 'package:erply_assignment/ui/shared/app_theme.dart';
import 'package:erply_assignment/ui/shared/ui_utils.dart';
import 'package:erply_assignment/ui/views/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
        model: LoginViewModel(authenticationService: Provider.of(context)),
        child: null,
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
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
            ),
            backgroundColor: primaryColor,
            body: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Column(
  
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'images/receptionist.png',
                      width: Screen(context).height / 2.5,
                      height: Screen(context).height / 2.5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 20),
                      child: Text(
                        " Log in with your \nmanager account",
                        style: startupMessageTextStyle,
                      ),
                    ),
                    Container(
                      width: Screen(context).height / 2.5,
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            hintText: "E-mail",
                            hintStyle: hintTextStyle,
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                     width: Screen(context).height / 2.5,
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: hintTextStyle,
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      width: Screen(context).height/2.5,
                      child: RaisedButton(
                        color: secondaryColor,
                        padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)
                        ),
                        onPressed: () async {
                                var isAthenticated = await model.login(_emailController.text , _passwordController.text);
                        if(isAthenticated){
                          Scaffold.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 2),content: Text("Logged in"),));
                        }else{
                           Scaffold.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 2),content: Text("Wrong userneme"),));
                        }

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Log-in", style: btnTextStyle,),
                            SizedBox(width: 10,),
                            Image.asset('images/key.png')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
