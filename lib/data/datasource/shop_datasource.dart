import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:foodpanda_clean_code/core/constant/firestore_collection.dart';
import 'package:foodpanda_clean_code/core/enum/app_error_type_enum.dart';
import 'package:foodpanda_clean_code/data/model/shop_model.dart';
import 'package:foodpanda_clean_code/domain/util/app_error.dart';

abstract class IShopDataSource {
  Future<Either<AppError, String>> saveShop(ShopModel model);
  Future<Either<AppError, String>> updateShop(ShopModel model);
  Future<Either<AppError, String>> deleteShop(String recordId);
  Future<Either<AppError, List<ShopModel>>> getListOfShop();
}

class ShopDataSource extends IShopDataSource {
  @override
  Future<Either<AppError, List<ShopModel>>> getListOfShop() async {
    List<ShopModel> listShop = [];
    try {
      await FirestoreCollection.shop.get().then(
        (QuerySnapshot querySnapshot) {
          for (var doc in querySnapshot.docs) {
            listShop.add(
              ShopModel.fromQueryDocumentSnapshot(doc),
            );
          }
        },
      );
      return Right(listShop);
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
  Future<Either<AppError, String>> saveShop(ShopModel model) async {
    try {
      await FirestoreCollection.shop.doc(model.id).set(model.toMap());
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
  Future<Either<AppError, String>> updateShop(ShopModel model) async {
    try {
      await FirestoreCollection.shop.doc(model.id).set(model.toMap());
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
  Future<Either<AppError, String>> deleteShop(String recordId) async {
    try {
      await FirestoreCollection.shop.doc(recordId).delete();
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
