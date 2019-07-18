// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_authentication_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ApiAuthenticationService extends ApiAuthenticationService {
  _$ApiAuthenticationService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ApiAuthenticationService;

  Future<Response> login(String email, String password) {
    final $url = '/login?{parameters[email]}&{parameters[password]}';
    final Map<String, dynamic> $params = {
      'parameters[email]': email,
      'parameters[password]': password
    };
    final $request = Request('POST', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getUserConfirmedCompanies(String jwt) {
    final $url = '/getUserConfirmedCompanies?{api{jwt}}';
    final Map<String, dynamic> $params = {'api[jwt]': jwt};
    final $request = Request('POST', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getApplications(String jwt) {
    final $url = '/applications?{api{jwt}}';
    final Map<String, dynamic> $params = {'api[jwt]': jwt};
    final $request = Request('POST', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> accessAccount(int companyId, String jwt) {
    final $url = '/accountAccess?{parameters[companyId]}&{api[jwt]}';
    final Map<String, dynamic> $params = {
      'parameters[companyId]': companyId,
      'api[jwt]': jwt
    };
    final $request = Request('POST', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> launch(int accountId, String jwt) {
    final $url = 'launch?{api[jwt]}&{parameters[id]}';
    final Map<String, dynamic> $params = {
      'parameters[id]': accountId,
      'api[jwt]': jwt
    };
    final $request = Request('POST', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
