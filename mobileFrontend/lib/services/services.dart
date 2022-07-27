import 'package:lost/utils.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<http.Response> login(url, params) {
    return sendToApiPost(url, params);
  }

  Future<http.Response> gets(url, params) {
    return sendToApiGet(url);
  }


}
