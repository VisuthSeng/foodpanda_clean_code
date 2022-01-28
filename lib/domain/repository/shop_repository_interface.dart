import 'package:dartz/dartz.dart';
import 'package:foodpanda_clean_code/data/model/shop_model.dart';
import 'package:foodpanda_clean_code/domain/util/app_error.dart';

abstract class IShopRepository {
  Future<Either<AppError, String>> saveShop(ShopModel model);
  Future<Either<AppError, String>> updateShop(ShopModel model);
  Future<Either<AppError, String>> deleteShop(String recordId);
  Future<Either<AppError, List<ShopModel>>> getListOfShop();
}
