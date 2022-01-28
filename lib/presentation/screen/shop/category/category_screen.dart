import 'package:flutter/material.dart';
import 'package:foodpanda_clean_code/core/enum/transaction_enum.dart';
import 'package:foodpanda_clean_code/presentation/controller/category_controller.dart';
import 'package:foodpanda_clean_code/presentation/screen/shop/category/category_form.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryController categoryController = Get.find();
  @override
  void initState() {
    categoryController.loadCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text('Category List'),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => const CategoryForm(transactionMode: TransactionMode.add),
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
            children: categoryController.listCategory
                .map(
                  (categoryModel) => GestureDetector(
                    onTap: () {
                      categoryController.selectCategory(categoryModel);
                      // Get.to(
                      //   () => const ShopForm(
                      //       transactionMode: TransactionMode.edit),
                      // );
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
                                  Text(categoryModel.nameCategory),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                // Image(
                                //   image: AssetImage(shopModel.image),
                                // ),
                                IconButton(
                                  onPressed: () {
                                    categoryController
                                        .deleteCategory(categoryModel.id);
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
