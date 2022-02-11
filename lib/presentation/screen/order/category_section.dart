import 'package:flutter/material.dart';
import 'package:foodpanda_clean_code/data/model/category_model.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                  Text(
                    categoryModel.title,
                    style: _textTheme(context).headline5,
                  )
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                children: [
                  Text(
                    categoryModel.subtitle,
                    style: _textTheme(context).headline6,
                  )
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
          categoryModel.foods != null
              ? Column(
                  children: List.generate(
                    categoryModel.foods!.length,
                    (index) {
                      final food = categoryModel.foods![index];
                      bool isLastIndex =
                          index == categoryModel.foods!.length - 1;
                      return _buildFoodTile(
                        food: food,
                        context: context,
                        isLastIndex: isLastIndex,
                      );
                    },
                  ),
                )
              : const SizedBox.shrink(),
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
