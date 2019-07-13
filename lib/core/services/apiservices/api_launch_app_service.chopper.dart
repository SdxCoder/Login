// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_launch_app_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$ApiLaunchAppService extends ApiLaunchAppService {
  _$ApiLaunchAppService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = ApiLaunchAppService;

  Future<Response> launchApp(String url, String launchCode) {
    final $url = '/${url}{launchCode}';
    final Map<String, dynamic> $params = {'launchCode': launchCode};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
