import 'package:erply_assignment/core/services/apiservices/api_authentication_service.dart';
import 'package:erply_assignment/core/services/viewmodelservices/authentication_service.dart';
import 'package:erply_assignment/core/services/viewmodelservices/connectivity_service.dart';
import 'package:provider/provider.dart';

/**
 * Create List of SingleChildcloneablewidgets providerss
 */
List<SingleChildCloneableWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumeableProviders
];

/**
 * Create List of classes/services which doesn't depend on any 
 * other service/provider
 */

List<SingleChildCloneableWidget> independentServices = [
  // Inject ApiAuthenticationService Dependency
  // (ApiAuthenticationService doesnt depends on any other class/service)

  Provider.value(
    value: ApiAuthenticationService.create(),
  ),
  Provider.value(
    value: ConnectivityService(),
  )
];

/**
 * Create List of providers/classes/services which depend on previously registered
 * providers
 */

List<SingleChildCloneableWidget> dependentServices = [


  // Inject apiauthenticationservice to authenticationservice
  ProxyProvider<ApiAuthenticationService, AuthenticationService>(
      builder: (context, api, authenticationService) {
    return AuthenticationService(api: api);
  }),
  

];

/**
 * Create List of providers which will be consumed by UI
 * providers
 */

List<SingleChildCloneableWidget> uiConsumeableProviders = [];
