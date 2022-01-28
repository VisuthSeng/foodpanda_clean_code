import 'package:dartz/dartz.dart';
import 'package:foodpanda_clean_code/data/model/category_model.dart';

import 'package:foodpanda_clean_code/domain/util/app_error.dart';

abstract class ICategoryRepository {
  Future<Either<AppError, String>> saveCategory(CategoryModel model);
  Future<Either<AppError, String>> updateCategory(CategoryModel model);
  Future<Either<AppError, String>> deleteCategory(String recordId);
  Future<Either<AppError, List<CategoryModel>>> getlistofCategory();
  Future<Either<AppError, List<CategoryModel>>> getlistofCategoryByShopId(
      String shopId);
}
