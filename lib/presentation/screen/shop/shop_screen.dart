import 'package:flutter/material.dart';
import 'package:foodpanda_clean_code/core/enum/transaction_enum.dart';
import 'package:foodpanda_clean_code/presentation/controller/shop_controller.dart';
import 'package:foodpanda_clean_code/presentation/screen/shop/shop_form.dart';
import 'package:get/get.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  final ShopController shopController = Get.find();
  @override
  void initState() {
    shopController.loadShop();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Shop List'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => const ShopForm(transactionMode: TransactionMode.add),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Obx(
        () => SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: shopController.listShop
                .map(
                  (shopModel) => GestureDetector(
                    onTap: () {
                      shopController.selectShop(shopModel);
                      Get.to(
                        () => const ShopForm(
                            transactionMode: TransactionMode.edit),
                      );
                    },
                    child: Card(
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 60),
                              child: Row(
                                children: [
                                  Text(shopModel.nameShop),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Image(
                                  image: AssetImage(shopModel.image),
                                ),
                                IconButton(
                                  onPressed: () {
                                    shopController.deleteShop(shopModel.id);
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
