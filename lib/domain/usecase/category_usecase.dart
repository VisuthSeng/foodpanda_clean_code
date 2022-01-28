import 'package:dartz/dartz.dart';
import 'package:foodpanda_clean_code/data/model/category_model.dart';
import 'package:foodpanda_clean_code/domain/repository/category_repository_interface.dart';
import 'package:foodpanda_clean_code/domain/usecase/usecase.dart';
import 'package:foodpanda_clean_code/domain/util/app_error.dart';
import 'package:foodpanda_clean_code/domain/util/no_param.dart';

class GetListofCategoryUseCase
    extends UseCaseFuture<List<CategoryModel>, NoParam> {
  final ICategoryRepository categoryRepository;

  GetListofCategoryUseCase({
    required this.categoryRepository,
  });

  @override
  Future<Either<AppError, List<CategoryModel>>> call(NoParam parameter) async {
    return await categoryRepository.getlistofCategory();
  }
}

class SaveCategoryUseCase extends UseCaseFuture<String, CategoryModel> {
  final ICategoryRepository categoryRepository;

  SaveCategoryUseCase({
    required this.categoryRepository,
  });

  @override
  Future<Either<AppError, String>> call(CategoryModel parameter) async {
    return await categoryRepository.saveCategory(parameter);
  }
}

class UpdateCategoryUseCase extends UseCaseFuture<String, CategoryModel> {
  final ICategoryRepository categoryRepository;

  UpdateCategoryUseCase({
    required this.categoryRepository,
  });

  @override
  Future<Either<AppError, String>> call(CategoryModel parameter) async {
    return await categoryRepository.updateCategory(parameter);
  }
}

class DeleteCategoryUseCase extends UseCaseFuture<String, String> {
  final ICategoryRepository categoryRepository;

  DeleteCategoryUseCase({
    required this.categoryRepository,
  });

  @override
  Future<Either<AppError, String>> call(String parameter) async {
    return await categoryRepository.deleteCategory(parameter);
  }
}
