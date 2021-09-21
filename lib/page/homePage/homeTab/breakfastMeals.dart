import 'package:flutter/material.dart';
import 'package:smart_menu/entity/meal.dart';
import 'package:smart_menu/page/homePage/homeTab/showModalMeal.dart';

List breakfastMeals = [
  Meal(
      1, 'Pancakes',
      'No matter what your schedule, you can enjoy pancakes with Pancakes. Pancakes are pancakes made in a pan, without the need for any mix. It’s easy to make these pancakes by adding all the ingredients to a pan and cooking until done. With only four ingredients, you can make any flavor you want. You can also make it your own by adding things like chocolate chips, blueberries, or strawberries.',
      4.5,
      'img/1.png'),
  Meal(
      2, 'Omelette',
      'There\'s nothing like a homemade omelette to start your day off right. This is a simple recipe that can be whipped up in just a few minutes, with just a few ingredients. It\'s made by combining eggs, cheese, and vegetables to create a simple dish that\'s both nutritious and delicious. Once you\'ve mastered the recipe, you can experiment with different combinations to suit your tastes.',
      5.0,
      'img/2.png'),
  Meal(
      3, 'Burger',
      '3 Crispy breakfast burger patty, egg, bacon, and cheese. A breakfast burger with a crunch.',
      7.0,
      'img/3.png'),
];

class BreakfastMeals extends StatelessWidget {

  final Function addToCart;
  BreakfastMeals(this.addToCart);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (int i = 0; i < breakfastMeals.length; i++)
          Card(
            child: ListTile(
              title: Text(breakfastMeals[i].name),
              leading: Image.asset(breakfastMeals[i].img),
              trailing: IconButton(icon: Icon(Icons.plus_one), onPressed: () {
                addToCart(breakfastMeals[i]);
              },),
              subtitle: Row(children: [
                Text('${breakfastMeals[i].description.substring(0,15)}......'),
                IconButton(onPressed: () {
                  showModalMeal(context, breakfastMeals[i]);
                }, icon: Icon(Icons.arrow_drop_down), iconSize: 17,)
              ],),
            ),
          )
      ],
    );
  }
}