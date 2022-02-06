import 'dart:io';

import 'package:flutter/material.dart';

import 'package:foodpanda_clean_code/core/enum/transaction_enum.dart';
import 'package:foodpanda_clean_code/data/model/category_model.dart';

import 'package:foodpanda_clean_code/presentation/controller/category_controller.dart';
import 'package:foodpanda_clean_code/presentation/controller/shop_controller.dart';

import 'package:get/get.dart';

import 'package:uuid/uuid.dart';

class CategoryForm extends StatefulWidget {
  final TransactionMode transactionMode;

  const CategoryForm({
    Key? key,
    required this.transactionMode,
  }) : super(key: key);

  @override
  _CategoryFormState createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
  final ShopController shopController = Get.find();
  final CategoryController categoryController = Get.find();
  late TextEditingController tecNameCategory;
  late TextEditingController tecDeliveryTime;
  late TextEditingController tecFoodinCategory;

  File? pictureFile;

  @override
  void initState() {
    tecNameCategory = TextEditingController();
    if (widget.transactionMode == TransactionMode.edit) {
      tecNameCategory.text = categoryController.selectedCategory.nameCategory;
    }
    tecDeliveryTime = TextEditingController();
    if (widget.transactionMode == TransactionMode.edit) {
      tecDeliveryTime.text = categoryController.selectedCategory.deliveryTime;
    }
    tecFoodinCategory = TextEditingController();
    if (widget.transactionMode == TransactionMode.edit) {
      tecFoodinCategory.text =
          categoryController.selectedCategory.foodinCategory;
    }

    super.initState();
  }

  @override
  void dispose() {
    tecDeliveryTime.dispose();
    tecNameCategory.dispose();
    tecFoodinCategory.dispose();

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
            ? const Text('Add Category')
            : const Text('Edit Category'),
        actions: [
          IconButton(
            onPressed: () {
              if (widget.transactionMode == TransactionMode.add) {
                var id = const Uuid().v1();
                var model = CategoryModel(
                  id: id,
                  nameCategory: tecNameCategory.text,
                  deliveryTime: tecDeliveryTime.text,
                  foodinCategory: tecFoodinCategory.text,
                  shopID: shopController.selectedShop.id,
                );
                saveCategory(model);
              } else {
                var model = CategoryModel(
                  nameCategory: tecNameCategory.text,
                  deliveryTime: tecDeliveryTime.text,
                  foodinCategory: tecFoodinCategory.text,
                  id: categoryController.selectedCategory.id,
                  shopID: shopController.selectedShop.id,
                );
                updateCategory(model);
              }
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: tecNameCategory,
            decoration: const InputDecoration(
              labelText: 'Name Category',
            ),
          ),
          TextField(
            controller: tecFoodinCategory,
            decoration: const InputDecoration(
              labelText: 'Food',
            ),
          ),
          TextField(
            controller: tecDeliveryTime,
            decoration: const InputDecoration(
              labelText: 'Delivery Time',
            ),
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
