import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lost/pages/signup.dart';
import '../utils.dart';
import '../widgets/input.dart';
import '../widgets/lost_button.dart';

class LostFound extends StatelessWidget {
  const LostFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          centerTitle: true,
          title: Row(
            children: const [

            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

          ],
        ),
      ),
    );
  }
}


