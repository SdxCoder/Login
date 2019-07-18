

import 'package:erply_assignment/core/models/login_response.dart';
import 'package:erply_assignment/core/services/localstorageservice/shared_prefernces.dart';
import 'package:erply_assignment/core/services/localstorageservice/shared_prefernces.dart';

class LoginStorageService extends LocalStorageService{

  // constant for the LoginResponse key

  static const String LoginKey = "login";
  

  /**
   * getLoginResponse method
   * overrides the getFromDisk method to get the saved login details
   */

  LoginResponse get getloginResponse{
    var loginJson = getFromDisk(LoginKey);
    if(loginJson == null){
      return null;
    }
  }

  
  /**
   * saveLoginResponse method
   * overrides the saveToFromDisk method to save loginResponse to local Storage 
   * for automatic login later on.
   */

  void saveloginResponse(LoginResponse loginResponse){
    saveToDisk(LoginKey, loginResponse);
  }


}