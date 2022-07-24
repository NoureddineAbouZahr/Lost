import 'package:flutter/material.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [

        Container(
          decoration:   BoxDecoration(
            color: Color(0xffefd16f),
            boxShadow: [BoxShadow(blurRadius: 4)]
          ),
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Nour', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('nour@gmail.com')
            ],
          ),
        ),



        ListTile(
          leading: Icon(Icons.my_library_books_rounded),
          title: Text('Posts'),
          onTap: () => null,
        ),
        ListTile(
          leading: Icon(Icons.chat),
          title: Text('Chats'),
          onTap: () => null,
        ),
      ]
      ),
    );
  }
}
