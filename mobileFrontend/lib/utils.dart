import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const baseUrl = "http://localhost:3001/api/";

Future<http.Response> sendToApiGet(url) {
  return http
      .get(Uri.parse(baseUrl + url), headers: {"Accept": "application/json"});
}

Future<http.Response> sendToApiPost(url, params) async{
  return await http.post(Uri.parse(baseUrl + url),
      headers: {"Accept": "application/json"}, body: params);
}

void switchPage(BuildContext context, Function() f) {
  Navigator.push(context, MaterialPageRoute(builder: (c) => f()));
}
