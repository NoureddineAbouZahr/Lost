import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:lost/pages/signup.dart';
import '../widgets/navbar.dart';
import '../utils.dart';
import '../widgets/input.dart';
import '../widgets/lost_button.dart';
import 'categories.dart';

class LostFound extends StatelessWidget {
  const LostFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userData = Jwt.parseJwt(ls.getItem('token'));

    double width = MediaQuery.of(context).size.width;
    String name =  userData['name'][0].toUpperCase() + userData['name'].substring(1);
    return Scaffold(
      drawer: Nav(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  // color: Color(0xffefd16f),
                  size: 30,
                )),
          ),
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

          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Welcome, $name!", style: TextStyle(fontSize: 30.0)))),
            Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.05),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('How can we help you today?', style: TextStyle(fontSize: 20.0)))),
            const SizedBox(height: 20),

            Image(
              image: const AssetImage('assets/box.png'),
              width: width * 0.9,
            ),
            const SizedBox(
              height: 70,
            ),
            LostButton(text: 'Found Object', onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (c)=>Cats(0)))}),
            const SizedBox(
              height: 20,
            ),
            LostButton(text: 'Lost Object', secondary:true,onPressed: () => {Navigator.push(context, MaterialPageRoute(builder: (c)=>Cats(1)))}),

            // AlertDialog(
            //   title: Text('Success'),
            //   content: SingleChildScrollView(
            //     child: ListBody(
            //       children: [
            //         Text('Item Posted')
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
