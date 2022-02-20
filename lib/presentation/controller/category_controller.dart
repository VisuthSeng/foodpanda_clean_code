import 'package:foodpanda_clean_code/data/model/category_model.dart';
import 'package:foodpanda_clean_code/data/model/shop_model.dart';
import 'package:foodpanda_clean_code/data/model/size_model.dart';
import 'package:foodpanda_clean_code/domain/usecase/category_usecase.dart';
import 'package:foodpanda_clean_code/domain/util/no_param.dart';

import 'package:get/get.dart';

class CategoryController extends GetxController {
  final GetListofCategoryByShopIdUseCase getListofCategoryByShopIdUseCase;
  final GetListofCategoryUseCase getListofCategoryUseCase;
  final SaveCategoryUseCase saveCategoryUseCase;
  final UpdateCategoryUseCase updateCategoryUseCase;
  final DeleteCategoryUseCase deleteCategoryUseCase;
  var totalvalue = 0.00;
  int selectedValue = 0;

  int value = 0;
  var size = '';

  var selectedCategory = CategoryModel(
    id: '',
    title: '',
    subtitle: '',
    nameCategory: '',
    shopID: '',
    deliveryTime: '',
  );
  var selectedFood = Food(
    name: '',
    price: '',
    comparePrice: '',
    imageUrl: '',
    isHotSale: true,
  );
  var listCategory = RxList<CategoryModel>();
  var listCategoryid = RxList<CategoryModel>();
  var listOrder = RxList<Food>();
  var listFood = RxList<Food>();
  var listSize = RxList<SizeModel>();
  var showSelectShop = RxList<ShopModel>();
  var showListFood = RxList<Food>();
  var blankcategory = CategoryModel(
    id: '',
    nameCategory: '',
    title: '',
    subtitle: '',
    deliveryTime: '15 min',
    shopID: '',
  );

  CategoryController({
    required this.getListofCategoryByShopIdUseCase,
    required this.getListofCategoryUseCase,
    required this.saveCategoryUseCase,
    required this.updateCategoryUseCase,
    required this.deleteCategoryUseCase,
  });

  void getToppingSize() {
    if (selectedValue == 1) {
      size = 'កែវតូច';
    } else if (selectedValue == 2) {
      size = 'កែវកណ្ដាល';
    } else if (selectedValue == 3) {
      size = 'កែវធំ';
    } else {
      size = '';
    }
  }

  void increaseValue(double? price) {
    totalvalue += price!;
  }

  void addtolistOrder(Food food) {
    listOrder.add(food);
  }

  void addtoshowFood(Food food) {
    showListFood.add(food);
  }

  void addFoodtoList(Food food) {
    listFood.add(food);
  }

  void clearListFood() {
    listFood.clear();
  }

  selectFood(Food food) {
    selectedFood = food;
  }

  selectShop(ShopModel shopModel) {
    showSelectShop.add(shopModel);
  }

  selectCategory(CategoryModel model) {
    selectedCategory = model;
  }

  loadCategoryByShopId(String shopId) async {
    listCategoryid.clear();
    // selectedCategory = blankcategory;
    var response = await getListofCategoryByShopIdUseCase.call(shopId);
    response.fold(
      (l) {
        Get.snackbar('Error', 'Load Data');
      },
      (r) {
        listCategoryid.assignAll(r);
      },
    );
  }

  loadCategory() async {
    listCategory.clear();
    // selectedCategory = blankcategory;
    var response = await getListofCategoryUseCase.call(NoParam());
    response.fold(
      (l) {
        Get.snackbar('Error', 'Load Data');
      },
      (r) {
        listCategory.assignAll(r);
      },
    );
  }

  saveCategory(CategoryModel model) async {
    var response = await saveCategoryUseCase.call(model);
    response.fold(
      (l) {
        Get.snackbar('Error', 'Can not save data');
      },
      (r) {
        listCategory.add(model);
        listCategoryid.add(model);
        Get.back();
      },
    );
  }

  updateCategory(CategoryModel model) async {
    var response = await updateCategory.call(model);
    response.fold(
      (l) {
        Get.snackbar('Error', 'Can not update data');
      },
      (r) {
        var id = listCategory.indexWhere(
          (x) => x.id == model.id,
        );
        listCategory[id] = model;
        listCategoryid[id] = model;
        Get.back();
      },
    );
  }

  deleteCategory(String recordId) async {
    var response = await deleteCategoryUseCase.call(recordId);
    response.fold(
      (l) {
        Get.snackbar('Error', 'Can not delete data');
      },
      (r) {
        listCategory.removeWhere((x) => x.id == recordId);
        listCategoryid.removeWhere((x) => x.id == recordId);
      },
    );
  }
}
