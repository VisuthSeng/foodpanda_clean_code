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

import 'package:flutter/material.dart';
import 'package:foodpanda_clean_code/data/model/category_model.dart';
import 'package:foodpanda_clean_code/presentation/controller/category_controller.dart';
import 'package:foodpanda_clean_code/presentation/controller/shop_controller.dart';
import 'package:foodpanda_clean_code/presentation/screen/order/category_section.dart';
import 'package:foodpanda_clean_code/presentation/screen/order/widget/header_clip.dart';

import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  final CategoryController categoryController = Get.find();

  final ShopController shopController = Get.find();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => VerticalScrollableTabView(
            tabController: tabController,
            listItemData: categoryController.listCategoryid,
            verticalScrollPosition: VerticalScrollPosition.begin,
            eachItemChild: (object, index) =>
                CategorySection(categoryModel: object as CategoryModel),
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                pinned: true,
                expandedHeight: 250.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(() => Row(
                        children: categoryController.listCategoryid
                            .map(
                              (element) => Text(
                                element.title,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            )
                            .toList())),
                  ),
                  titlePadding: const EdgeInsets.only(bottom: 50),
                  collapseMode: CollapseMode.pin,
                  background: Column(
                    children: shopController.getShop
                        .map(
                          (e) => Stack(
                            children: [
                              HeaderClip(context: context, image: e.image),
                            ],
                          ),
                        )
                        .toList(),
                  ),
                ),
                bottom: TabBar(
                  isScrollable: true,
                  controller: tabController,
                  indicatorPadding:
                      const EdgeInsets.symmetric(horizontal: 16.0),
                  indicatorColor: Colors.pink,
                  labelColor: Colors.pinkAccent,
                  unselectedLabelColor: Colors.black,
                  indicatorWeight: 3.0,
                  tabs: categoryController.listCategoryid.map((e) {
                    return Tab(text: e.subtitle);
                  }).toList(),
                  onTap: (index) {
                    VerticalScrollableTabBarStatus.setIndex(index);
                  },
                ),
              ),
            ],
          )),
    );
  }
}
