// import 'package:flutter/material.dart';
// import 'package:foodpanda_clean_code/presentation/controller/category_controller.dart';
// import 'package:get/get.dart';
// import 'package:vertical_tab_bar_view/vertical_tab_bar_view.dart';

// class OrderScreen extends StatefulWidget {
//   const OrderScreen({Key? key}) : super(key: key);

//   @override
//   State<OrderScreen> createState() => _OrderScreenState();
// }

// class _OrderScreenState extends State<OrderScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   CategoryController categoryController = Get.find();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Order Screen'),
//       ),
//       body: Obx(() => Center(
//             child: Container(
//               width: double.infinity,
//               height: 500,
//               child: Column(
//                 children: categoryController.listCategoryid
//                     .map((model) => Column(
//                           children: [
//                             Text(model.nameCategory),
//                             Text(model.title),
//                             Text(model.subtitle),
//                             Text(model.deliveryTime),
//                           ],
//                         ))
//                     .toList(),
//               ),
//             ),
//           )),
//     );
//   }
// }

// ignore_for_file: file_names, unused_import

import 'package:flutter/material.dart';
import 'package:foodpanda_clean_code/presentation/controller/category_controller.dart';
import 'package:foodpanda_clean_code/presentation/screen/order/widget/header_clip.dart';

import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TestScreen>
    with SingleTickerProviderStateMixin {
  final CategoryController categoryController = Get.find();

  // TabController More Information => https://api.flutter.dev/flutter/material/TabController-class.html
  late AutoScrollController scrollController;
  late TabController tabController;

  @override
  void initState() {
    scrollController = AutoScrollController();
    tabController = TabController(
        length: categoryController.listCategoryid.length, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    tabController.dispose();

    super.dispose();
  }

  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // body: Column(
      //   children: [
      //     HeaderClip(
      //       context: context,
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(left: 10, right: 10),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: const [
      //           Text('កាហ្វេ StarBuck'),
      //           Text('ចាប់ពី \$ 0.90'),
      //         ],
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
      //       child: Divider(
      //         thickness: 1,
      //         height: 2,
      //         color: Colors.grey[200],
      //       ),
      //     ),
      //     Column(
      //       children: [
      //         Row(
      //           children: [
      //             Radio<int>(
      //                 value: 1,
      //                 groupValue: selectedValue,
      //                 onChanged: (value) => setState(() {
      //                       selectedValue = 1;
      //                     })),
      //             Text('Add Grass Jelly'),
      //           ],
      //         ),
      //         ElevatedButton(
      //           onPressed: () {
      //             setState(() {
      //               selectedValue = 1;
      //             });
      //           },
      //           child: Text('Select Radio'),
      //         ),
      //         ElevatedButton(
      //           onPressed: () {
      //             setState(() {
      //               selectedValue = 0;
      //             });
      //           },
      //           child: Text('Unselected Radio'),
      //         ),
      //       ],
      //     ),
      body: ListView(
        children: [
          RadioListTile(
            value: 1,
            groupValue: selectedValue,
            onChanged: (value) => setState(
              () {
                selectedValue = 2;
              },
            ),
            title: const Text('កែវតូច'),
            secondary: const Text('\$ 4.00'),
          ),
          RadioListTile(
            value: 2,
            groupValue: selectedValue,
            onChanged: (value) => setState(
              () {
                selectedValue = 2;
              },
            ),
            title: const Text('កែវកណ្តាល'),
            secondary: const Text('\$ 4.50'),
          ),
          RadioListTile(
            value: 3,
            groupValue: selectedValue,
            onChanged: (value) => setState(
              () {
                selectedValue = 2;
              },
            ),
            title: const Text('កែវធំ'),
            secondary: const Text('\$ 5.00'),
          ),
        ],
      ),
    );
  }
}
