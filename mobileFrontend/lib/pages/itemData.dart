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
      body:
      Center(
        
        child:
      Column(

        children: [
          SizedBox(
              width: width*0.95,
              height: 300,
              child:

          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.memory(base64Decode(post.img64)).image)),
          ))
        ],
      ),
    ));
  }
}
