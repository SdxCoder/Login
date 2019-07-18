import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService{

  /**
   * create method
   * Instantiate ChopperClient with a baseUrl, services, and conveter
   * services - exposes all the http operations
   * converter - converts the json text to json objects
   */

  static ApiService create(){
    final client = ChopperClient(baseUrl: "https://cloud-sb.erply.com/api",
      services: [
        _$ApiService()
      ],
      converter: JsonConverter(),
      interceptors: [
          HeadersInterceptor({"cookie":"cookie-value"}),
      ]
    );

    return _$ApiService(client);
  }
  
  
  @Get(path: '00000053-a2ca8401-jxrtagdj/core/user')
  Future<Response> getCurrentUser();

  @Get(path: '00000053-a2ca8401-jxrtagdj/{table}')
  Future<Response> getAppUsers(
    @Query('table') String table,
  );

}