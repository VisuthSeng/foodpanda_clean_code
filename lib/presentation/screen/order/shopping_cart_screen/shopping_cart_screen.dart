import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: SizedBox(
          height: 100,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('សរុប' '（បូកទាំងពន្ធ）'),
                    Text('\$ 2.64'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pink,
                      ),
                      onPressed: () {},
                      child: const Text('ពិនិត្យការទូទាត់និងុអាសយ៉ដ្ធានឡើងវិញ'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.pink,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'កន្ត្រកទំនិញ',
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),
            Text(
              'TUBE COFFEE (Chouk Meas)',
              style: TextStyle(color: Colors.red, fontSize: 14),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 5,
              color: Colors.pink,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                width: double.infinity,
                height: 125,
                color: Colors.yellow,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 5,
              height: 5,
              color: Colors.grey[300],
            ),
            Container(
              height: 500,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
