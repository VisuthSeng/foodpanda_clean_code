import 'package:foodpanda_clean_code/data/model/shop_model.dart';
import 'package:foodpanda_clean_code/domain/usecase/shop_usecase.dart';
import 'package:foodpanda_clean_code/domain/util/no_param.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {
  final GetListOfShopUseCase getListOfShopUseCase;
  final SaveShopUseCase saveShopUseCase;
  final UpdateShopUseCase updateShopUseCase;
  final DeleteShopUseCase deleteShopUseCase;
  var getShop = RxList<ShopModel>();
  var listShop = RxList<ShopModel>();
  var selectedShop = ShopModel(
    id: '',
    nameShop: '',
    shopType: '',
    image: '',
    delivery: '',
    rating: 0,
  );

  ShopController({
    required this.getListOfShopUseCase,
    required this.saveShopUseCase,
    required this.updateShopUseCase,
    required this.deleteShopUseCase,
  });

  @override
  void onInit() {
    loadShop();
    super.onInit();
  }

  selectShop(ShopModel model) {
    getShop.clear();
    selectedShop = model;
    getShop.add(model);
  }

  loadShop() async {
    var response = await getListOfShopUseCase.call(NoParam());
    response.fold(
      (l) {
        Get.snackbar('Error', 'Load Data');
      },
      (r) {
        listShop.assignAll(r);
      },
    );
  }

  saveShop(ShopModel model) async {
    var response = await saveShopUseCase.call(model);
    response.fold(
      (l) {
        Get.snackbar('Error', 'Can not save data');
      },
      (r) {
        listShop.add(model);
        Get.back();
      },
    );
  }

  updateShop(ShopModel model) async {
    var response = await updateShop.call(model);
    response.fold(
      (l) {
        Get.snackbar('Error', 'Can not update data');
      },
      (r) {
        var id = listShop.indexWhere(
          (x) => x.id == model.id,
        );
        listShop[id] = model;
        Get.back();
      },
    );
  }

  deleteShop(String recordId) async {
    var response = await deleteShopUseCase.call(recordId);
    response.fold(
      (l) {
        Get.snackbar('Error', 'Can not delete data');
      },
      (r) {
        listShop.removeWhere((x) => x.id == recordId);
      },
    );
  }
}
