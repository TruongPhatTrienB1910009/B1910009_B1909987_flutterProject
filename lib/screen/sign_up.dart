// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orderfood/main.dart';
import 'package:orderfood/screen/welcome_page.dart';
import 'package:orderfood/screen/widget/my_text_field.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  RegExp regExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late UserCredential userCredential;
  bool loading = false;

  Future sendData() async {
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(userCredential.user?.uid)
          .set({
        "firstName": firstName.text.trim(),
        "lastName": lastName.text.trim(),
        "email": email.text.trim(),
        "userid": userCredential.user?.uid,
        "password": password.text.trim(),
      });
      print("hi");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("The password provided is too weak."),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("The account already exists for that email"),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          (e.toString()),
        ),
      ));
      setState(() {
        loading = false;
      });
    }
    setState(() {
      loading = false;
    });
  }

  void validation() {
    if (firstName.text.trim().isEmpty || firstName.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "firstName is Empty",
          ),
        ),
      );
      return;
    }

    if (lastName.text.trim().isEmpty || lastName.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "lastName is Empty",
          ),
        ),
      );
      return;
    }
    if (email.text.trim().isEmpty || email.text.trim() == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Email is Empty",
          ),
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
          content: Text(
            "Password is Empty",
          ),
        ),
      );
      return;
    } else {
      setState(() {
        loading = true;
      });
      sendData();
    }
  }

  Widget button({
    required String buttonName,
    required Color color,
    required Color textColor,
    required void Function()? ontap,
  }) {
    return Container(
      width: 120,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        // ignore: sort_child_properties_last
        child: Text(
          buttonName,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
          ),
        ),
        onPressed: ontap,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Container(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextField(
                      controller: firstName,
                      obscureText: false,
                      hintText: "firstName",
                    ),
                    MyTextField(
                      controller: lastName,
                      obscureText: false,
                      hintText: "lastName",
                    ),
                    MyTextField(
                      controller: email,
                      obscureText: false,
                      hintText: "Email",
                    ),
                    MyTextField(
                      controller: password,
                      obscureText: true,
                      hintText: "Password",
                    ),
                  ],
                ),
              ),
              loading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // buttonCancel(),
                        button(
                          buttonName: "Cancel",
                          color: Colors.grey,
                          textColor: Colors.black,
                          ontap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WelcomePage()));
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        button(
                          buttonName: "Register",
                          color: Colors.red,
                          textColor: Colors.white,
                          ontap: () {
                            validation();
                          },
                        ),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
