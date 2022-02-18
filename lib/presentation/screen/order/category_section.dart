// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:foodpanda_clean_code/data/model/category_model.dart';
import 'package:foodpanda_clean_code/presentation/screen/order/topping/topping_screen.dart';
import 'package:get/get.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      categoryModel.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    Text(
                      categoryModel.subtitle,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
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
                                image: AssetImage('assets/starbuck.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('បាយសាច់ជ្រូក'),
                                  Text('\$ 1.50'),
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
                                  padding: const EdgeInsets.only(left: 25),
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.add,
                                        color: Colors.pink,
                                      ),
                                      Text(
                                        'បន្ថែមការណែនាំពិសេស',
                                        style: TextStyle(color: Colors.pink),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      child: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 20),
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
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.pink,
                                          ),
                                          onPressed: () {
                                            Get.to(
                                              () => const ToppingScreen(),
                                            );
                                          },
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
                child: categoryModel.foods != null
                    ? Column(
                        children: categoryModel.foods!
                            .map(
                              (e) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 15),
                                    child: Text(
                                      e.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30, left: 15),
                                    child: Row(
                                      children: [
                                        Text('\$ ' + e.price),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        const Icon(
                                          Icons.fireplace,
                                          color: Colors.pink,
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text('ពេញនិយម'),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 100),
                                          child: SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: Image(
                                              image: AssetImage(e.imageUrl),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15),
                                    child: Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: Colors.grey[400],
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
          // categoryModel.foods != null
          //     ? Column(
          //         children: List.generate(
          //           categoryModel.foods!.length,
          //           (index) {
          //             final food = categoryModel.foods![index];
          //             bool isLastIndex =
          //                 index == categoryModel.foods!.length - 1;
          //             return _buildFoodTile(
          //               food: food,
          //               context: context,
          //               isLastIndex: isLastIndex,
          //             );
          //           },
          //         ),
          //       )
          //     : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildFoodTile({
    required BuildContext context,
    required bool isLastIndex,
    required Food food,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFoodDetail(food: food, context: context),
            _buildFoodImage(food.imageUrl),
          ],
        ),
        !isLastIndex ? const Divider(height: 16.0) : const SizedBox(height: 8.0)
      ],
    );
  }

  Widget _buildFoodImage(String url) {
    return Image(
      image: AssetImage(url),
      fit: BoxFit.fill,
    );
  }

  Widget _buildFoodDetail({
    required BuildContext context,
    required Food food,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          food.name,
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Text(
              "" + food.price + " ",
              style: const TextStyle(color: Colors.black),
            ),
            Text(
              food.comparePrice,
              style: _textTheme(context)
                  .caption
                  ?.copyWith(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: 8.0),
            if (food.isHotSale) _buildFoodHotSaleIcon(),
          ],
        ),
      ],
    );
  }

  Widget _buildFoodHotSaleIcon() {
    return Container(
      child: const Icon(Icons.whatshot, color: Colors.pink, size: 16.0),
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.pink.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.0),
      ),
    );
  }

  TextTheme _textTheme(context) => Theme.of(context).textTheme;
}
