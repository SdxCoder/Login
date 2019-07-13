import 'package:chopper/chopper.dart';
part 'api_authentication_service.chopper.dart';


@ChopperApi()
abstract class ApiAuthenticationService extends ChopperService{


  /**
   * create method
   * Instantiate ChopperClient with a baseUrl, services, and conveter
   * services - exposes all the http operations
   * converter - converts the json text to json objects
   */
  static ApiAuthenticationService create(){
    final client = ChopperClient(baseUrl: "https://id-api-sb.erply.com/V1/Launchpad",
      services: [
        _$ApiAuthenticationService()
      ],
      converter: JsonConverter()
    );

    return _$ApiAuthenticationService(client);
  }

  /**
   * login method
   * it uses params to authenticate user
   * @param email and password are parameters for this method
   */

 @Post(path : '/login?{parameters[email]}&{parameters[password]}')
 Future<Response> login(
   @Query('parameters[email]') String email,
   @Query('parameters[password]') String password
 );

  /**
   * getUserConfiremdCompanies method
   * it uses params to get the companies of the authenticated user
   * @param jwt are parameters for this method
   */

 @Post(path : '/getUserConfirmedCompanies?{api{jwt}}')
 Future<Response> getUserConfirmedCompanies(
   @Query('api[jwt]') String jwt
 );


  /**
   * getApplications method
   * it uses params to get the applications of the authenticated user
   * @param jwt are parameters for this method
   */
 @Post(path : '/applications?{api{jwt}}')
 Future<Response> getApplications(
   @Query('api[jwt]') String jwt
 );


  /**
   * accessAccount method
   * it uses params to get access to the account details of the authenticated user
   * @param jwt and companyId are parameters for this method
   */
 @Post(path: '/accountAccess?{parameters[companyId]}&{api[jwt]}')
 Future<Response> accessAccount(
   @Query('parameters[companyId]') int companyId,
   @Query('api[jwt]') String jwt
 );

  /**
   * launch method
   * it uses params to launch a specific application against accountId of authenticated User
   * @param jwt and accountId are parameters for this method
   */
 @Post(path: 'launch?{api[jwt]}&{parameters[id]}')
 Future<Response> launch(
   @Query('parameters[id]') int accountId,
   @Query('api[jwt]') String jwt
 );


}