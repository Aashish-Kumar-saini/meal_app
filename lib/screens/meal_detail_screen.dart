import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key, required this.meal, required this.onToggleFavorite});

  final Meal meal;
  final  void  Function(Meal meal) onToggleFavorite ;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(meal.title), actions: [IconButton(onPressed: (){onToggleFavorite(meal);}, icon: Icon(Icons.star))],),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: .cover,
            ),
            SizedBox(height: 10),
            Text(
              "Ingredients",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: .bold,
              ),
            ),
            SizedBox(height: 14),
            for (var ingredients in meal.ingredients)
              Text(
                ingredients,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              SizedBox(height: 44,),
        
              Text(
              "Steps",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: .bold,
              ),
            ),
            SizedBox(height: 14),
            for (var steps in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16 , horizontal:  10),
                child: Text(
                  steps,
                  textAlign: .center,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
