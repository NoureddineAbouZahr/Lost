import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:lost/pages/userposts.dart';
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
      child: Column(children: [
        Container(
          margin: EdgeInsets.only(top:35),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              color: Color(0xffefd16f), boxShadow: [BoxShadow(blurRadius: 4)]),
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  widget.userData['name'][0].toUpperCase() +
                      widget.userData['name'].substring(1),
                  style:
                      TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1)),
              Text(widget.userData['email'])
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.my_library_books_rounded),
          title: const Text('Posts'),
          onTap: () => {
            Navigator.push(
                context, MaterialPageRoute(builder: (c) => MyPosts()))
          },
        ),
        ListTile(
          leading: const Icon(Icons.chat),
          title: const Text('Chats'),
          onTap: () => null,
        ),
        Expanded(
            child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Log Out'),
                  onTap: () => null,
                )))
      ]),
    );
  }
}
