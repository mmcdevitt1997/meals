import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _toggleMealFavoritesStatus(Meal meal){
    final isExisting = _favoriteMeals.contains(meal);

    if(isExisting){
      setState(() {
        _favoriteMeals.remove(meal);
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleMealFavoritesStatus);
    var activePageTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      activePage =  MealsScreen(meals: [], onToggleFavorite: _toggleMealFavoritesStatus);
      activePageTitle = 'Favorites';
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(activePageTitle),
        ),
        body: activePage,
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
        ));
  }
}
