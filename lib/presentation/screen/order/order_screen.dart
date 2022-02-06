// // ignore_for_file: avoid_print

// import 'package:flutter/material.dart';
// import 'package:foodpanda_clean_code/data/datasource/api.dart';
// import 'package:vertical_tab_bar_view/vertical_tab_bar_view.dart';

// class OrderScreen extends StatefulWidget {
//   const OrderScreen({Key? key}) : super(key: key);

//   @override
//   State<OrderScreen> createState() => _OrderScreenState();
// }

// class _OrderScreenState extends State<OrderScreen>
//     with SingleTickerProviderStateMixin {
//   final Api api = Api();
//   List<Category> categories = [];

//   TabController? _tabController;

//   fetchAllCategories() {
//     // _tabController?.dispose();
//     api.getCategories().then((value) {
//       setState(() {
//         categories.addAll(value);
//         _tabController = TabController(length: value.length, vsync: this);
//       });
//     });
//   }

//   @override
//   void initState() {
//     fetchAllCategories();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _tabController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           const SliverAppBar(
//             expandedHeight: 150,
//             floating: true,
//             pinned: true,
//             snap: true,
//             centerTitle: true,
//             title: Text(""),
//             flexibleSpace: PreferredSize(
//               preferredSize: Size.fromHeight(100),
//               child: Image(
//                 image: AssetImage("assets/promotion1.png"),
//                 fit: BoxFit.fill,
//               ),
//             ),

//           ),
//           SliverList(
//             delegate: SliverChildListDelegate(
//               [
//                 SizedBox(
//                   width: 200,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "សាច់អាំងរស់ជាតិបែបចិន(សាខាទី៤)",
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         Row(
//                           children: const [
//                             Text(
//                               "1.9km away | ",
//                               style: TextStyle(fontSize: 12),
//                             ),
//                             Icon(
//                               Icons.star,
//                               color: Colors.pink,
//                               size: 20,
//                             ),
//                             Icon(
//                               Icons.star,
//                               color: Colors.pink,
//                               size: 20,
//                             ),
//                             Icon(
//                               Icons.star,
//                               color: Colors.pink,
//                               size: 20,
//                             ),
//                             Icon(
//                               Icons.star,
//                               color: Colors.pink,
//                               size: 20,
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(left: 10),
//                               child: Text(
//                                 "+100 ratings",
//                                 style: TextStyle(fontSize: 12),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(left: 70),
//                               child: Text(
//                                 "More info",
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.pink,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 7,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(4),
//                           child: Row(
//                             children: const [
//                               Icon(
//                                 Icons.alarm_outlined,
//                                 color: Colors.pink,
//                                 size: 19,
//                               ),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                               Text(
//                                 "ដឹកជញ្ជូន 20 នាទី",
//                                 style: TextStyle(fontSize: 12),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Divider(
//                           height: 1,
//                           thickness: 1,
//                           color: Colors.grey[400],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: double.infinity,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 20),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text("ការកម្ម៉ង់ថ្មីៗនេះ"),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 160, top: 10),
//                           child: Container(
//                             height: 100,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.grey.withOpacity(0.5),
//                                   spreadRadius: 5,
//                                   blurRadius: 7,
//                                   offset: const Offset(0, 3),
//                                 ),
//                               ],
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Row(
//                                     children: const [
//                                       Text(
//                                         "ត្រកួនអាំង",
//                                         style: TextStyle(fontSize: 14),
//                                       ),
//                                       Padding(
//                                         padding: EdgeInsets.only(left: 90),
//                                         child: Text(
//                                           "\$ 4.75",
//                                           style: TextStyle(fontSize: 12),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.only(left: 10),
//                                   child: Text(
//                                     '+3 ទំនិញច្រើនជាងនេះ',
//                                     style: TextStyle(
//                                         fontSize: 12, color: Colors.grey[400]),
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 10, top: 10),
//                                       child: Text(
//                                         'ថ្ងែអាទិត្យ，ខែធ្នូ 12',
//                                         style: TextStyle(
//                                             fontSize: 12,
//                                             color: Colors.grey[400]),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 50, top: 10),
//                                       child: Container(
//                                         height: 30,
//                                         width: 50,
//                                         decoration: const ShapeDecoration(
//                                             shape: CircleBorder(),
//                                             color: Colors.pink),
//                                         child: IconButton(
//                                           onPressed: () {
//                                             print("Add to Menu");
//                                           },
//                                           icon: const Icon(
//                                             Icons.add,
//                                             size: 15,
//                                             color: Colors.white,
//                                           ),
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 5,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class TabView extends StatefulWidget {
//   const TabView({
//     Key? key,
//     required this.category,
//   }) : super(key: key);

//   final Category category;

//   @override
//   _TabViewState createState() => _TabViewState();
// }

// class _TabViewState extends State<TabView> {
//   final Api api = Api();
//   final List<Product> _products = [];

//   fetchProducts(String category) {
//     api.getProductsByCategory(category).then((value) {
//       setState(() {
//         _products.addAll(value);
//       });
//     });
//   }

//   @override
//   void initState() {
//     fetchProducts(widget.category.name);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Align(
//             alignment: Alignment.topLeft,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 widget.category.name,
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 36,
//                 ),
//               ),
//             ),
//           ),
//           for (Product product in _products)
//             ListTile(
//               title: Text(product.name),
//               subtitle: Text(product.category),
//               onTap: () {},
//             ),
//           // for (int i = 0; i < 20; i++)
//           //   ListTile(
//           //     title: Text('Product title $i'),
//           //   )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:foodpanda_clean_code/data/datasource/example_data.dart';
import 'package:foodpanda_clean_code/presentation/screen/order/category_section.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  final List<Category> data = ExampleData.data;

  // TabController More Information => https://api.flutter.dev/flutter/material/TabController-class.html
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: data.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: VerticalScrollableTabView(
        tabController: tabController,
        listItemData: data,
        verticalScrollPosition: VerticalScrollPosition.begin,
        eachItemChild: (object, index) =>
            CategorySection(category: object as Category),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: const FlexibleSpaceBar(
              title: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Pasta Corner (PTT North Bridge",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              titlePadding: EdgeInsets.only(bottom: 50),
              collapseMode: CollapseMode.pin,
              background: Image(
                image: AssetImage("assets/pizza_type.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            bottom: TabBar(
              isScrollable: true,
              controller: tabController,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              indicatorColor: Colors.pink,
              labelColor: Colors.pinkAccent,
              unselectedLabelColor: Colors.black,
              indicatorWeight: 3.0,
              tabs: data.map((e) {
                return Tab(text: e.title);
              }).toList(),
              onTap: (index) {
                VerticalScrollableTabBarStatus.setIndex(index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
