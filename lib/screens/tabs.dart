import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filtersScreen.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/main_drawer.dart';

const kInitialFilters =  {
    Filter.gulteanFree : false,
    Filter.lactoseFree : false,
    Filter.vegan : false,
    Filter.vegitarian : false
  };

class TabsScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  final List<Meal> _favoriteMeal = [];
  Map<Filter,bool> selectedFilter = {
    Filter.gulteanFree : false,
    Filter.lactoseFree : false,
    Filter.vegan : false,
    Filter.vegitarian : false
  };
  void _snackBarMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleFavoriteMeal(Meal meal) {
    var isExisting = _favoriteMeal.contains(meal);

    if (isExisting) {
      setState(() {
        _favoriteMeal.remove(meal);
      });
      _snackBarMessage("Meal removed from the Favorites");
    } else {
      setState(() {
        _favoriteMeal.add(meal);
      });
      _snackBarMessage("Meal added to Favorites");
    }
  }

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _setScreen(String screen) async {
    Navigator.of(context).pop();
    if (screen == "filters") {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) =>  Filtersscreen(currentFilter: selectedFilter)),
      );
      setState(() {
        selectedFilter = result ?? kInitialFilters ;
      });
   
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeal = dummyMeals.where((meals){
      if(selectedFilter[Filter.gulteanFree]! && !meals.isGlutenFree){
        return false;
      }
      if(selectedFilter[Filter.lactoseFree]! && !meals.isLactoseFree){
        return false;
      }
      if(selectedFilter[Filter.vegan]! && !meals.isVegan){
        return false;
      }
      if(selectedFilter[Filter.vegitarian]! && !meals.isVegetarian){
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(onToggleFavorite: _toggleFavoriteMeal, availableMeals: availableMeal,);
    String activePageTitle = 'Categories';
    if (_selectedIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeal,
        onToggleFavorite: _toggleFavoriteMeal,
      );
      activePageTitle = "Your Favorites";
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          _selectedPage(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favourites"),
        ],
      ),
    );
  }
}
