import 'dart:convert';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:lost/main.dart';
import 'package:lost/utils.dart';

class MessageBubble extends StatelessWidget {
  final String content;
  final bool self;

  final String id;

  const MessageBubble(
      {Key? key, required this.content, required this.self, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
        width: width,
        child: Row(
            mainAxisAlignment:
                self ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              Container(
                constraints: BoxConstraints(maxWidth: width * 0.75),
                child: Flexible(
                    child: Text(content,
                        style: TextStyle(
                            color: self ? Color(0xff333333) : MainCol))),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: self ? MainCol : Color(0xff333333),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          offset: Offset.fromDirection(pi / 2, 3))
                    ]),
                margin: !self
                    ? EdgeInsets.only(left: 10, bottom: 10)
                    : EdgeInsets.only(right: 10, bottom: 10),
              )
            ]));
  }
}

final db = FirebaseDatabase.instance.ref();
String ID() {
  return (0xffffff * Random().nextInt(1000)).round().toRadixString(16);
}

class Conversation extends StatefulWidget {
  final String thisId;
  final String thatId;
  String thatUser = '';

  void send(String content) async {
    final lastIndex = db.child('chats/$dbId/lastIndex');
    final newIndex = (((await lastIndex.get()).value ?? -1) as int) + 1;

    DateTime date = DateTime.now();
    String dates = "${date.day}/${date.month}-${date.hour}:${date.minute}";

    db
        .child('chats/$dbId/messages/$newIndex')
        .set({'owner': thisId, 'content': content, 'id': ID(), 'date': dates});
    lastIndex.set(newIndex);
  }

  Conversation({Key? key, required this.thisId, required this.thatId});

  String dbId = "";
  void updateDBId(Function(dynamic, bool) cb) {
    final ids = [thisId, thatId];
    ids.sort();

    dbId = ids[0] + ',' + ids[1];

    db.child('chats/' + dbId).update({'between': ids});

    String lastMID = '';
    db.child('chats/$dbId/messages/').onChildAdded.listen((event) {
      if (event.type != DatabaseEventType.childAdded) return;
      dynamic msg = event.snapshot.value;
      if (lastMID.toString() == msg['id'].toString()) return;
      cb(msg, thisId.toString() == msg['owner'].toString());

      lastMID = msg['id'];
    });
  }

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  TextEditingController content = TextEditingController();

  List<MessageBubble> messages = [];
  @override
  Widget build(BuildContext context) {
    if (widget.thatUser == '') {
      sendToApiPost('users/get', {'id': widget.thatId.toString()})
          .then((value) {
        widget.thatUser = jsonDecode(value.body)['name'].toString();
        widget.updateDBId((msg, self) {
          if (messages
              .where((element) => element.id == msg['id'].toString()).isEmpty) {
            messages.add(MessageBubble(
              content: msg['content'],
              self: self,
              id: msg['id'],
            ));
            setState(() {});
          }
        });

        Map<String, dynamic> userData = Jwt.parseJwt(ls.getItem('token'));
        db.child('chats/${widget.dbId}/messages').get().then((snapshot) {
          dynamic messagesl = (snapshot.value ?? []);
          String lastMID = '';
          messagesl.forEach((msg) {
            if (lastMID == msg['id']) return;
            lastMID = msg['id'];

            try {
              messages.add(MessageBubble(
                  content: msg['content'],
                  self: userData['_id'] == msg['owner'],
                  id: msg['id']));
            } catch (e) {}
          });

          setState(() {});
        });
      }).catchError((error) {
        setState(() {});
        print('error');
      });
      return const Scaffold(
        body: Center(
          child: SizedBox(
            child: CircularProgressIndicator(color: Colors.black),
            width: 100,
            height: 100,
          ),
        ),
      );
    }

    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text(widget.thatUser.toUpperCase()),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(reverse: true, children: [
            Column(mainAxisAlignment: MainAxisAlignment.end, children: messages)
          ])),
          SizedBox(
            height: 15,
          ),
          Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 1),
              color: Color(0xffe6e6e6),
              child: Row(
                children: [
                  const SizedBox(width: 10),
                  SizedBox(
                    width: width - 90,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12))),
                      child: TextFormField(
                        controller: content,
                        onFieldSubmitted: (i) {
                          if (content.text == '') return;
                          widget.send(content.text);
                          content.clear();
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          hintText: 'message',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 50,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: MainCol),
                        child: IconButton(
                            onPressed: () {
                              if (content.text == '') return;
                              widget.send(content.text);
                              content.clear();
                              setState(() {});
                            },
                            icon: Icon(Icons.send))),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
