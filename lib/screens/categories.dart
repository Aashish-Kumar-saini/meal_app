import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category){
   final fillterMeal =  dummyMeals.where((meal)=> meal.categories.contains(category.id)).toList();
    Navigator.of(context).push(MaterialPageRoute( builder: (context)=> MealsScreen(meals: fillterMeal, title: category.title)));

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Category Screen"),),
      body:     GridView(
        padding: EdgeInsets.all(24),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
      ),
      children: [
        for(final category in availableCategories)
          CategoryGridItem(category: category, categoryTapped: ()=> _selectCategory(context, category))
        
      
      ],
    )
  ,

    );
    
    
 }
}
