import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/favorites_provider.dart';
import 'package:meals_app/providers/fliters_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  const MealDetailScreen({super.key, required this.meal});

  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteMeals = ref.watch(favoriteMealsProvider);

    final isFavorite = favoriteMeals.contains(meal);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final isAdded = ref
                  .read(favoriteMealsProvider.notifier)
                  .toggleFavoriteMealStatus(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isAdded
                        ? 'Meal added to favorites'
                        : 'Meal removed from favorites',
                  ),
                ),
              );
            },
            icon: AnimatedSwitcher(
              duration: Duration(milliseconds: 800),
              transitionBuilder: (child, animation) {
                return RotationTransition(
                  turns: Tween(begin: 0.5, end: 1.0).animate(animation),

                  child: child,
                );
              },
              child: Icon(
                isFavorite ? Icons.star : Icons.star_border_outlined,
                key: ValueKey(isFavorite),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }

                    return Container(
                      color: Colors.grey.shade300.withAlpha(100),
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white70,
                          ),
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade300.withAlpha(100),
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          color: Colors.white.withAlpha(190),
                          size: 40,
                        ),
                      ),
                    );
                  },
                ),
              ),
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
                style: Theme.of(context).textTheme.bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
            SizedBox(height: 44),

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
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 10,
                ),
                child: Text(
                  steps,
                  textAlign: .center,
                  style: Theme.of(context).textTheme.bodyMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
