import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lost/splash.dart';

Future<FirebaseApp>? _fbApp;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //_fbApp = (await Firebase.initializeApp()) as Future<FirebaseApp>?;
  runApp(MyApp());
}

// FirebaseDatabase.instance.ref('messages').onChildAdded.listen((event) {});

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

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
      home: Splash(),
    );
  }
}


