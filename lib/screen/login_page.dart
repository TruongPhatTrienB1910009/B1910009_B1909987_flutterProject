// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orderfood/screen/welcome_page.dart';
import 'package:orderfood/screen/widget/my_text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loadding = false;
  RegExp regExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  final email = TextEditingController();
  final password = TextEditingController();
  late UserCredential userCredential;
  Future loginAuth() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      print(email.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No user found for that email.'),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Wrong password provided for that user.'),
          ),
        );
        // setState(() {
        //   loadding = false;
        // });
      }
      // setState(() {
      //   loadding = false;
      // });
    }
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void validation() {
    if (email.text.trim().isEmpty ||
        email.text.trim() == null && password.text.trim().isEmpty ||
        password.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("All Field is Empty"),
        ),
      );
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Email is Empty"),
        ),
      );
      return;
    } else if (!regExp.hasMatch(email.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Please enter vaild Email",
          ),
        ),
      );
      return;
    }
    if (password.text.trim().isEmpty || password.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Password is Empty"),
        ),
      );
      return;
    } else {
      setState(() {
        loadding = true;
      });
      loginAuth();
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WelcomePage()));
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 170),
              child: const Text(
                "Log In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                MyTextField(
                  controller: email,
                  obscureText: false,
                  hintText: "Email",
                ),

                // TextFormField(
                //   controller: email,
                //   obscureText: false,
                //   style: TextStyle(color: Colors.white),
                //   decoration: InputDecoration(
                //     hintText: "Email",
                //     hintStyle: TextStyle(color: Colors.white),
                //     enabledBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(
                //         color: Colors.grey,
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: password,
                  obscureText: true,
                  hintText: "Password",
                ),

                // TextFormField(
                //   controller: password,
                //   obscureText: true,
                //   style: TextStyle(color: Colors.white),
                //   decoration: InputDecoration(
                //     hintText: "Password",
                //     hintStyle: TextStyle(color: Colors.white),
                //     enabledBorder: UnderlineInputBorder(
                //       borderSide: BorderSide(
                //         color: Colors.grey,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
            // loadding
            // ? CircularProgressIndicator()
            Container(
              height: 60,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: validation,
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "New user?",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "Register now.",
                  style: TextStyle(color: Colors.red),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
