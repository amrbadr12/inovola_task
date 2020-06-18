import 'package:http/http.dart';

import 'network_base.dart';

class NetworkHelper extends NetworkBaseAPI {
  static NetworkHelper _instance;

  static NetworkHelper getInstance() {
    if (_instance == null) _instance = NetworkHelper._();
    return _instance;
  }

  NetworkHelper._();

  @override
  Future<String> makeGetRequest(String endPoint) async {
    // set up Get request arguments
    Response response;
    String body = "";
    try {
      response = await get(endPoint);
      int statusCode = response
          .statusCode; // this API passes back the id of the new item added to the body
      if (statusCode == 200) {
        body = response.body;
      }
    } // request
    catch (e) {}
    // check the status code for the result
    return body;
  }

  @override
  Future<String> makePostRequest(String endPoint, postValues) async {
    // set up POST request arguments
    // make POST
    Response response;
    String body = "";
    try {
      response = await post(endPoint,
          body: postValues,
          headers: {'Content-type': 'application/x-www-form-urlencoded'});
      int statusCode = response
          .statusCode; // this API passes back the id of the new item added to the body
      if (statusCode == 200) {
        body = response.body;
      }
    } // request
    catch (e) {}
    // check the status code for the result
    return body;
  }
}
