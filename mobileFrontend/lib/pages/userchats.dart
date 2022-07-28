import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:lost/utils.dart';
import './conversation.dart';

class UserChats extends StatefulWidget {
  const UserChats({Key? key}) : super(key: key);

  @override
  State<UserChats> createState() => _UserChatsState();
}

class _UserChatsState extends State<UserChats> {
  List<UserTile> tiles = [];
  Map<String, dynamic> userData = Jwt.parseJwt(ls.getItem('token'));
  bool hasLoaded = false;

  int index = 0;
  int targetLength = 0;
  @override
  Widget build(BuildContext context) {

    if (!hasLoaded) {
      db.child('chats').get().then((snapshot) async {
        dynamic chats = (snapshot.value ?? {});

        targetLength = chats.length;
        chats.forEach((chatId, chat) {
          bool isOwner = chatId.contains(userData['_id']);

          if (isOwner) {
            int notMyIdIndex = (chat['between'].indexOf(userData['_id']) + 1) % 2;
            String notMyId = chat['between'][notMyIdIndex];
            sendToApiPost('users/get', {'id': notMyId}).then((response) {
              dynamic user = jsonDecode(response.body);

              tiles.add(UserTile(username: user['name'].toString(), userid: notMyId));
              index++;
              setState(() =>{hasLoaded = true});
            });
          } else {
            index++;
          }

        });
      }).catchError(print);
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
      body: targetLength == index ? ListView(children: [Column(children: tiles)]): Center(child: SizedBox(child: CircularProgressIndicator(color: Colors.black),width: 100,height: 100)),
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
