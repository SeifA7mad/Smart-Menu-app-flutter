import 'package:flutter/material.dart';
import 'package:smart_menu/entity/meal.dart';
import 'package:smart_menu/page/homePage/homeTab/showModalMeal.dart';

List dessertMeals = [
  Meal(
      7, 'Small Donuts',
      'When it comes to breakfast, most people are divided into two camps: oatmeal or donuts. But what if you want to have both? That\'s where our small donuts come in. These are perfect for the mornings when you want to feel like you\'re having breakfast for dinner. And because they\'re small, you can have more than one.',
      1.5,
      'img/7.png'),
  Meal(
      8, 'Chocolate Donuts',
      'Donuts have been a favorite breakfast, dessert, and snack for decades. Now you can have the delicious taste of a donut without the hassle of frying and dough with these delicious, gluten-free, and vegan chocolate donuts. This pack of six includes six mini donuts with a moist chocolate filling, topped with a light chocolate frosting.',
      2.0,
      'img/8.png'),
  Meal(
      9, 'Cream Donuts',
      'These donuts are perfect for any occasion, whether it be breakfast, dessert, or even a mid-afternoon snack. With their sweet vanilla cream center and light, crispy texture, these donuts are sure to please.',
      2.5,
      'img/9.png'),
];

class DessertMeals extends StatelessWidget {

  final Function addToCart;

  DessertMeals(this.addToCart);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 0; i < dessertMeals.length; i++)
          Card(
            child: ListTile(
              title: Text(dessertMeals[i].name),
              leading: Image.asset(dessertMeals[i].img),
              trailing: IconButton(icon: Icon(Icons.plus_one), onPressed: () {
                addToCart(dessertMeals[i]);
              },),
              subtitle: Row(children: [
                Text('${dessertMeals[i].description.substring(0, 15)}......'),
                IconButton(
                  onPressed: () {
                    showModalMeal(context, dessertMeals[i]);
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