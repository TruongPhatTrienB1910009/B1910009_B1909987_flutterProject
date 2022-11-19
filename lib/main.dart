// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:orderfood/provider/my_provider.dart';
import 'package:orderfood/screen/detail_page.dart';
import 'package:orderfood/screen/home_page.dart';
import 'package:provider/provider.dart';

import 'screen/auth/auth_manager.dart';
import 'screen/auth/auth_screen.dart';
import 'screen/auth/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthManager()),
        ChangeNotifierProvider(create: (context) => MyProvider()),
      ],
      child: Consumer<AuthManager>(
        builder: (context, authManager, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                scaffoldBackgroundColor: Color(0xff2b2b2b),
                appBarTheme: AppBarTheme(
                  color: Color(0xff2b2b2b),
                )),
            // home: DetailPage(),
            home: authManager.isAuth
                ? HomePage()
                : FutureBuilder(
                    future: authManager.tryAutoLogin(),
                    builder: (ctx, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? const SplashScreen()
                          : const AuthScreen();
                    },
                  ),
          );
        },
      ),
    );
  }
}
