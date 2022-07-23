import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lost/pages/signup.dart';
import '../utils.dart';
import '../widgets/input.dart';
import '../widgets/lost_button.dart';

class LostFound extends StatelessWidget {
  const LostFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          title: Row(
            children:  [
              Icon(Icons.menu,color: Color(0xddefd16f),
              size: 40,),
          SizedBox(width: 15,),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Column(

                children: [
                  SizedBox(height: 15,),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),


                        prefixIcon: Icon(Icons.search),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 0)),
                          filled: true,
                          fillColor: Colors.white70,
                          labelText: '',
                          hintText: 'Search'),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ))

            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [],
        ),
      ),
    );
  }
}
