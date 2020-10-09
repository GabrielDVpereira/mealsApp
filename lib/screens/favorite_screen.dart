import 'package:flutter/material.dart';
import 'package:refeicoesApp/components/meal_item.dart';
import 'package:refeicoesApp/models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;
  FavoriteScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    print(_favoriteMeals);
    return Center(
      child: ListView.builder(
        itemCount: _favoriteMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(_favoriteMeals[index]);
        },
      ),
    );
  }
}
