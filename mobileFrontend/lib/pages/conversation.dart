import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lost/main.dart';
import 'package:lost/utils.dart';

class Messasge {
  final String user;
  final String content;

  const Messasge({Key? key, required this.content, required this.user});

  toJson() {}
}

class Conversation extends StatefulWidget {
  final String thisId;
  final String thatId;
  String thatUser = '';
  List<Messasge> messages = [];

// FirebaseDatabase.instance.ref('messages').onChildAdded.listen((event) {});

  Conversation(
      {Key? key, required String this.thisId, required String this.thatId});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
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
                              child: TextFormField(onFieldSubmitted: (i) {},
                              decoration: InputDecoration(
                                hintText: '    message',

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
                                    onPressed: () {}, icon: Icon(Icons.send))),
                          )
                        ],
                      ))))
        ],
      ),
    );
  }
}
