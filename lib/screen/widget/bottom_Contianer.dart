// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  final String image;
  final String name;
  final int price;
  final void Function()? onTap;
  BottomContainer(
      {required this.onTap,
      required this.image,
      required this.price,
      required this.name});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 270,
        width: 220,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 241, 251, 206),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(image),
            ),
            Text(
              name,
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 34, 24, 24),
              ),
            ),
            Text(
              "$price.000đ",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 34, 24, 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Color.fromARGB(255, 34, 24, 24),
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Color.fromARGB(255, 34, 24, 24),
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Color.fromARGB(255, 34, 24, 24),
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Color.fromARGB(255, 34, 24, 24),
                  ),
                  Icon(
                    Icons.star,
                    size: 20,
                    color: Color.fromARGB(255, 34, 24, 24),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
