abstract class NetworkBaseAPI {
  Future<String> makePostRequest(String endPoint, dynamic postValues);
  Future<String> makeGetRequest(String endPoint);
}
