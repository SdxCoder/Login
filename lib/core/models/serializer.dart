import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:erply_assignment/core/models/login_response.dart';
part 'serializer.g.dart';

@SerializersFor(const [
  LoginResponse,
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();