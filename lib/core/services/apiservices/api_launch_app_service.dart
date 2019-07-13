import 'package:chopper/chopper.dart';
import 'package:erply_assignment/core/services/apiservices/launch_app_interceptor.dart';

part 'api_launch_app_service.chopper.dart';


@ChopperApi()
abstract class ApiLaunchAppService extends ChopperService{

  static ApiLaunchAppService create(){
     final client = ChopperClient(
      services: [
        _$ApiLaunchAppService()
      ],
      converter: JsonConverter(),
      interceptors: [
        LaunchAppInterceptor(),
      ]
    );

    return _$ApiLaunchAppService(client);
  }
 

  @Get(path: '{url}{launchCode}')
  Future<Response> launchApp(
    @Path('url') String url,
    @Query('launchCode') String launchCode,
  );
}