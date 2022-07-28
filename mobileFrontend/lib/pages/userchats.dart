import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import './conversation.dart';

class UserChats extends StatefulWidget {
  const UserChats({Key? key}) : super(key: key);

  @override
  State<UserChats> createState() => _UserChatsState();
}

class _UserChatsState extends State<UserChats> {
  List<UserTile> tiles = [ UserTile(username: 'asd', userid: 'asd') ];

  @override
  Widget build(BuildContext context) {

    db.child('chats')..get().then((snapshot) {
      dynamic chats = (snapshot.value ?? {});
      chats.forEach((key, value) {
        print(key);
      });

    }).catchError(print);

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
      body: ListView(children: tiles),
    );
  }
}

Color randomColor() {
  return Color.fromARGB(
      255,
      (Random().nextInt(100) * 100).round(),
      (Random().nextInt(100) * 100).round(),
      (Random().nextInt(100) * 100).round());
}

class UserTile extends StatelessWidget {
  final String userid;
  final String username;

  const UserTile({Key? key, required this.username, required this.userid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
      },
      title: Container(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Icon(Icons.person_rounded, color: randomColor(), size: 30,),
            ),
            Text(username),
          ],
        ),
      ),
    );
  }
}
