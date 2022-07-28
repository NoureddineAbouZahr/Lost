import 'dart:convert';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lost/main.dart';
import 'package:lost/utils.dart';

class MessageBubble extends StatelessWidget {
  final String content;
  final bool self;

  const MessageBubble({Key? key, required this.content, required this.self}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(width: width, child: Row(

            mainAxisAlignment: self ?MainAxisAlignment.end : MainAxisAlignment.start,
            children:[ Container(child: Text(content),padding: EdgeInsets.all(12),decoration: BoxDecoration(
                color: MainCol,borderRadius: BorderRadius.circular(10)
            ),margin: !self ? EdgeInsets.only(left: 10 ,bottom: 10):EdgeInsets.only(right: 10, bottom: 10),)]
    ));
  }
}

final db = FirebaseDatabase.instance.ref();
class Conversation extends StatefulWidget {
  final String thisId;
  final String thatId;
  String thatUser = '';

  void send(String content) async {
    final lastIndex = db.child('chats/$dbId/lastIndex');
    final newIndex = (((await lastIndex.get()).value ?? -1) as int) + 1;

    db.child('chats/$dbId/messages/$newIndex').set({
      'owner': thisId,
      'content': content
    });
    lastIndex.set(newIndex);

  }


  Conversation({Key? key, required this.thisId, required this.thatId});

  String dbId = "";
  void updateDBId(){
    final ids = [thisId, thatId];
    ids.sort();

    dbId = ids[0]+','+ids[1];

    db.child('chats/'+dbId).update({
      'between': ids
    });

  }

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
        widget.updateDBId();
        setState(() {});
      }).catchError(print);

      return const Scaffold(
        body: Center(
          child: SizedBox(child: CircularProgressIndicator(color: Colors.black),width: 100,height: 100,),
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
          Expanded(child: ListView(reverse: true,children: [Column(
              mainAxisAlignment: MainAxisAlignment.end,

              children: const [
                MessageBubble(content: 'hi', self: false),
                MessageBubble(content: 'Hello', self: true),
                MessageBubble(content: 'Ahlan', self: false),
                MessageBubble(content: 'Ahlan', self: true),
                MessageBubble(content: 'Ahlan', self: false),

              ])])),
          SizedBox(height: 15,),
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
              ))
        ],
      ),
    );
  }
}
