// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orderfood/screen/home_page.dart';
import 'package:orderfood/screen/login_page.dart';
import 'package:orderfood/screen/sign_up.dart';
import 'package:orderfood/screen/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff2b2b2b),
          appBarTheme: AppBarTheme(
            color: Color(0xff2b2b2b),
          )),
      // home: LoginPage(),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (index, sncpshot) {
          if (sncpshot.hasData) {
            return HomePage();
          }
          return LoginPage();
        },
      ),
    );
  }
}
