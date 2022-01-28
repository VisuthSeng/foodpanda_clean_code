import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String nameCategory;
  final int shopID;
  final String deliveryTime;
  final String foodinCategory;

  CategoryModel({
    required this.id,
    required this.nameCategory,
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
      shopID: int.tryParse(shopID ?? this.shopID.toString()) ?? 0,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      foodinCategory: foodinCategory ?? this.foodinCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameCategory': nameCategory,
      'shopID': shopID,
      'deliveryTime': deliveryTime,
      'foodinCategory': foodinCategory,
    };
  }

  factory CategoryModel.fromQueryDocumentSnapshot(QueryDocumentSnapshot doc) {
    return CategoryModel(
      id: doc['id'] ?? '',
      nameCategory: doc['nameCategory'] ?? '',
      shopID: doc['shopID'] ?? '',
      deliveryTime: doc['deliveryTime'] ?? '',
      foodinCategory: doc['foodinCategory'] ?? '',
    );
  }
}
