import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:foodpanda_clean_code/core/constant/firestore_collection.dart';
import 'package:foodpanda_clean_code/core/enum/app_error_type_enum.dart';
import 'package:foodpanda_clean_code/data/model/category_model.dart';

import 'package:foodpanda_clean_code/domain/util/app_error.dart';

abstract class ICategoryDataSource {
  Future<Either<AppError, String>> saveCategory(CategoryModel model);
  Future<Either<AppError, String>> updateCategory(CategoryModel model);
  Future<Either<AppError, String>> deleteCategory(String recordId);
  Future<Either<AppError, List<CategoryModel>>> getlistofCategory();
  Future<Either<AppError, List<CategoryModel>>> getlistofCategoryByShopId(
      String shopId);
}

class CategoryDataSource extends ICategoryDataSource {
  @override
  Future<Either<AppError, List<CategoryModel>>> getlistofCategoryByShopId(
      String shopId) async {
    List<CategoryModel> listCategory = [];
    try {
      await FirestoreCollection.category
          .where('shopID', isEqualTo: shopId)
          .get()
          .then(
        (QuerySnapshot querySnapshot) {
          for (var doc in querySnapshot.docs) {
            listCategory.add(
              CategoryModel.fromQueryDocumentSnapshot(doc),
            );
          }
        },
      );

      return Right(listCategory);
    } catch (e) {
      return Left(
        AppError(
          appErrorType: AppErrorType.connection,
          description: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<AppError, List<CategoryModel>>> getlistofCategory() async {
    List<CategoryModel> listCategory = [];
    try {
      await FirestoreCollection.category.get().then(
        (QuerySnapshot querySnapshot) {
          for (var doc in querySnapshot.docs) {
            listCategory.add(
              CategoryModel.fromQueryDocumentSnapshot(doc),
            );
          }
        },
      );

      return Right(listCategory);
    } catch (e) {
      return Left(
        AppError(
          appErrorType: AppErrorType.connection,
          description: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<AppError, String>> saveCategory(CategoryModel model) async {
    try {
      await FirestoreCollection.category.doc(model.id).set(model.toMap());
      return Right(model.id);
    } catch (e) {
      return Left(
        AppError(
          appErrorType: AppErrorType.connection,
          description: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<AppError, String>> updateCategory(CategoryModel model) async {
    try {
      await FirestoreCollection.category.doc(model.id).set(model.toMap());
      return Right(model.id);
    } catch (e) {
      return Left(
        AppError(
          appErrorType: AppErrorType.connection,
          description: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<AppError, String>> deleteCategory(String recordId) async {
    try {
      await FirestoreCollection.category.doc(recordId).delete();
      return Right(recordId);
    } catch (e) {
      return Left(
        AppError(
          appErrorType: AppErrorType.connection,
          description: e.toString(),
        ),
      );
    }
  }
}

class Category {
  String title;
  String? subtitle;
  List<Food> foods;
  bool isHotSale;

  Category({
    required this.title,
    required this.subtitle,
    required this.foods,
    required this.isHotSale,
  });
}

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
