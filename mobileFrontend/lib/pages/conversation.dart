import 'package:flutter/material.dart';
class Messasge {
  final String user;
  final String content;

  const Messasge({Key? key, required this.content, required this.user}) : super(key: key);

  toJson() {

  }
}
class Conversation extends StatefulWidget {
  final String thisId;
  final String thatId;
  List<Messasge> messages = [];


  Conversation({Key? key, required String this.thisId, required String this.thatId}) {
    

  }

  @override
  State<Conversation> createState() => _ConversationState();
}

class _ConversationState extends State<Conversation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          title: Text(),
        ),
      ),
    );
  }
}
