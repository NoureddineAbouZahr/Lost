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
            int notMyIdIndex =
                (chat['between'].indexOf(userData['_id']) + 1) % 2;
            String notMyId = chat['between'][notMyIdIndex];
            String lmc = '';
            try {
              dynamic lastMessage = chat['messages'][chat['lastIndex']];
              lmc = lastMessage['content'];
            } catch (e) {}

            sendToApiPost('users/get', {'id': notMyId}).then((response) {
              dynamic user = jsonDecode(response.body);

              tiles.add(UserTile(
                  username: user['name'].toString(),
                  userid: notMyId,
                  lastMessage: lmc));
              index++;
              setState(() => {hasLoaded = true});
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
      body: targetLength == index
          ? ListView(children: [Column(children: tiles)])
          : Center(
              child: SizedBox(
                  child: CircularProgressIndicator(color: Colors.black),
                  width: 100,
                  height: 100)),
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

  final String lastMessage;

  UserTile(
      {Key? key,
      required this.username,
      required this.userid,
      required this.lastMessage})
      : super(key: key);

  Map<String, dynamic> userData = Jwt.parseJwt(ls.getItem('token'));

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) =>
                    Conversation(thisId: userData['_id'], thatId: userid)));
      },
      title: Container(
        padding: EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Icon(
                  Icons.person_rounded,
                  color: randomColor(),
                  size: 30,
                ),
              ),
              Text(username),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 55),
            constraints: BoxConstraints(maxWidth: width * 0.5),
            child: Text(
              lastMessage,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
          ),
        ]),
      ),
    );
  }
}
