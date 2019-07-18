import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

enum NetworkStatus{
        Mobile,
        Wifi,
        None
    }


// A service to check netwrok status
// This service can consumed by any view-model which is network sensitive

class ConnectivityService {
  Connectivity _connectivity;

  ConnectivityService() {
    _connectivity = Connectivity();
  }
  
  // This method checks the connectivity status
  Future<NetworkStatus> checkConnectivity() async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    

    if(result == ConnectivityResult.wifi){
       return NetworkStatus.Wifi;
    }

    if(result == ConnectivityResult.mobile){
       return NetworkStatus.Mobile;
    }

    if(result == ConnectivityResult.none){
       return NetworkStatus.None;
    }


  }
}
