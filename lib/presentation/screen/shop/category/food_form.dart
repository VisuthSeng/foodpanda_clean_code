import 'dart:io';

import 'package:flutter/material.dart';

import 'package:foodpanda_clean_code/core/enum/transaction_enum.dart';
import 'package:foodpanda_clean_code/data/model/category_model.dart';

import 'package:foodpanda_clean_code/presentation/controller/category_controller.dart';
import 'package:foodpanda_clean_code/presentation/controller/shop_controller.dart';

import 'package:get/get.dart';

class FoodForm extends StatefulWidget {
  final TransactionMode transactionMode;

  const FoodForm({
    Key? key,
    required this.transactionMode,
  }) : super(key: key);

  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<FoodForm> {
  final ShopController shopController = Get.find();
  final CategoryController categoryController = Get.find();
  late TextEditingController tecNameCategory;
  late TextEditingController tecTitle;
  late TextEditingController tecSubtitle;
  late TextEditingController tecFoodName;
  late TextEditingController tecPrice;
  late TextEditingController tecComparePrice;
  late TextEditingController tecimageAssets;

  late TextEditingController tecDeliveryTime;

  File? pictureFile;

  @override
  void initState() {
    tecFoodName = TextEditingController();
    tecPrice = TextEditingController();
    tecComparePrice = TextEditingController();
    tecimageAssets = TextEditingController();
    if (widget.transactionMode == TransactionMode.edit) {
      tecFoodName.text = categoryController.selectedFood.name;
      tecPrice.text = categoryController.selectedFood.price;
      tecComparePrice.text = categoryController.selectedFood.comparePrice;
      tecimageAssets.text = categoryController.selectedFood.imageUrl;
    }
  }

  @override
  void dispose() {
    tecFoodName.dispose();
    tecPrice.dispose();
    tecComparePrice.dispose();
    tecimageAssets.dispose();

    super.dispose();
  }

  // getImage(ImageSource imageSource) async {
  //   var picker = ImagePicker();

  //   try {
  //     var imageFile = await picker.pickImage(source: imageSource);
  //     if (imageFile != null) {
  //       var crop = await ImageCropper.cropImage(
  //         sourcePath: imageFile.path,
  //         aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
  //         compressQuality: 100,
  //         maxWidth: 100,
  //         maxHeight: 100,
  //         compressFormat: ImageCompressFormat.jpg,
  //         androidUiSettings: AndroidUiSettings(
  //           toolbarTitle: '',
  //           toolbarColor: Theme.of(context).scaffoldBackgroundColor,
  //           statusBarColor: Theme.of(context).scaffoldBackgroundColor,
  //           backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  //           cropFrameColor: Theme.of(context).colorScheme.secondary,
  //           cropGridColor: Theme.of(context).colorScheme.secondary,
  //           dimmedLayerColor: Colors.transparent,
  //           toolbarWidgetColor: Theme.of(context).colorScheme.secondary,
  //           hideBottomControls: true,
  //         ),
  //         iosUiSettings: const IOSUiSettings(
  //           cancelButtonTitle: 'ចាកចេញ',
  //           doneButtonTitle: 'យល់ព្រម',
  //           rotateButtonsHidden: true,
  //           resetButtonHidden: true,
  //           rotateClockwiseButtonHidden: true,
  //         ),
  //       );

  //       setState(() {
  //         pictureFile = crop;
  //       });
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', 'Can not use picture');
  //   }
  // }

  removeImage() {
    setState(() {
      pictureFile = null;
    });
  }

  saveCategory(CategoryModel model) async {
    // if (pictureFile != null) {
    //   firebase_storage.TaskSnapshot snapshot = await FirebaseStorageReference
    //       .shopProfile

    //       .child(model.id + '.jpg')
    //       .putFile(
    //         pictureFile!,
    //         firebase_storage.SettableMetadata(contentType: 'image/jpg'),
    //       );
    //   if (snapshot.state == firebase_storage.TaskState.success) {
    //     final String downloadUrl = await snapshot.ref.getDownloadURL();
    //     model = model.copyWith(profilePicture: downloadUrl);
    //   } else if (snapshot.state == firebase_storage.TaskState.error) {
    //     Get.snackbar('Error', 'Upload profile picture problem');
    //     return;
    //   }
    // }

    categoryController.saveCategory(model);
  }

  updateCategory(CategoryModel model) async {
    // if (pictureFile != null) {
    //   firebase_storage.TaskSnapshot snapshot = await FirebaseStorageReference
    //       .customerProfile
    //       .child(model.id + '.jpg')
    //       .putFile(
    //         pictureFile!,
    //         firebase_storage.SettableMetadata(contentType: 'image/jpg'),
    //       );
    //   if (snapshot.state == firebase_storage.TaskState.success) {
    //     final String downloadUrl = await snapshot.ref.getDownloadURL();
    //     model = model.copyWith(profilePicture: downloadUrl);
    //   } else if (snapshot.state == firebase_storage.TaskState.error) {
    //     Get.snackbar('Error', 'Upload profile picture problem');
    //     return;
    //   }
    // }

    categoryController.updateCategory(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.transactionMode == TransactionMode.add
            ? const Text('Add Food')
            : const Text('Edit Food'),
        actions: [
          IconButton(
            onPressed: () {
              if (widget.transactionMode == TransactionMode.add) {
                var model = Food(
                  name: tecFoodName.text,
                  price: tecPrice.text,
                  comparePrice: tecComparePrice.text,
                  imageUrl: tecimageAssets.text,
                  isHotSale: true,
                );
                categoryController.addFoodtoList(model);
                Get.back();
              } else {
                var model = Food(
                  name: categoryController.selectedFood.name,
                  price: categoryController.selectedFood.price,
                  comparePrice: categoryController.selectedFood.comparePrice,
                  imageUrl: categoryController.selectedFood.imageUrl,
                  isHotSale: true,
                );
                categoryController.addFoodtoList(model);
                Get.back();
              }
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: tecFoodName,
            decoration: const InputDecoration(
              labelText: 'Food Name',
            ),
          ),
          TextField(
            controller: tecPrice,
            decoration: const InputDecoration(
              labelText: 'Price',
            ),
          ),
          TextField(
            controller: tecComparePrice,
            decoration: const InputDecoration(
              labelText: 'Compare Price',
            ),
          ),
          TextField(
            controller: tecimageAssets,
            decoration: const InputDecoration(
              labelText: 'Image assets',
            ),
          ),
          const SizedBox(
            width: 8,
          ),
          // Container(
          //   height: 100,
          //   color: Colors.red,
          //   width: double.infinity,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: const [
          //       Text('Food name'),
          //       Text('Price' 'Compare Price'),
          //       Text('Image Assets'),
          //     ],
          //   ),
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(right: 20, top: 10),
          //       child: ElevatedButton(
          //         style: ElevatedButton.styleFrom(primary: Colors.pink),
          //         onPressed: () {
          //           Get.to(
          //             () => FoodForm(transactionMode: TransactionMode.add),
          //           );
          //         },
          //         child: const Text('Add Food'),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
