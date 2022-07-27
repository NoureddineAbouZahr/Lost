import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:jwt_decode/jwt_decode.dart';

final ls = LocalStorage('lost.json');

const baseUrl = "http://192.168.0.127:3001/api/";

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


class RestartWidget extends StatefulWidget {
  RestartWidget({required this.child});

  final Widget child;

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_RestartWidgetState>()?.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}