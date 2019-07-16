import 'package:erply_assignment/core/services/viewmodelservices/authentication_service.dart';
import 'package:flutter/cupertino.dart';

class LoginViewModel extends ChangeNotifier {
  AuthenticationService _authenticationService;

  bool _buzy = false;
  int _loginTries = 0;

  LoginViewModel({@required AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  bool get buzy => _buzy;
  int get loginTries => _loginTries;

  void setCounter(counter){
    _loginTries = counter;
  }

  Future<bool> login(String email, String password) async {

      _setBuzy(true);

      var userAuthenticated = await _authenticationService.login(email.trim(), password.trim());

      _manageLoginTries(userAuthenticated);

      _setBuzy(false);

      return userAuthenticated;

  }

  void _manageLoginTries(hasJwt){
      if(hasJwt == false){
        _loginTries++;
      }
  }

  void _setBuzy(bool value) {
    _buzy = value;
    notifyListeners();
  }
}
