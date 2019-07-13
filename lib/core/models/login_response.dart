import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

part 'login_response.g.dart';

abstract class LoginResponse implements Built<LoginResponse, LoginResponseBuilder> {
  static Serializer<LoginResponse> get serializer => _$loginResponseSerializer;

  Result get result;
  LoginResponse._();
  factory LoginResponse([void Function(LoginResponseBuilder) updates]) = _$LoginResponse;
}


abstract class Result implements Built<Result, ResultBuilder> {
  static Serializer<Result> get serializer => _$resultSerializer;
  
  String get jwt;

  Result._();
  factory Result([void Function(ResultBuilder) updates]) = _$Result;
}