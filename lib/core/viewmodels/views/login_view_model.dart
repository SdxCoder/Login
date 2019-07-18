import 'package:erply_assignment/core/services/viewmodelservices/authentication_service.dart';
import 'package:erply_assignment/core/services/viewmodelservices/connectivity_service.dart';
import 'package:flutter/cupertino.dart';

class LoginViewModel extends ChangeNotifier {
  AuthenticationService _authenticationService;
  ConnectivityService _connectivityService;

  bool _buzy = false;
  bool _networkStatus = true;
  int _loginTries = 0;

  LoginViewModel(
      {@required AuthenticationService authenticationService,
      @required ConnectivityService connectivityService}) {
    _authenticationService = authenticationService;
    _connectivityService = connectivityService;
  }

  bool get buzy => _buzy;
  bool get networkStatus => _networkStatus;
  int get loginTries => _loginTries;

  void setCounter(counter) {
    _loginTries = counter;
  }

  Future<bool> login(String email, String password) async {
    checkConnectivity();
    _setBuzy(true);

    var userAuthenticated =
        await _authenticationService.login(email.trim(), password.trim());

    _manageLoginTries(userAuthenticated);

    _setBuzy(false);

    return userAuthenticated;
  }

  Future<bool> checkConnectivity() async {
    NetworkStatus status = await _connectivityService.checkConnectivity();

    if (status == NetworkStatus.None) {
      return false;
    } else {
      return true;
    }
  }

  void _manageLoginTries(hasJwt) {
    if (hasJwt == false) {
      _loginTries++;
    }
  }

  void _setBuzy(bool value) {
    _buzy = value;
    notifyListeners();
  }

  void _setNetworkStatus(bool value) {
    _networkStatus = value;
  }
}
