// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:foodpanda_clean_code/presentation/screen/home/item/searchbox.dart';
import 'package:foodpanda_clean_code/presentation/screen/restaurant/restaurant_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
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
            onPressed: () {},
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
                        // Get.snackbar("You have selected order food",
                        //     "Thanks you for using us app",
                        //     snackPosition: SnackPosition.BOTTOM);
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
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
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
                        height: 200,
                        child: Row(
                          children: [
                            Padding(
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
                                height: 170,
                                width: 150,
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
                            Padding(
                              padding: const EdgeInsets.all(14),
                              child: Container(
                                height: 170,
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
                                      height: 100,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3),
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
