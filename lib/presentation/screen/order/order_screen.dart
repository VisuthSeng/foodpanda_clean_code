import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 150,
            floating: true,
            pinned: true,
            snap: true,
            centerTitle: true,
            title: Text("AppBar"),
            flexibleSpace: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: Image(
                image: AssetImage("assets/promotion1.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.white,
                ),
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.white,
                ),
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.red,
                ),
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.white,
                ),
                Container(
                  width: 200,
                  height: 100,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
