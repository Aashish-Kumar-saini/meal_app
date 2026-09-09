import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/fliters_provider.dart';
import 'package:meals_app/providers/meals_provider.dart';
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

class TabsScreen extends ConsumerStatefulWidget {
  const new({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedIndex = 0;

  void _selectedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _setScreen(String screen) async {
    Navigator.of(context).pop();
    if (screen == "filters") {
    Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(builder: (ctx) =>  Filtersscreen()),
      );
   
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeal = ref.watch(favoriteMealProvider);

    Widget activePage = CategoriesScreen( availableMeals: availableMeal,);
    String activePageTitle = 'Categories';
    var favoritMeal = ref.watch(favoriteMealsProvider);
    if (_selectedIndex == 1) {
      activePage = MealsScreen(
        meals: favoritMeal,
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
