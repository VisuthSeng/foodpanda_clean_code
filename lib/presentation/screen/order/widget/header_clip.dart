// ignore_for_file: avoid_renaming_method_parameters, must_be_immutable

import 'package:flutter/material.dart';
import 'package:foodpanda_clean_code/presentation/screen/order/widget/custom_shape.dart';

class HeaderClip extends StatelessWidget {
  HeaderClip({Key? key, required this.context, required this.image})
      : super(key: key);

  final BuildContext context;
  String image;

  @override
  Widget build(BuildContext _) {
    return ClipPath(
      clipper: CustomShape(),
      child: Stack(
        children: [
          Container(
              height: 275,
              color: Colors.pink,
              child: Image(
                image: AssetImage(image),
                width: double.infinity,
                fit: BoxFit.fitWidth,
              )),
          Container(
            height: 275,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top + kToolbarHeight,
            ),
          )
        ],
      ),
    );
  }
}
