import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import '../utils.dart';

class Nav extends StatefulWidget {
  Nav({Key? key}) : super(key: key);
  Map<String, dynamic> userData = Jwt.parseJwt(ls.getItem('token'));
  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  @override
  Widget build(BuildContext context) {


    return Drawer(
      child: ListView(children: [
        Container(
          decoration: const BoxDecoration(
              color: Color(0xffefd16f), boxShadow: [BoxShadow(blurRadius: 4)]),
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(widget.userData['name'][0].toUpperCase()+widget.userData['name'].substring(1), style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
              Text(widget.userData['email'])
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.my_library_books_rounded),
          title: const Text('Posts'),

          onTap: () => {
          //   if (index == 0) {
          //      this.selected = true
          //   }
          //   index = 0;
          //   }

          },
        ),
        ListTile(
          leading: const Icon(Icons.chat),
          title: const Text('Chats'),
          onTap: () => null,
        ),
      ]),
    );
  }
}
