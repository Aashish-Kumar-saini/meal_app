import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/meals.dart';

class TabsScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

int _selectedIndex = 0;
final List<Meal> _favoriteMeal = [];

void _snackBarMessage(String message){

 ScaffoldMessenger.of(context).clearSnackBars();
 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),));

}

void _toggleFavoriteMeal(Meal meal){

var isExisting = _favoriteMeal.contains(meal);

if(isExisting){
  setState(() {
      _favoriteMeal.remove(meal);
  });
  _snackBarMessage("Meal removed from the Favorites");

}
else{
  setState(() {
      _favoriteMeal.add(meal);
  });
_snackBarMessage("Meal added to Favorites");
}

}

void _selectedPage(int index){
  setState(() {
    _selectedIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {
  Widget  activePage = CategoriesScreen(onToggleFavorite: _toggleFavoriteMeal,);
  String activePageTitle = 'Categories';

  if(_selectedIndex == 1){
    activePage = MealsScreen(meals: _favoriteMeal, onToggleFavorite: _toggleFavoriteMeal,);
    activePageTitle = "Your Favorites";
  } 

    return  Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index){
          _selectedPage(index);
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.category), label: "Category"),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites")
      ]),
    );
  }
}