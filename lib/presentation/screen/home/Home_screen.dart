// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:foodpanda_clean_code/presentation/screen/home/item/searchbox.dart';
import 'package:foodpanda_clean_code/presentation/screen/order/shopping_cart_screen/shopping_cart_screen.dart';
import 'package:foodpanda_clean_code/presentation/screen/restaurant/restaurant_screen.dart';
import 'package:foodpanda_clean_code/presentation/screen/shop/shop_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 200,
              color: Colors.pink[100],
            ),
            GestureDetector(
              onTap: () {
                Get.to(
                  () => const ShopScreen(),
                );
              },
              child: const ListTile(
                leading: Icon(Icons.shopping_cart_sharp),
                title: Text("Create Shop"),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Padding(
          padding: const EdgeInsets.only(right: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "កន្លែងធ្វេីការ",
                style: TextStyle(fontSize: 16),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 1),
                child: Text(
                  "12160 St 228",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => const ShoppingCartScreen());
            },
            icon: const Icon(
              Icons.favorite_border_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag_outlined,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const searchbox(),
          Container(
            height: 450,
            width: double.infinity,
            color: Colors.grey[300],
            child: Column(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const RestarauntScreen());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              const Positioned(
                                child: SizedBox(
                                  width: 300,
                                  height: 125,
                                  child: Image(
                                    image:
                                        AssetImage("assets/delivery_food.jpg"),
                                  ),
                                ),
                                right: -2,
                                bottom: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "ដឹកជញ្ជូនអាហារ",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                    const Text(
                                      "កម្មង់អាហារអ្នកចូលចិត្ត",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey.withOpacity(0.5),
                        //     spreadRadius: 5,
                        //     blurRadius: 7,
                        //     offset: const Offset(0, 3),
                        //   ),
                        // ],
                      ),
                      width: double.infinity,
                      height: 250,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    width: double.infinity,
                                    height: 400,
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 200,
                                          width: double.infinity,
                                          child: Image(
                                            image: AssetImage(
                                                'assets/starbuck.jpg'),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text('បាយសាច់ជ្រូក'),
                                              const Text('\$ 1.50'),
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.snackbar('បន្ថែមការណែនាំពិសេស',
                                                'បន្ថែមការណែនាំពិសេស');
                                          },
                                          child: SizedBox(
                                            height: 30,
                                            width: double.infinity,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 25),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.add,
                                                    color: Colors.pink,
                                                  ),
                                                  const Text(
                                                    'បន្ថែមការណែនាំពិសេស',
                                                    style: TextStyle(
                                                        color: Colors.pink),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 40),
                                          child: Row(
                                            children: [
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.grey,
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: Text(
                                                  '1',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 20),
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.pink,
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 20, right: 10),
                                                child: SizedBox(
                                                  width: 200,
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        primary: Colors.pink,
                                                      ),
                                                      onPressed: () {},
                                                      child: const Text(
                                                          'ដាក់ថែមក្នុងកន្ត្រក')),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                height: 300,
                                width: 170,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Stack(
                                    children: [
                                      const Text(
                                        "ហាង​ទំនិញ",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 30),
                                        child: Text(
                                          "គ្រឿងទេស និង ច្រេីនមុខទៀត",
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black87),
                                        ),
                                      ),
                                      const Positioned(
                                        child: SizedBox(
                                          width: 200,
                                          height: 100,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/hangtomninh.jpg"),
                                          ),
                                        ),
                                        bottom: -1,
                                        right: -20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14),
                            child: SizedBox(
                              height: 250,
                              width: 160,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    height: 125,
                                    width: double.infinity,
                                    child: Stack(
                                      children: [
                                        const Positioned(
                                          child: SizedBox(
                                            width: 150,
                                            height: 100,
                                            child: Image(
                                              image: AssetImage(
                                                  "assets/panda_mart.jpg"),
                                            ),
                                          ),
                                          bottom: -1,
                                          right: -10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "pandamart",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.black),
                                              ),
                                              const Text(
                                                "ដឹកលឿន, ចុះដល់៤០%",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Container(
                                      height: 80,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3),
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          const Positioned(
                                            child: SizedBox(
                                              width: 180,
                                              height: 80,
                                              child: Image(
                                                image: AssetImage(
                                                    "assets/take_away.jpg"),
                                              ),
                                            ),
                                            left: 20,
                                            bottom: -5,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'ទៅយកផ្ទាល់',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                            ),
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.only(
                                                top: 32, left: 10),
                                            child: Text(
                                              "បញ្ចុះ​ ដល់ ៥០%",
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black87,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
