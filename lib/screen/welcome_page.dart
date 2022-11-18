// ignore_for_file: use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:orderfood/screen/login_page.dart';
import 'package:orderfood/screen/sign_up.dart';
// import 'package:orderfood/test/login_page1.dart';

// ignore: use_key_in_widget_constructors
class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Image.asset('images/logo.jpg'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Text(
                    "Welcome To Pizza King",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text("Order food form our restaurant and"),
                      const Text("Make reservation in real-time")
                    ],
                  ),
                  buttonLogin(),
                  buttonSingup()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class buttonLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
        },
        // ignore: prefer_const_constructors
        child: Text(
          'Log In',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class buttonSingup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Signup()));
        },
        // ignore: prefer_const_constructors
        child: Text(
          'Sign Up',
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
  }
}
