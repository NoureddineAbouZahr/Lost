import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lost/utils.dart';
class Messasge {
  final String user;
  final String content;

  const Messasge({Key? key, required this.content, required this.user});

  toJson() {

  }
}
class Conversation extends StatefulWidget {
  final String thisId;
  final String thatId;
  String thatUser = '';
  List<Messasge> messages = [];

// FirebaseDatabase.instance.ref('messages').onChildAdded.listen((event) {});


  Conversation({Key? key, required String this.thisId, required String this.thatId});

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    if (widget.thatUser == '') {
      sendToApiPost('users/get', {'id': widget.thatId.toString()}).then((value) {
        widget.thatUser = jsonDecode(value.body)['name'].toString();
        setState((){});
      }).catchError(print);
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          title: Text(widget.thatUser.toUpperCase()),
        ),
      ),
      body: Column(),
    );
  }
}
