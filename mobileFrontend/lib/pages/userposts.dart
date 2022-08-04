import 'package:flutter/material.dart';
//http://192.168.0.127:3001/api/items/userItems
import 'dart:convert';
import 'dart:ui';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:lost/pages/speclost.dart';
import 'package:lost/utils.dart';

class MyPosts extends StatefulWidget {
  const MyPosts({Key? key}) : super(key: key);

  @override
  State<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
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
                locationx: item['locationx'],
                user: item['user'],
                self: true));
          });
        });
      });
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
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
            const SizedBox(height: 30),
            (posts.isEmpty
                ? const Center(
                    child: SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(color: Colors.black)))
                : Column(children: posts)),
          ],
        ),
      ]),
    );
  }
}

Map<String, dynamic> userData = Jwt.parseJwt(ls.getItem('token'));

getItem(Function(dynamic) cb) {
  sendToApiGet('items/getItems').then((value) {
    final items = jsonDecode(value.body);
    var filteredItems = [];
    items.forEach((item) {
      if (item['user'].toString() == userData['_id']) {
        print(item);
        filteredItems.add(item);
      }
    });
    cb(filteredItems);
  }).catchError(print);
}
