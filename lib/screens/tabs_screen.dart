import 'package:flutter/material.dart';
import 'categories_screen.dart';
import 'favorite_screen.dart';
import '../components/main_drawer.dart';
import '../models/meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabScreen(this.favoriteMeals);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedSCreenIndex = 0;
  List<Meal> favoriteMeals;
  List<Map<String, Object>> _screens;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _screens = [
      {"title": "Lista de categorias", "screen": CategoriesScreen()},
      {
        "title": "Meus favoritos",
        "screen": FavoriteScreen(widget.favoriteMeals)
      }
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedSCreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedSCreenIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedSCreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedSCreenIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categorias'),
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favoritos'),
            ),
          ]),
    );
  }
}
