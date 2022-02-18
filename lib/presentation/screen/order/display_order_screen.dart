import 'package:flutter/material.dart';
import 'package:foodpanda_clean_code/presentation/controller/category_controller.dart';
import 'package:foodpanda_clean_code/presentation/screen/order/load_screen.dart';
import 'package:foodpanda_clean_code/presentation/screen/order/order_screen.dart';
import 'package:get/get.dart';

class DisplayOrderScreen extends StatelessWidget {
  DisplayOrderScreen({Key? key}) : super(key: key);
  final CategoryController categoryController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (categoryController.listCategoryid.isEmpty) {
        return const LoadScreen();
      } else {
        return const OrderScreen();
      }
    });
  }
}
