import 'package:erply_assignment/core/services/viewmodelservices/authentication_service.dart';
import 'package:flutter/cupertino.dart';

class LoginViewModel extends ChangeNotifier {
  AuthenticationService _authenticationService;

  bool _buzy = false;

  LoginViewModel({@required AuthenticationService authenticationService})
      : _authenticationService = authenticationService;

  bool get buzy => _buzy;

  Future<bool> login(String email, String password) async {
    _setBuzy(true);
    var userAuthenticated = await _authenticationService.login(email.trim(), password.trim());
    _setBuzy(false);

    return userAuthenticated;
  }

  void _setBuzy(bool value) {
    _buzy = value;
    notifyListeners();
  }
}
