class ExampleData {
  ExampleData._internal();

  static List<String> images = [
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
  ];

  static List<Category> data = [
    category1,
    category2,
    category3,
    category4,
    category5,
    category6,
    category7,
    category8,
  ];

  static Category category1 = Category(
    title: "ពេញនិយម",
    subtitle: "លក់ដាច់ជាងគេពេលនេះ",
    isHotSale: true,
    foods: List.generate(
      5,
      (index) {
        return Food(
          name: "Keemao Seafood Pasta",
          price: "5 \$",
          comparePrice: "\$10",
          imageUrl: images[index % images.length],
          isHotSale: false,
        );
      },
    ),
  );

  static Category category2 = Category(
    title: "Pasta Buy 1 Get 1",
    subtitle: "រហ័សទាន់ចិត្ត",
    isHotSale: false,
    foods: List.generate(
      3,
      (index) {
        return Food(
          name: "Shrimp Rose Pasta",
          price: "8 \$",
          comparePrice: "12 \$",
          imageUrl: images[index % images.length],
          isHotSale: index == 2 ? true : false,
        );
      },
    ),
  );

  static Category category3 = Category(
    title: "Pizza Buy 1 Get 1",
    subtitle: null,
    isHotSale: false,
    foods: List.generate(
      1,
      (index) {
        return Food(
          name: "Yummy Pork Cheesy Hotdog",
          price: "10 \$",
          comparePrice: "20 \$",
          imageUrl: images[index % images.length],
          isHotSale: false,
        );
      },
    ),
  );

  static Category category4 = Category(
    title: "Appetizer",
    subtitle: "附附餐一份，可烹煮為鍋邊素，若有需要請備著告知",
    isHotSale: false,
    foods: List.generate(
      5,
      (index) {
        return Food(
          name: "ដំឡូងបារាំងបំពង",
          price: "2 \$",
          comparePrice: "3.5\$",
          imageUrl: images[index % images.length],
          isHotSale: index == 3 ? true : false,
        );
      },
    ),
  );
  static Category category5 = Category(
    title: "Chicken",
    subtitle: "",
    isHotSale: false,
    foods: List.generate(
      5,
      (index) {
        return Food(
          name: "Chicken Grill Wing",
          price: "6 \$",
          comparePrice: "4 \$",
          imageUrl: images[index % images.length],
          isHotSale: index == 3 ? true : false,
        );
      },
    ),
  );
  static Category category6 = Category(
    title: "Meat",
    subtitle: "",
    isHotSale: false,
    foods: List.generate(
      5,
      (index) {
        return Food(
          name: "Chicken grill Pepper",
          price: "12 \$",
          comparePrice: "16 \$",
          imageUrl: images[index % images.length],
          isHotSale: index == 3 ? true : false,
        );
      },
    ),
  );
  static Category category7 = Category(
    title: "Rice",
    subtitle: "",
    isHotSale: false,
    foods: List.generate(
      5,
      (index) {
        return Food(
          name: "Rice with Chicken Grill ",
          price: "3 \$",
          comparePrice: "7 \$",
          imageUrl: images[index % images.length],
          isHotSale: index == 3 ? true : false,
        );
      },
    ),
  );
  static Category category8 = Category(
    title: "Beverage",
    subtitle: "附附餐一份，可烹煮為鍋邊素，若有需要請備著告知",
    isHotSale: false,
    foods: List.generate(
      5,
      (index) {
        return Food(
          name: "728. 連庭素食鍋",
          price: "240",
          comparePrice: "\$300",
          imageUrl: images[index % images.length],
          isHotSale: index == 3 ? true : false,
        );
      },
    ),
  );
}

class Category {
  String title;
  String? subtitle;
  List<Food> foods;
  bool isHotSale;

  Category({
    required this.title,
    required this.subtitle,
    required this.foods,
    required this.isHotSale,
  });
}

class Food {
  String name;
  String price;
  String comparePrice;
  String imageUrl;
  bool isHotSale;

  Food({
    required this.name,
    required this.price,
    required this.comparePrice,
    required this.imageUrl,
    required this.isHotSale,
  });
}
