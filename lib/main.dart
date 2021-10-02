import 'package:bbdr_hotel/home_start.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final Future<FirebaseApp> initialization = Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      title: 'BABDRA-Hotêls',
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        fontFamily: "Lato",
        backgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeStart(
        pages: 0,
      ),
    );
  }
}
