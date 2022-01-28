import 'package:dartz/dartz.dart';
import 'package:foodpanda_clean_code/data/datasource/shop_datasource.dart';
import 'package:foodpanda_clean_code/data/model/shop_model.dart';
import 'package:foodpanda_clean_code/domain/repository/shop_repository_interface.dart';
import 'package:foodpanda_clean_code/domain/util/app_error.dart';

class ShopRepository extends IShopRepository {
  final IShopDataSource shopDataSource;

  ShopRepository({
    required this.shopDataSource,
  });

  @override
  Future<Either<AppError, List<ShopModel>>> getListOfShop() {
    return shopDataSource.getListOfShop();
  }

  @override
  Future<Either<AppError, String>> saveShop(ShopModel model) {
    return shopDataSource.saveShop(model);
  }

  @override
  Future<Either<AppError, String>> updateShop(ShopModel model) {
    return shopDataSource.updateShop(model);
  }

  @override
  Future<Either<AppError, String>> deleteShop(String recordId) {
    return shopDataSource.deleteShop(recordId);
  }
}
