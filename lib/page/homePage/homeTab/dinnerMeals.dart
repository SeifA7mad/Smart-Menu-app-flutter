import 'package:flutter/material.dart';
import 'package:smart_menu/entity/meal.dart';
import 'package:smart_menu/page/homePage/homeTab/showModalMeal.dart';

List dinnerMeals = [
  Meal(
      4, 'Spaghetti',
      'Spaghetti is a great Italian dish, typically served with a tomato sauce and some form of meat. The traditional way to eat spaghetti is to use a spoon to twirl the noodles on the plate and then dip them into the sauce. Spaghetti is a simple dish that\'s perfect for a weeknight dinner or as a side dish to some meatballs.',
      11.4,
      'img/4.png'),
  Meal(
      5, 'Meat Burger',
      'Delicious meat burger with a 100% natural beef patty, grilled onions, lettuce, tomato, and a tangy BBQ sauce. Some days you just need a burger. One that is delicious, made with 100% natural beef, and has all the toppings you crave. This is the burger for you.',
      10.0,
      'img/5.png'),
  Meal(
      6, 'Pizza',
      'Creamy white pizza sauce, with sausage, pepperoni, and black olives. Pizza is a savory dish of Italian origin, typically made with a thin, round crust topped with tomato sauce and cheese.',
      7.0,
      'img/6.png'),
];

class DinnerMeals extends StatelessWidget {

  final Function addToCart;

  DinnerMeals(this.addToCart);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 0; i < dinnerMeals.length; i++)
          Card(
            child: ListTile(
              title: Text(dinnerMeals[i].name),
              leading: Image.asset(dinnerMeals[i].img),
              trailing: IconButton(icon: Icon(Icons.plus_one), onPressed: () {
                addToCart(dinnerMeals[i]);
              },),
              subtitle: Row(children: [
                Text('${dinnerMeals[i].description.substring(0, 15)}......'),
                IconButton(
                  onPressed: () {
                    showModalMeal(context, dinnerMeals[i]);
                  },
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 17,)
              ],),
            ),
          )
      ],
    );
  }
}