// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class searchbox extends StatelessWidget {
  const searchbox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      height: 70,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: const TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
