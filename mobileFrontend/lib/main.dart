import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lost/splash.dart';

FirebaseApp? fbApp;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  fbApp = await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: MainCol,
      ),
      debugShowCheckedModeBanner: false,
      // home: isLogin ? Home(logindata) : Login(),
      home: Splash(),
    );
  }
}

MaterialColor MainCol = MaterialColor(0xffefd16f, <int, Color>{
  50: Color(0xffd3b966),
  100: Color(0xffd2b762),
  200: Color(0xffeccd67),
  300: Color(0xffefd16f),
  400: Color(0xfff1d168),
  500: Color(0xfffadd80),
  600: Color(0xffefd47c),
  700: Color(0xffefd16f),
  800: Color(0xfff1d477),
  900: Color(0xffefd16f),
});

