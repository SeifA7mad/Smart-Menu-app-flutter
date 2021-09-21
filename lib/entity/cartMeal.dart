import 'package:smart_menu/entity/meal.dart';

class CartMeal extends Meal {
  int amount = 0;
  CartMeal(id, name, description, price, img, this.amount) : super(id, name, description, price, img);
}