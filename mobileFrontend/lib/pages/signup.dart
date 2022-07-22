import 'package:flutter/material.dart';
import '../widgets/input.dart';
class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

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
      body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 1.35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
              ],
            ),
          )),
    );
  }
}
