import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:lost/pages/speclost.dart';

class LItem extends StatefulWidget {
  final Post post;

   LItem({Key? key, required this.post}) : super(key: key);

  @override
  State<LItem> createState() => _LItemState();
}

class _LItemState extends State<LItem> {
  String location = '';

  Future<void> setuplocation() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(widget.post.locationy, widget.post.locationx);
    location = placemarks.first.country! + ' , '+ placemarks.first.locality! + ' , Street: '+ placemarks.first.street!;
  }

  @override
  Widget build(BuildContext context) {
    if (location.isEmpty) {
      setuplocation().then((v) {
        setState(() { });
      });
    }
    double width = MediaQuery.of(context).size.width;

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
      body: Center(
        child: ListView(
          children: [
            SizedBox(
                width: width,
                height: 300,
                child: Container(
                  margin: EdgeInsets.only(top: 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      border: Border.all(color: Color(0xffefd16f), width: 3),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.memory(base64Decode(widget.post.img64)).image)),
                )),
            Container(
              child: Center(
                child: Text(
                  widget.post.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Brand:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Divider(),
                    Text('Color:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Divider(),
                    Text('Model/Type:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Divider(),
                    Text('S/N:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16))
                  ],
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 50)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(widget.post.brand == "" ? 'N/A' : widget.post.brand,
                        style: const TextStyle(fontSize: 16)),
                    Divider(),
                    Text(widget.post.color == "" ? 'N/A' : widget.post.color,
                        style: const TextStyle(fontSize: 16)),
                    Divider(),
                    Text(widget.post.model == "" ? 'N/A' : widget.post.model,
                        style: const TextStyle(fontSize: 16)),
                    Divider(),
                    Text(widget.post.serialNumber == "" ? 'N/A' : widget.post.serialNumber,
                        style: const TextStyle(fontSize: 16)),
                  ],
                ),
              ],
            ),
            SizedBox(
                width: width * 0.9,
                child: const Divider(
                  thickness: 3,
                  height: 50,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(width: width * 0.9,child: Flexible(
                      child: Text(widget.post.extra,
                          style: const TextStyle(
                              fontSize: 16, overflow: TextOverflow.clip))),),

                  SizedBox(
                      width: width * 0.9,
                      child: const Divider(
                        thickness: 3,
                        height: 50,
                      )),
                  Text('Location:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),

                  ),
                  Text(location)

                ])
              ],
            )
          ],
        ),
      ),

    );
  }
}
