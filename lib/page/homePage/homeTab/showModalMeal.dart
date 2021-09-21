import 'package:flutter/material.dart';
import 'package:smart_menu/entity/meal.dart';

void showModalMeal(context, Meal m) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: Image.asset(
                  m.img,
                  height: 200,
                  width: 200,
                ),
              ),
              Text(
                '${m.name} ${m.price.toString()}\$',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  m.description,
                  style: TextStyle(fontSize: 15, letterSpacing: 1),
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        );
      });
}
