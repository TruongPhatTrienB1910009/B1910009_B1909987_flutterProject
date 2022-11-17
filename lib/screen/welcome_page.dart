import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class WelcomePage extends StatelessWidget {
  Widget button({required String name, Color? color, Color? textColor}) {
    return Container(
      height: 45,
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {},
        child: Text(
          name,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }

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
                  button(
                      name: 'Login',
                      color: Colors.green,
                      textColor: Colors.white),
                  button(
                      name: 'SignUp',
                      color: Colors.white,
                      textColor: Colors.green),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
