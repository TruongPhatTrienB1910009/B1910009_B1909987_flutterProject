// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:orderfood/provider/my_provider.dart';
import 'package:orderfood/screen/home_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 65,
        decoration: BoxDecoration(
          color: Color(0xff3a3e3e),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$23",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            Text(
              "check out",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Container(
                width: 170,
                height: 170,
                child: CircleAvatar(
                  backgroundImage: AssetImage("images/1.png"),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Stack(
                children: [
                  Container(
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Burger",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Burger king is very good",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "\$12",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.remove_circle_outline,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            Text(
                              "1",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.add_circle_outline,
                                color: Colors.white,
                                size: 30,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: null,
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  )
                ],
              ))
            ],
          )
        ],
      ),
    );
  }
}
