import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lost/services/globals.dart';
import 'package:lost/utils.dart';
import 'package:latlong2/latlong.dart';
import 'package:lost/widgets/lost_button.dart';

class SpecLost extends StatefulWidget {
  const SpecLost({Key? key}) : super(key: key);

  @override
  State<SpecLost> createState() => _SpecLostState();
}

class _SpecLostState extends State<SpecLost> {
  TextEditingController name = new TextEditingController();
  TextEditingController SerialNumber = new TextEditingController();
  TextEditingController model = new TextEditingController();
  TextEditingController color = new TextEditingController();
  TextEditingController brand = new TextEditingController();
  TextEditingController extraInfo = new TextEditingController();
  TextEditingController locationx = new TextEditingController();
  TextEditingController locationy = new TextEditingController();
  TextEditingController status = new TextEditingController();
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
                extra: item['extraInfo']));
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
            Column(children: posts),
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

class Post extends StatelessWidget {
  final String img64;
  final String name;
  final String? extra;
  final String? serialNumber;
  final String? model;
  final String? color;
  final String? brand;

  const Post(
      {Key? key,
      required this.img64,
      required this.name,
      required this.serialNumber,
      required this.model,
      required this.color,
      required this.brand,
      required this.extra})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
        width: width * 0.9,
        height: width * 0.45,
        child: AnimatedContainer(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(5),
            // , spreadRadius: 3
            decoration: BoxDecoration(
                boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 4)],
                color: Colors.white,
                border: Border.all(color: Color(0xffefd16f), width: 3)),
            duration: const Duration(milliseconds: 500),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: width * 0.4,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.memory(base64Decode(img64)).image)),
                  ),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(extra!),
                  ],
                )
              ],
            )));
  }
}
