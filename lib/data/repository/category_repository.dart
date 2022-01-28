import 'package:dartz/dartz.dart';
import 'package:foodpanda_clean_code/data/datasource/category_datasource.dart';

import 'package:foodpanda_clean_code/data/model/category_model.dart';

import 'package:foodpanda_clean_code/domain/repository/category_repository_interface.dart';

import 'package:foodpanda_clean_code/domain/util/app_error.dart';

class CategoryRepository extends ICategoryRepository {
  final ICategoryDataSource categoryDataSource;

  CategoryRepository({
    required this.categoryDataSource,
  });

  @override
  Future<Either<AppError, List<CategoryModel>>> getlistofCategory() {
    return categoryDataSource.getlistofCategory();
  }

  @override
  Future<Either<AppError, String>> saveCategory(CategoryModel model) {
    return categoryDataSource.saveCategory(model);
  }

  @override
  Future<Either<AppError, String>> updateCategory(CategoryModel model) {
    return categoryDataSource.updateCategory(model);
  }

  @override
  Future<Either<AppError, String>> deleteCategory(String recordId) {
    return categoryDataSource.deleteCategory(recordId);
  }
}
