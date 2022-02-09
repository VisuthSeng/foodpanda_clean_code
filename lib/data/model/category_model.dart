import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  String name;
  String price;
  String comparePrice;
  String imageUrl;
  bool isHotSale;

  Food({
    required this.name,
    required this.price,
    required this.comparePrice,
    required this.imageUrl,
    required this.isHotSale,
  });
}

class CategoryModel {
  final String id;
  final String nameCategory;
  final String title;
  final String subtitle;
  final List<Food> foods;
  final String shopID;
  final String deliveryTime;
  final String foodinCategory;

  CategoryModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.nameCategory,
    required this.foods,
    required this.shopID,
    required this.deliveryTime,
    required this.foodinCategory,
  });
  CategoryModel copyWith({
    String? id,
    String? nameCategory,
    String? shopID,
    String? deliveryTime,
    String? foodinCategory,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      nameCategory: nameCategory ?? this.nameCategory,
      title: title,
      subtitle: subtitle,
      foods: foods,
      shopID: shopID ?? this.shopID,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      foodinCategory: foodinCategory ?? this.foodinCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameCategory': nameCategory,
      'title': title,
      'subtitle': subtitle,
      'foods': foods,
      'shopID': shopID,
      'deliveryTime': deliveryTime,
      'foodinCategory': foodinCategory,
    };
  }

  factory CategoryModel.fromQueryDocumentSnapshot(QueryDocumentSnapshot doc) {
    return CategoryModel(
      id: doc['id'] ?? '',
      nameCategory: doc['nameCategory'] ?? '',
      title: doc['title'] ?? '',
      subtitle: doc['subtitle'] ?? '',
      foods: doc['foods'] ?? '',
      shopID: doc['shopID'] ?? '',
      deliveryTime: doc['deliveryTime'] ?? '',
      foodinCategory: doc['foodinCategory'] ?? '',
    );
  }
}
