import 'dart:convert';

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
  String thisUser = '';
  String thatUser = '';
  List<Messasge> messages = [];

// FirebaseDatabase.instance.ref('messages').onChildAdded.listen((event) {});


  Conversation({Key? key, required String this.thisId, required String this.thatId}) {
    // sendToApiPost('user/get', {'id': thisId}).then((value) {
    //   thisUser = jsonDecode(value.body)['name'].toString();
    // });
    sendToApiPost('user/get', {'id': thatId}).then((value) {
      thatUser = jsonDecode(value.body)['name'].toString();
    });
  }

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    if (widget.thatUser == '' ) {
      setState((){});
      return const Text('. . .');
    }
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          title: Text(widget.thatUser),
        ),
      ),
    );
  }
}
