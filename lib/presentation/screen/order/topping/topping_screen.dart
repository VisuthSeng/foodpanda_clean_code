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
import 'package:foodpanda_clean_code/presentation/controller/category_controller.dart';
import 'package:foodpanda_clean_code/presentation/screen/order/widget/header_clip.dart';

import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class ToppingScreen extends StatefulWidget {
  const ToppingScreen({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ToppingScreen>
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

  int selectedValue = 1;
  int selectedice = 0;
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderClip(
              context: context,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('កាហ្វេ StarBuck'),
                  Text('ចាប់ពី \$ 0.90'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: Divider(
                thickness: 1,
                height: 2,
                color: Colors.grey[200],
              ),
            ),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Variation',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('ជ្រើសរើសទំហំ'),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: selectedValue == 1
                              ? const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 5,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                )
                              : const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.pink,
                                    child: CircleAvatar(
                                      radius: 9,
                                      backgroundColor: Colors.white,
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                    RadioListTile(
                      activeColor: Colors.pink,
                      value: 1,
                      groupValue: selectedValue,
                      onChanged: (value) => setState(
                        () {
                          selectedValue = 1;
                        },
                      ),
                      title: const Text('កែវតូច'),
                      secondary: const Text('\$ 4.00'),
                    ),
                    RadioListTile(
                      activeColor: Colors.pink,
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
                      activeColor: Colors.pink,
                      value: 3,
                      groupValue: selectedValue,
                      onChanged: (value) => setState(
                        () {
                          selectedValue = 3;
                        },
                      ),
                      title: const Text('កែវធំ'),
                      secondary: const Text('\$ 5.00'),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Choice of Sugar Level',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('ជ្រើសរើសកម្រិតស្ករ'),
                    ),
                    RadioListTile(
                      activeColor: Colors.pink,
                      value: 4,
                      groupValue: selectedice,
                      onChanged: (value) => setState(
                        () {
                          selectedice = 4;
                        },
                      ),
                      title: const Text('ស្ករ ០%'),
                      secondary: const Text('+ \$ 0.00'),
                    ),
                    RadioListTile(
                      activeColor: Colors.pink,
                      value: 5,
                      groupValue: selectedice,
                      onChanged: (value) => setState(
                        () {
                          selectedice = 5;
                        },
                      ),
                      title: const Text('ស្ករ ៣០%'),
                      secondary: const Text('+ \$ 0.00'),
                    ),
                    RadioListTile(
                      activeColor: Colors.pink,
                      value: 6,
                      groupValue: selectedice,
                      onChanged: (value) => setState(
                        () {
                          selectedice = 6;
                        },
                      ),
                      title: const Text('ស្ករ ៥០%'),
                      secondary: const Text('+ \$ 0.00'),
                    ),
                    RadioListTile(
                      activeColor: Colors.pink,
                      value: 7,
                      groupValue: selectedice,
                      onChanged: (value) => setState(
                        () {
                          selectedice = 7;
                        },
                      ),
                      title: const Text('ស្ករ ៧០%'),
                      secondary: const Text('+ \$ 0.00'),
                    ),
                    RadioListTile(
                      activeColor: Colors.pink,
                      value: 9,
                      groupValue: selectedice,
                      onChanged: (value) => setState(
                        () {
                          selectedice = 9;
                        },
                      ),
                      title: const Text('ស្ករ ១០០%'),
                      secondary: const Text('+ \$ 0.00'),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Choice of Ice Level',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('ជ្រើសរើសកម្រិតទឹកកក'),
                    ),
                    RadioListTile(
                      activeColor: Colors.pink,
                      value: 4,
                      groupValue: selectedice,
                      onChanged: (value) => setState(
                        () {
                          selectedice = 4;
                        },
                      ),
                      title: const Text('អត់ទឹកកក'),
                      secondary: const Text('+ \$ 0.00'),
                    ),
                    RadioListTile(
                      activeColor: Colors.pink,
                      value: 5,
                      groupValue: selectedice,
                      onChanged: (value) => setState(
                        () {
                          selectedice = 5;
                        },
                      ),
                      title: const Text('ទឹកកកតិច'),
                      secondary: const Text('+ \$ 0.00'),
                    ),
                    RadioListTile(
                      activeColor: Colors.pink,
                      value: 6,
                      groupValue: selectedice,
                      onChanged: (value) => setState(
                        () {
                          selectedice = 6;
                        },
                      ),
                      title: const Text('ទឹកកកធម្មតា'),
                      secondary: const Text('+ \$ 0.00'),
                    ),
                    RadioListTile(
                      activeColor: Colors.pink,
                      value: 7,
                      groupValue: selectedice,
                      onChanged: (value) => setState(
                        () {
                          selectedice = 7;
                        },
                      ),
                      title: const Text('ទឹកកកច្រេីន'),
                      secondary: const Text('+ \$ 0.00'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
