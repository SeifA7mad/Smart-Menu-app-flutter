import 'package:flutter/material.dart';
import 'package:smart_menu/entity/cartMeal.dart';
import 'package:smart_menu/entity/meal.dart';
import 'package:smart_menu/page/cartPage/cart.dart';
import 'package:smart_menu/page/homePage/homeTab/breakfastMeals.dart';
import 'package:smart_menu/page/homePage/homeTab/dessertMeals.dart';
import 'package:smart_menu/page/homePage/homeTab/dinnerMeals.dart';
import 'package:smart_menu/page/homePage/homeTab/drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int inCartItemsNumber = 0;
  List cartItems = [];
  double totalPrice = 0.0;

  double addItemToCart(Meal m) {
    bool itemNotFound = true;
    setState(() {
      if (cartItems.isEmpty) {
        cartItems.add(CartMeal(m.id, m.name, m.description, m.price, m.img, 1));
      } else {
        for (int i = 0; i < cartItems.length; i++) {
          if (cartItems[i].id == m.id) {
            cartItems[i].amount++;
            itemNotFound = false;
            break;
          }
        }
        if (itemNotFound) {
          cartItems
              .add(CartMeal(m.id, m.name, m.description, m.price, m.img, 1));
        }
      }
      inCartItemsNumber++;
      totalPrice += m.price;
    });
    return totalPrice;
  }

  double removeItemFromCart(int id) {
    setState(() {
      for (int i = 0; i < cartItems.length; i++) {
        if (cartItems[i].id == id) {
          double priceDetect = cartItems[i].price;
          if (cartItems[i].amount == 1) {
            cartItems.removeAt(i);
          } else {
            cartItems[i].amount--;
          }
          totalPrice -= priceDetect;
          break;
        }
      }
      inCartItemsNumber--;
    });
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: new IconThemeData(color: Colors.white70),
            actionsIconTheme: new IconThemeData(color: Colors.white70),
            leadingWidth: 30,
            title: Text('Smart Menu',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Railway',
                    color: Colors.white70,
                    fontWeight: FontWeight.bold)),
            actions: [
              IconButton(
                  onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => Cart(cartItems,
                                addItemToCart, removeItemFromCart, totalPrice)))
                      },
                  icon: Icon(Icons.shopping_cart)),
              CircleAvatar(
                child: Text(
                  inCartItemsNumber.toString(),
                  style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.w900),
                ),
                radius: 15,
                backgroundColor: Colors.white70
              ),
              IconButton(onPressed: () => {}, icon: Icon(Icons.settings))
            ],
            bottom: TabBar(
              isScrollable: true,
              labelColor: Colors.limeAccent,
              tabs: [
                Tab(
                    icon: Icon(Icons.breakfast_dining),
                    text: 'Breakfast Meals'),
                Tab(icon: Icon(Icons.dinner_dining), text: 'Dinner Meals'),
                Tab(icon: Icon(Icons.emoji_food_beverage), text: 'Desserts'),
                // Tab(icon: Icon(Icons.lunch_dining), text: 'Lunch Meals'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              BreakfastMeals(addItemToCart),
              DinnerMeals(addItemToCart),
              DessertMeals(addItemToCart)
            ],
          ),
          drawer: buildDrawer()
        ));
  }
}
