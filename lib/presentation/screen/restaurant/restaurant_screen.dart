import 'package:flutter/material.dart';
import 'package:foodpanda_clean_code/core/constant/app_foodtype.dart';
import 'package:foodpanda_clean_code/core/constant/app_promotion.dart';
import 'package:foodpanda_clean_code/presentation/screen/home/item/searchbox.dart';
import 'package:get/get.dart';

class RestarauntScreen extends StatelessWidget {
  const RestarauntScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Restauraunt Delivery",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "12160 St 228",
              style: TextStyle(color: Colors.black, fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.pink,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Colors.pink,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const searchbox(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: AppPromotion.listPromotion
                    .map(
                      (listPromotion) => Padding(
                        padding: const EdgeInsets.all(14),
                        child: SizedBox(
                          height: 135,
                          width: 110,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: AssetImage(listPromotion.img),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "ប្រភេទអាហារ",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: AppFoodType.listPromotion
                    .map(
                      (listPromotion) => Padding(
                        padding: const EdgeInsets.only(left: 14),
                        child: SizedBox(
                          width: 120,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              image: AssetImage(listPromotion.img),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "ភោជនីយដ្ឋានរបស់អ្នក",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      width: 300,
                      height: 240,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 4,
                              right: 4,
                            ),
                            child: SizedBox(
                              width: 300,
                              height: 150,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: const Image(
                                  image: AssetImage("assets/tube-coffee.jpeg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 4, right: 4, top: 4),
                            child: Container(
                              width: 300,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        "TUBE COFFEE(Toul Tompong)",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      Text("4.4"),
                                    ],
                                  ),
                                  const Text("\$\$ Beverages"),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.delivery_dining,
                                      ),
                                      Text("\$ 0.95"),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
