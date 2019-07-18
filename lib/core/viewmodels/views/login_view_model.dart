import 'package:erply_assignment/core/services/localstorageservice/login_localstorage_service.dart';
import 'package:erply_assignment/core/services/viewmodelservices/authentication_service.dart';
import 'package:erply_assignment/core/services/viewmodelservices/connectivity_service.dart';
import 'package:erply_assignment/core/viewmodels/base_model.dart';
import 'package:flutter/cupertino.dart';


/**
 * Login View Model
 * Wraps the login-view to provide the needed services
 */
class LoginViewModel extends BaseModel {
  AuthenticationService _authenticationService;
  ConnectivityService _connectivityService;
  LoginStorageService _loginStorageService;

  bool _buzy = false;
  int _loginTries = 0;

  LoginViewModel(
      {@required AuthenticationService authenticationService,
      @required ConnectivityService connectivityService,
      @required LoginStorageService loginStorageService
     }) {
    _authenticationService = authenticationService;
    _connectivityService = connectivityService;
    _loginStorageService = loginStorageService;
  }

  bool get buzy => _buzy;
  int get loginTries => _loginTries;

  void setCounter(counter) {
    _loginTries = counter;
  }

  /**
   * Authenticates user using authentication service 
   * and returns hasJwt 
   */

  Future<bool> login(String email, String password) async {
    checkConnectivity();
    setBusy(true);
    var hasJwt = await _authenticationService.login(email.trim(), password.trim());

    if(hasJwt){
       _loginStorageService.saveloginResponse(_authenticationService.user);
    }

    _manageLoginTries(hasJwt);

    setBusy(false);

    return hasJwt;
  }
  
  /**
   * Checks the network status using connectivitService
   * Returns true if netwrok , false if no netwrork
   */

  Future<bool> checkConnectivity() async {
    NetworkStatus status = await _connectivityService.checkConnectivity();

    if (status == NetworkStatus.None) {
      return false;
    } else {
      return true;
    }
  }

  /**
   * Manages the number of times user tries to login
   * and increments the counter
   */

  void _manageLoginTries(hasJwt) {
    if (hasJwt == false) {
      _loginTries++;
    }
  }
}
