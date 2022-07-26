import 'package:flutter/material.dart';
import 'package:lost/pages/speclost.dart';

    class LItem extends StatelessWidget {
  final Post post;

      const LItem({Key? key,required this.post}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              centerTitle: true,
              title: Column(
                children: const [
                  SizedBox(height: 5),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/logo.png'),
                    radius: 40,
                    backgroundColor: Colors.transparent,
                  )
                ],
              ),
            ),
          ),
        );
      }
    }
