import 'package:flutter/material.dart';
import './widgets/lost_button.dart';

bool isLogin = false;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      // home: isLogin ? Home(logindata) : Login(),
      home: const Welcome(),
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome', style: TextStyle(fontSize: width / 8)),
          CircleAvatar(
            backgroundImage: const AssetImage('assets/logo.png'),
            radius: width / 2.5,
            backgroundColor: Colors.transparent,
          ),
          LostButton(text: 'Log In', onPressed: () => {}),

          const SizedBox(height: 15),
          LostButton(text: 'Sign Up', onPressed: () => {}),
        ],
      )),
    );
  }
}
