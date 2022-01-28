import 'package:foodpanda_clean_code/data/datasource/category_datasource.dart';
import 'package:foodpanda_clean_code/data/datasource/shop_datasource.dart';
import 'package:foodpanda_clean_code/data/repository/category_repository.dart';
import 'package:foodpanda_clean_code/data/repository/shop_repository.dart';
import 'package:foodpanda_clean_code/domain/repository/category_repository_interface.dart';
import 'package:foodpanda_clean_code/domain/repository/shop_repository_interface.dart';
import 'package:foodpanda_clean_code/domain/usecase/category_usecase.dart';
import 'package:foodpanda_clean_code/domain/usecase/customer_usecase.dart';
import 'package:foodpanda_clean_code/presentation/controller/category_controller.dart';
import 'package:foodpanda_clean_code/presentation/controller/shop_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    //customer di
    Get.put<IShopDataSource>(
      ShopDataSource(),
      permanent: true,
    );
    Get.put<IShopRepository>(
      ShopRepository(
        shopDataSource: Get.find(),
      ),
      permanent: true,
    );
    Get.put<GetListOfShopUseCase>(
      GetListOfShopUseCase(
        shopRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<SaveShopUseCase>(
      SaveShopUseCase(
        shopRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<UpdateShopUseCase>(
      UpdateShopUseCase(
        shopRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<DeleteShopUseCase>(
      DeleteShopUseCase(
        shopRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put(
      ShopController(
        getListOfShopUseCase: Get.find(),
        saveShopUseCase: Get.find(),
        updateShopUseCase: Get.find(),
        deleteShopUseCase: Get.find(),
      ),
      permanent: true,
    );
    Get.put<ICategoryDataSource>(
      CategoryDataSource(),
      permanent: true,
    );
    Get.put<ICategoryRepository>(
      CategoryRepository(
        categoryDataSource: Get.find(),
      ),
      permanent: true,
    );
    Get.put<GetListofCategoryUseCase>(
      GetListofCategoryUseCase(
        categoryRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<SaveCategoryUseCase>(
      SaveCategoryUseCase(
        categoryRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<UpdateCategoryUseCase>(
      UpdateCategoryUseCase(
        categoryRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put<DeleteCategoryUseCase>(
      DeleteCategoryUseCase(
        categoryRepository: Get.find(),
      ),
      permanent: true,
    );
    Get.put(
      CategoryController(
        getListofCategoryUseCase: Get.find(),
        saveCategoryUseCase: Get.find(),
        updateCategoryUseCase: Get.find(),
        deleteCategoryUseCase: Get.find(),
      ),
      permanent: true,
    );
  }
}
