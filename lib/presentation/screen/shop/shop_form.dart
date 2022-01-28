import 'dart:io';

import 'package:flutter/material.dart';

import 'package:foodpanda_clean_code/core/enum/transaction_enum.dart';
import 'package:foodpanda_clean_code/data/model/shop_model.dart';
import 'package:foodpanda_clean_code/presentation/controller/shop_controller.dart';
import 'package:get/get.dart';

import 'package:uuid/uuid.dart';

class ShopForm extends StatefulWidget {
  final TransactionMode transactionMode;

  const ShopForm({
    Key? key,
    required this.transactionMode,
  }) : super(key: key);

  @override
  _ShopFormState createState() => _ShopFormState();
}

class _ShopFormState extends State<ShopForm> {
  final ShopController shopController = Get.find();
  late TextEditingController tecNameShop;
  late TextEditingController tecShopType;
  late TextEditingController tecimage;
  late TextEditingController tecDelivery;
  late TextEditingController tecRating;

  File? pictureFile;

  @override
  void initState() {
    tecNameShop = TextEditingController();
    if (widget.transactionMode == TransactionMode.edit) {
      tecNameShop.text = shopController.selectedShop.nameShop;
    }
    tecShopType = TextEditingController();
    if (widget.transactionMode == TransactionMode.edit) {
      tecShopType.text = shopController.selectedShop.shopType;
    }
    tecimage = TextEditingController();
    if (widget.transactionMode == TransactionMode.edit) {
      tecimage.text = shopController.selectedShop.image;
    }
    tecDelivery = TextEditingController();
    if (widget.transactionMode == TransactionMode.edit) {
      tecDelivery.text = shopController.selectedShop.delivery;
    }
    tecRating = TextEditingController();
    if (widget.transactionMode == TransactionMode.edit) {
      tecRating.text = shopController.selectedShop.rating.toString();
    }

    super.initState();
  }

  @override
  void dispose() {
    tecNameShop.dispose();
    tecShopType.dispose();
    tecimage.dispose();
    tecDelivery.dispose();
    tecRating.dispose();
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

  saveShop(ShopModel model) async {
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

    shopController.saveShop(model);
  }

  updateShop(ShopModel model) async {
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

    shopController.updateShop(model);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.transactionMode == TransactionMode.add
            ? const Text('Add Shop')
            : const Text('Edit  Shop'),
        actions: [
          IconButton(
            onPressed: () {
              if (widget.transactionMode == TransactionMode.add) {
                var id = const Uuid().v1();
                var model = ShopModel(
                  id: id,
                  nameShop: tecNameShop.text,
                  shopType: tecShopType.text,
                  image: tecimage.text,
                  delivery: tecDelivery.text,
                  rating: double.tryParse(tecRating.text) ?? 0,
                );
                saveShop(model);
              } else {
                var model = ShopModel(
                  id: shopController.selectedShop.id,
                  nameShop: tecNameShop.text,
                  shopType: tecShopType.text,
                  image: shopController.selectedShop.image,
                  delivery: shopController.selectedShop.delivery,
                  rating: shopController.selectedShop.rating,
                );
                updateShop(model);
              }
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: tecNameShop,
            decoration: const InputDecoration(
              labelText: 'Shop Name',
            ),
          ),
          TextField(
            controller: tecShopType,
            decoration: const InputDecoration(
              labelText: 'Shop Type',
            ),
          ),
          TextField(
            controller: tecimage,
            decoration: const InputDecoration(
              labelText: 'Image',
            ),
          ),
          TextField(
            controller: tecDelivery,
            decoration: const InputDecoration(
              labelText: 'Shop Delivery',
            ),
          ),
          TextField(
            controller: tecRating,
            decoration: const InputDecoration(
              labelText: 'Shop Rating',
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
