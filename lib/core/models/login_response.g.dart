// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LoginResponse> _$loginResponseSerializer =
    new _$LoginResponseSerializer();
Serializer<Result> _$resultSerializer = new _$ResultSerializer();

class _$LoginResponseSerializer implements StructuredSerializer<LoginResponse> {
  @override
  final Iterable<Type> types = const [LoginResponse, _$LoginResponse];
  @override
  final String wireName = 'LoginResponse';

  @override
  Iterable<Object> serialize(Serializers serializers, LoginResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'result',
      serializers.serialize(object.result,
          specifiedType: const FullType(Result)),
    ];

    return result;
  }

  @override
  LoginResponse deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'result':
          result.result.replace(serializers.deserialize(value,
              specifiedType: const FullType(Result)) as Result);
          break;
      }
    }

    return result.build();
  }
}

class _$ResultSerializer implements StructuredSerializer<Result> {
  @override
  final Iterable<Type> types = const [Result, _$Result];
  @override
  final String wireName = 'Result';

  @override
  Iterable<Object> serialize(Serializers serializers, Result object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.jwt != null) {
      result
        ..add('jwt')
        ..add(serializers.serialize(object.jwt,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  Result deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'jwt':
          result.jwt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LoginResponse extends LoginResponse {
  @override
  final Result result;

  factory _$LoginResponse([void Function(LoginResponseBuilder) updates]) =>
      (new LoginResponseBuilder()..update(updates)).build();

  _$LoginResponse._({this.result}) : super._() {
    if (result == null) {
      throw new BuiltValueNullFieldError('LoginResponse', 'result');
    }
  }

  @override
  LoginResponse rebuild(void Function(LoginResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginResponseBuilder toBuilder() => new LoginResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginResponse && result == other.result;
  }

  @override
  int get hashCode {
    return $jf($jc(0, result.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginResponse')..add('result', result))
        .toString();
  }
}

class LoginResponseBuilder
    implements Builder<LoginResponse, LoginResponseBuilder> {
  _$LoginResponse _$v;

  ResultBuilder _result;
  ResultBuilder get result => _$this._result ??= new ResultBuilder();
  set result(ResultBuilder result) => _$this._result = result;

  LoginResponseBuilder();

  LoginResponseBuilder get _$this {
    if (_$v != null) {
      _result = _$v.result?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginResponse;
  }

  @override
  void update(void Function(LoginResponseBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginResponse build() {
    _$LoginResponse _$result;
    try {
      _$result = _$v ?? new _$LoginResponse._(result: result.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'result';
        result.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LoginResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Result extends Result {
  @override
  final String jwt;

  factory _$Result([void Function(ResultBuilder) updates]) =>
      (new ResultBuilder()..update(updates)).build();

  _$Result._({this.jwt}) : super._();

  @override
  Result rebuild(void Function(ResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResultBuilder toBuilder() => new ResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Result && jwt == other.jwt;
  }

  @override
  int get hashCode {
    return $jf($jc(0, jwt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Result')..add('jwt', jwt)).toString();
  }
}

class ResultBuilder implements Builder<Result, ResultBuilder> {
  _$Result _$v;

  String _jwt;
  String get jwt => _$this._jwt;
  set jwt(String jwt) => _$this._jwt = jwt;

  ResultBuilder();

  ResultBuilder get _$this {
    if (_$v != null) {
      _jwt = _$v.jwt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Result other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Result;
  }

  @override
  void update(void Function(ResultBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Result build() {
    final _$result = _$v ?? new _$Result._(jwt: jwt);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
