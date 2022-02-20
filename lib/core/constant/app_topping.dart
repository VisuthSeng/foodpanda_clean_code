import 'package:foodpanda_clean_code/data/model/topping_model.dart';

class AppToppingSize {
  const AppToppingSize();
  static List<ToppingModel> appToppingSize = [
    ToppingModel(title: 'កែវតូច', secondary: '\$ 4.00'),
    ToppingModel(title: 'កែវកណ្តាល', secondary: '\$ 4.50'),
    ToppingModel(title: 'កែវធំ', secondary: '\$ 5.00'),
  ];
}

class AppToppingSugar {
  const AppToppingSugar();
  static List<ToppingModel> appToppingSugar = [
    ToppingModel(title: 'ស្ករ ០%', secondary: '+ \$ 0.00'),
    ToppingModel(title: 'ស្ករ ៣០%', secondary: '+ \$ 0.00'),
    ToppingModel(title: 'ស្ករ ៥០%', secondary: '+ \$ 0.00'),
    ToppingModel(title: 'ស្ករ ៧០%', secondary: '+ \$ 0.00'),
    ToppingModel(title: 'ស្ករ ១០០%', secondary: '+ \$ 0.00'),
  ];
}

class AppToppingIce {
  const AppToppingIce();
  static List<ToppingModel> appToppingIce = [
    ToppingModel(title: 'អត់ទឹកកក', secondary: '+ \$ 0.00'),
    ToppingModel(title: 'ទឹកកកតិច', secondary: '+ \$ 0.00'),
    ToppingModel(title: 'ទឹកកកធម្មតា', secondary: '+ \$ 0.00'),
    ToppingModel(title: 'ទឹកកកច្រើន', secondary: '+ \$ 0.00'),
  ];
}
