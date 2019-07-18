import 'dart:async';
import 'dart:convert';

import 'package:erply_assignment/core/models/login_response.dart';
import 'package:erply_assignment/core/models/serializer.dart';
import 'package:erply_assignment/core/services/apiservices/api_authentication_service.dart';
import 'package:erply_assignment/core/services/localstorageservice/login_localstorage_service.dart';
import 'package:erply_assignment/core/services/localstorageservice/shared_prefernces.dart';

class AuthenticationService {
  final ApiAuthenticationService apiAuthenticationService;

  AuthenticationService({this.apiAuthenticationService});


  LoginResponse _user;
  LoginResponse get user => _user;



  Future<bool> login(String email, String password) async {
    var response = await apiAuthenticationService.login(email, password);

    LoginResponse loginResponse =
        serializers.deserializeWith(LoginResponse.serializer, response.body);

    var hasJwt = loginResponse.result.jwt != null;

    if(hasJwt){
      _user = loginResponse;
    }

    return hasJwt;
  }
}
