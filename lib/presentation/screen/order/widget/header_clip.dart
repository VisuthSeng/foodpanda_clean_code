// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter/material.dart';
import 'package:foodpanda_clean_code/presentation/screen/order/widget/custom_shape.dart';

class HeaderClip extends StatelessWidget {
  const HeaderClip({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext _) {
    return ClipPath(
      clipper: CustomShape(),
      child: Stack(
        children: [
          Container(
              height: 275,
              color: Colors.pink,
              child: const Image(
                image: AssetImage('assets/starbuck.jpg'),
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
