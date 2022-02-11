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
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'comparePrice': comparePrice,
      'imageUrl': imageUrl,
      'isHotSale': isHotSale,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'] ?? '',
      price: map['price'] ?? '',
      comparePrice: map['comparePrice'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      isHotSale: map['isHotSale'] ?? '',
    );
  }
}

class CategoryModel {
  final String id;
  final String nameCategory;
  final String title;
  final String subtitle;
  final List<Food>? foods;
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
    String? title,
    String? subtitle,
    List<Food>? foods,
    String? shopID,
    String? deliveryTime,
    String? foodinCategory,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      nameCategory: nameCategory ?? this.nameCategory,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      foods: foods ?? this.foods,
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
      'foods': foods?.map((x) => x.toMap()).toList(),
      'shopID': shopID,
      'deliveryTime': deliveryTime,
      'foodinCategory': foodinCategory,
    };
  }

  factory CategoryModel.fromQueryDocumentSnapshot(QueryDocumentSnapshot doc) {
    List<Food>? listFood;
    if (doc['foods'] != null) {
      listFood =
          (doc['foods'] as List).map((food) => Food.fromMap(food)).toList();
    }

    return CategoryModel(
      id: doc['id'] ?? '',
      nameCategory: doc['nameCategory'] ?? '',
      title: doc['title'] ?? '',
      subtitle: doc['subtitle'] ?? '',
      foods: listFood,
      shopID: doc['shopID'] ?? '',
      deliveryTime: doc['deliveryTime'] ?? '',
      foodinCategory: doc['foodinCategory'] ?? '',
    );
  }
}
