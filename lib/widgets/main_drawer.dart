import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
 const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String itendifier) onSelectScreen ;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: EdgeInsetsGeometry.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withAlpha(200),
                ],
                begin: .topLeft,
                end: .bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  color: Theme.of(context).colorScheme.primary,
                  size: 48,
                ),
                SizedBox(width: 20),
                Text(
                  "Cooking Up!",
                  style: Theme.of(context).textTheme.titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.restaurant, size: 26, color: Theme.of(context).colorScheme.onSurface,),
            title: Text("Meal", style: Theme.of(context).textTheme.titleSmall!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface, fontSize: 24)) ,
            onTap: () {
              onSelectScreen("meals");
            },
          ),
              ListTile(
            leading: Icon(Icons.settings, size: 26, color: Theme.of(context).colorScheme.onSurface,),
            title: Text("Filters", style: Theme.of(context).textTheme.titleSmall!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface, fontSize: 24)) ,
            onTap: () {
              onSelectScreen("filters");
            },
          )
        ],
      ),
    );
  }
}
