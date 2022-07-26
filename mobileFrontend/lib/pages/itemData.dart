import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lost/pages/speclost.dart';

class LItem extends StatelessWidget {
  final Post post;

  const LItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: Column(
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
                            image:
                                Image.memory(base64Decode(post.img64)).image)),
                  )),
              Container(
                child: Center(
                  child: Text(
                    post.name,
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
                      Text(post.brand == "" ? 'N/A' : post.brand,
                          style: const TextStyle(fontSize: 16)),
                      Divider(),
                      Text(post.color == "" ? 'N/A' : post.color,
                          style: const TextStyle(fontSize: 16)),
                      Divider(),
                      Text(post.model == "" ? 'N/A' : post.model,
                          style: const TextStyle(fontSize: 16)),
                      Divider(),
                      Text(post.serialNumber == "" ? 'N/A' : post.serialNumber,
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
            ],
          ),
        ));
  }
}
