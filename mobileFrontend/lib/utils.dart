import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

final ls = LocalStorage('lost.json');

const baseUrl = "http://localhost:3001/api/";

Future<http.Response> sendToApiGet(url) {
  return http.get(Uri.parse(baseUrl + url),
      headers: {"Content-Type": "application/json"});
}

Future<http.Response> sendToApiPost(url, params) {
  return http.post(Uri.parse(baseUrl + url),
      headers: {"Content-Type": "application/json"}, body: jsonEncode(params));
}

void switchPage(BuildContext context, Function() f) {
  Navigator.push(context, MaterialPageRoute(builder: (c) => f()));
}
