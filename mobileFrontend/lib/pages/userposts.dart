import 'package:flutter/material.dart';
//http://192.168.0.127:3001/api/items/userItems
import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:lost/pages/speclost.dart';
import 'package:lost/services/globals.dart';
import 'package:lost/utils.dart';
import 'package:latlong2/latlong.dart';
import 'package:lost/widgets/lost_button.dart';

import 'itemData.dart';

class MyPosts extends StatefulWidget {
  const MyPosts({Key? key}) : super(key: key);

  @override
  State<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  String base64Image = "";
  LatLng point = LatLng(33, 37);

  File? image;

  List<Post> posts = [];
  bool addedPosts = false;
  @override
  Widget build(BuildContext context) {
    print(posts);
    if (!addedPosts) {
      getItem((items) {
        addedPosts = true;
        setState(() {
          items.forEach((item) {
            posts.add(Post(
                img64: item['pic'],
                name: item['name'],
                serialNumber: item['SerialNumber'],
                model: item['model'],
                color: item['color'],
                brand: item['brand'],
                extra: item['extraInfo'],
                locationy: item['locationy'],
                locationx: item['locationx']));
          });
        });
      });
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          title: Column(
            children: const [
              SizedBox(height: 5),
              CircleAvatar(
                backgroundImage: AssetImage('assets/logo.png'),
                radius: 40,
                backgroundColor: Colors.transparent,
              )
            ],
          ),
        ),
      ),
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Column(children: posts),
          ],
        ),
      ]),
    );
  }

  Map<String, dynamic> userData = Jwt.parseJwt(ls.getItem('token'));

  getItem(Function(dynamic) cb) {
    sendToApiPost('items/userItems', {'user': userData['_id']}).then((value) {
      final items = jsonDecode(value.body);
      cb(items);
    }).catchError(print);
  }
}
