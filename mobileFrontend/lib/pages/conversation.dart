import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lost/main.dart';
import 'package:lost/utils.dart';

// class Messasge {
//   final String owner;
//   final String content;
//
//   const Messasge({Key? key, required this.content, required this.owner});
//
//   toJson() {}
// }

DatabaseReference lostdb = FirebaseDatabase.instance.ref();
String ID() {
  return (0xffffff * Random().nextInt(1000)).round().toRadixString(16);
}
class Conversation extends StatefulWidget {
  final String thisId;
  final String thatId;
  String thatUser = '';

  static final db = FirebaseDatabase.instance.ref();
  void send(String content) {

    print(content);
    db.child('chats/'+ID()).set({
      'owner': thisId,
      'content': content
    });
    // FirebaseDatabase.instance.ref().push().child('/messages').set({
    //   "content": content,
    //   "owner": thisId
    // }).then((_) => print('Added')).catchError((error) => print('Add failed: $error'));
  }


  Conversation(
      {Key? key, required this.thisId, required this.thatId});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  TextEditingController content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.thatUser == '') {
      sendToApiPost('users/get', {'id': widget.thatId.toString()})
          .then((value) {
        widget.thatUser = jsonDecode(value.body)['name'].toString();
        setState(() {});
      }).catchError(print);
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
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
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
                                  border:
                                      Border.all(width: 1, color: Colors.white),
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(12))),
                              child: TextFormField(
                                controller: content,
                                //onFieldSubmitted: (i) {},
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: 'message',

                                ),),
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
                                      widget.send(content.text);
                                    }, icon: Icon(Icons.send))),
                          )
                        ],
                      ))))
        ],
      ),
    );
  }
}
