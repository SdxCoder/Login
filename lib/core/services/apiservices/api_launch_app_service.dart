import 'package:chopper/chopper.dart';
import 'package:erply_assignment/core/services/apiservices/launch_app_interceptor.dart';

part 'api_launch_app_service.chopper.dart';


@ChopperApi()
abstract class ApiLaunchAppService extends ChopperService{


   /**
   * create method
   * Instantiate ChopperClient with a baseUrl, services, and conveter
   * services - exposes all the http operations
   * converter - converts the json text to json objects
   */

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
 
  /**
   * launchApp method
   * it uses params to launch the cloud application
   * @param url and launchCode are parameters for this method
   */

  @Get(path: '{url}{launchCode}')
  Future<Response> launchApp(
    @Path('url') String url,
    @Query('launchCode') String launchCode,
  );
}