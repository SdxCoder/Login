import 'dart:convert';

import 'package:erply_assignment/core/models/login_response.dart';
import 'package:erply_assignment/core/models/serializer.dart';
import 'package:erply_assignment/core/services/apiservices/api_authentication_service.dart';

class AuthenticationService {
  final ApiAuthenticationService _apiAuthenticationService;

  AuthenticationService({ApiAuthenticationService api})
      : _apiAuthenticationService = api;

  Future<bool> login(String email, String password) async {
    var response = await _apiAuthenticationService.login(email, password);

    LoginResponse loginResponse =
        serializers.deserializeWith(LoginResponse.serializer, response.body);

    var hasJwt = loginResponse.result.jwt != null;

    return hasJwt;
  }
}
