

import 'package:erply_assignment/core/models/login_response.dart';
import 'package:erply_assignment/core/services/localstorageservice/shared_prefernces.dart';
import 'package:erply_assignment/core/services/localstorageservice/shared_prefernces.dart';

class LoginStorageService extends LocalStorageService{

  static const String LoginKey = "login";

  


  LoginResponse get getloginResponse{
    var loginJson = getFromDisk(LoginKey);
    if(loginJson == null){
      return null;
    }
  }

  void saveloginResponse(LoginResponse loginResponse){
    saveToDisk(LoginKey, loginResponse);
  }


}