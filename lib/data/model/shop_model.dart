import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:foodpanda_clean_code/data/model/category_model.dart';

class ShopModel {
  final String id;
  final String nameShop;
  final String shopType;
  final String delivery;
  final String image;
  final double rating;
  final List<CategoryModel>? listCategory;

  ShopModel(
      {required this.id,
      required this.image,
      required this.nameShop,
      this.listCategory,
      required this.shopType,
      required this.delivery,
      required this.rating});
  ShopModel copyWith({
    String? id,
    String? nameShop,
    List<CategoryModel>? listCategory,
    String? image,
    String? shopType,
    String? delivery,
    double? rating,
  }) {
    return ShopModel(
      id: id ?? this.id,
      nameShop: nameShop ?? this.nameShop,
      listCategory: listCategory ?? this.listCategory,
      shopType: shopType ?? this.shopType,
      image: image ?? this.image,
      delivery: delivery ?? this.delivery,
      rating: rating ?? this.rating,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameShop': nameShop,
      'listCategory': listCategory?.map((x) => x.toMap()).toList(),
      'shopType': shopType,
      'image': image,
      'delivery': delivery,
      'rating': rating,
    };
  }

  factory ShopModel.fromQueryDocumentSnapshot(QueryDocumentSnapshot doc) {
    return ShopModel(
      id: doc['id'] ?? '',
      nameShop: doc['nameShop'] ?? '',
      listCategory: doc['listCategory'] ?? '',
      shopType: doc['shopType'] ?? '',
      image: doc['image'] ?? '',
      delivery: doc['delivery'] ?? '',
      rating: doc['rating'] ?? '',
    );
  }
}
