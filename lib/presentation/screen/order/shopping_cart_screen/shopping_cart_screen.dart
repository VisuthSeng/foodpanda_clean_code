import 'package:flutter/material.dart';
import 'package:foodpanda_clean_code/presentation/controller/category_controller.dart';
import 'package:foodpanda_clean_code/presentation/controller/shop_controller.dart';
import 'package:foodpanda_clean_code/presentation/screen/home/Home_screen.dart';
import 'package:foodpanda_clean_code/presentation/screen/order/order_screen.dart';
import 'package:get/get.dart';

class ShoppingCartScreen extends StatelessWidget {
  ShoppingCartScreen({Key? key}) : super(key: key);
  final CategoryController categoryController = Get.find();
  final ShopController shopController = Get.find();
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
                      onPressed: () {
                        categoryController.listOrder.clear();
                        Get.offAll(() => const HomeScreen());
                      },
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
            Get.to(() => const OrderScreen());
          },
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: shopController.getShop
              .map((shop) => Column(
                    children: [
                      const Text(
                        'កន្ត្រកទំនិញ',
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                      Text(
                        shop.nameShop,
                        style: const TextStyle(color: Colors.red, fontSize: 14),
                      )
                    ],
                  ))
              .toList(),
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 4,
                      blurRadius: 7,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(top: 15, left: 20),
                              child: SizedBox(
                                height: 70,
                                child: Image(
                                    image:
                                        AssetImage('assets/delivery_ride.jpg'),
                                    fit: BoxFit.fitHeight),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('ពេលវេលាដឹកជញ្ជូន'),
                              Text(
                                'Monday, 7:00',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              Text(
                                'ផ្លាស់ប្តូរ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.pink,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Container(
                width: double.infinity,
                height: 300,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: categoryController.listOrder
                        .map(
                          (listOrder) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 30,
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      spreadRadius: 2,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: const Center(
                                    child: Text(
                                  '1',
                                  style: TextStyle(fontSize: 10),
                                )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: SizedBox(
                                  height: 70,
                                  width: 80,
                                  child: Image(
                                    image: AssetImage(listOrder.imageUrl),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: SizedBox(
                                  child: Text(
                                    listOrder.name,
                                    style: const TextStyle(
                                        color: Colors.pink, fontSize: 12),
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  '\$ ${listOrder.price}',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Divider(
                                  thickness: 2,
                                  height: 2,
                                  color: Colors.grey[200],
                                ),
                              ),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: SizedBox(
                width: double.infinity,
                height: 125,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('សរុប'),
                        Text('\$ 1.99'),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('ថ្លែដឹកជញ្ជូន'),
                          Text('\$ 0.65'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.line_style,
                            color: Colors.pink,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'ដាក់ប្រើប័ណ្ណចំណាយ',
                              style: TextStyle(color: Colors.pink),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 5,
              height: 5,
              color: Colors.grey[200],
            ),
            Container(
              height: 500,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(
                          Icons.food_bank_outlined,
                          color: Colors.pink,
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 250),
                          child: Text(
                            'សមស្លាបព្រា',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(
                            Icons.turned_in,
                            color: Colors.pink,
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'ភោជនីយដ្ឋាននឹងផ្តល់សមស្លាបព្រាជ័រ ប្រសិនជាមាន',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
