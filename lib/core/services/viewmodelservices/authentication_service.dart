import 'dart:async';
import 'dart:convert';

import 'package:erply_assignment/core/models/login_response.dart';
import 'package:erply_assignment/core/models/serializer.dart';
import 'package:erply_assignment/core/services/apiservices/api_authentication_service.dart';
import 'package:erply_assignment/core/services/localstorageservice/login_localstorage_service.dart';
import 'package:erply_assignment/core/services/localstorageservice/shared_prefernces.dart';

/**
 * A service to be consumed by the login-view-model
 */

class AuthenticationService {

  final ApiAuthenticationService apiAuthenticationService;

  AuthenticationService({this.apiAuthenticationService});


  LoginResponse _user;
  LoginResponse get user => _user;


  /**
   * login method
   * Uses params to authenticate user 
   * Returns false if jwt is null
   */
  Future<bool> login(String email, String password) async {
    var response = await apiAuthenticationService.login(email, password);



    // Deserializing the response to model - Login Response

    LoginResponse loginResponse = serializers.deserializeWith(LoginResponse.serializer, response.body);

    var hasJwt = loginResponse.result.jwt != null;
    
    // if jwt in not null, save the loginResponse
    if(hasJwt){
      _user = loginResponse;
    }

    return hasJwt;
  }
}
