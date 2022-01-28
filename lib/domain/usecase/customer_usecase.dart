import 'package:dartz/dartz.dart';
import 'package:foodpanda_clean_code/data/model/shop_model.dart';
import 'package:foodpanda_clean_code/domain/repository/shop_repository_interface.dart';
import 'package:foodpanda_clean_code/domain/usecase/usecase.dart';
import 'package:foodpanda_clean_code/domain/util/app_error.dart';
import 'package:foodpanda_clean_code/domain/util/no_param.dart';

class GetListOfShopUseCase extends UseCaseFuture<List<ShopModel>, NoParam> {
  final IShopRepository shopRepository;

  GetListOfShopUseCase({
    required this.shopRepository,
  });

  @override
  Future<Either<AppError, List<ShopModel>>> call(NoParam parameter) async {
    return await shopRepository.getListOfShop();
  }
}

class SaveShopUseCase extends UseCaseFuture<String, ShopModel> {
  final IShopRepository shopRepository;

  SaveShopUseCase({
    required this.shopRepository,
  });

  @override
  Future<Either<AppError, String>> call(ShopModel parameter) async {
    return await shopRepository.saveShop(parameter);
  }
}

class UpdateShopUseCase extends UseCaseFuture<String, ShopModel> {
  final IShopRepository shopRepository;

  UpdateShopUseCase({
    required this.shopRepository,
  });

  @override
  Future<Either<AppError, String>> call(ShopModel parameter) async {
    return await shopRepository.updateShop(parameter);
  }
}

class DeleteShopUseCase extends UseCaseFuture<String, String> {
  final IShopRepository shopRepository;

  DeleteShopUseCase({
    required this.shopRepository,
  });

  @override
  Future<Either<AppError, String>> call(String parameter) async {
    return await shopRepository.deleteShop(parameter);
  }
}
