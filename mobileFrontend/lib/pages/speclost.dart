import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lost/services/globals.dart';
import 'package:lost/utils.dart';
import 'package:latlong2/latlong.dart';
import 'package:lost/widgets/lost_button.dart';

import 'itemData.dart';

class SpecLost extends StatefulWidget {
  const SpecLost({Key? key}) : super(key: key);

  @override
  State<SpecLost> createState() => _SpecLostState();
}

class _SpecLostState extends State<SpecLost> {
  String base64Image = "";
  LatLng point = LatLng(33.1, 37.1);

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
                locationx: item['locationx'],
                user: item['user'],
                self: false));
          });
        });
      });
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          title: Row(
            children: [
              SizedBox(
                  child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    height: 50,
                    child: const TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 0)),
                          filled: true,
                          fillColor: Colors.white70,
                          labelText: '',
                          hintText: 'Search'),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              )),
            ],
          ),
        ),
      ),
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            (posts.isEmpty
                ? Center(
                    child: SizedBox(
                        child: CircularProgressIndicator(color: Colors.black),
                        width: 100,
                        height: 100))
                : Column(children: posts)),
          ],
        ),
      ]),
    );
  }

  getItem(Function(dynamic) cb) {
    sendToApiGet('items/getItems').then((value) {
      final items = jsonDecode(value.body);
      var filteredItems = [];
      items.forEach((item) {
        if (item['subid'].isNotEmpty &&
            item['subid'][0]?['_id'].toString() == lastSubCategoryId) {
          filteredItems.add(item);
        }
      });
      cb(filteredItems);
    }).catchError(print);
  }
}

class Post extends StatefulWidget {
  final String img64;
  final String name;
  final String extra;
  final String serialNumber;
  final String model;
  final String color;
  final String brand;
  final double locationx;
  final double locationy;
  final bool self;

  final String user;

  const Post(
      {Key? key,
      required this.img64,
      required this.user,
      required this.name,
      required this.serialNumber,
      required this.model,
      required this.color,
      required this.brand,
      required this.extra,
      required this.locationx,
      required this.locationy,
      required this.self})
      : super(key: key);

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  double spreadRadius = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        setState(() => spreadRadius = 2);
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => LItem(post: widget)));
      },
      child: SizedBox(
          width: width * 0.9,
          height: width * 0.45,
          child: AnimatedContainer(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(5),
              // , spreadRadius: 3
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      blurRadius: 4,
                      spreadRadius: spreadRadius)
                ],
                color: Colors.white,
                //    border: Border.all(color: Color(0xffefd16f), width: 3)
              ),
              duration: const Duration(milliseconds: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.4,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.memory(base64Decode(widget.img64))
                                  .image)),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: width * 0.4,
                        child: Flexible(
                            child: Text(widget.extra,
                                style: TextStyle(overflow: TextOverflow.clip))),
                      )
                    ],
                  )
                ],
              ))),
    );
  }
}
