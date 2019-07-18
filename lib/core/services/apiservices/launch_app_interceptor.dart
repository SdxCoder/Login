import 'dart:async';
import 'package:chopper/chopper.dart';

class LaunchAppInterceptor implements ResponseInterceptor {


  /**
   * Method override
   * It uses params (response) to extract the header-value of set-Cookie
   * to further extract XSRF-TOKEN and JSESSIONID sent by server with response headers
   */
  @override
  FutureOr<Response> onResponse(Response response) {
     
    if (response.statusCode == 200) {
      Map<String, String> headers = {};
      String rawCookie = response.headers['set-cookie'];
      if (rawCookie != null) {
        int index = rawCookie.lastIndexOf(';');
        headers['cookie'] =
            (index == -1) ? rawCookie : rawCookie.substring(0, index);
      }
      print('Cookie : ${headers['cookie']}');
    }
    return response;
  }
}
