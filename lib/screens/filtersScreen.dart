import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/fliters_provider.dart';

class Filtersscreen extends ConsumerWidget {
  const Filtersscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Your Filters")),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilter[Filter.gulteanFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.gulteanFree, isChecked);
            },
            title: Text(
              'Gulten-free',
              style: Theme.of(context).textTheme.titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              "Only contains Gulten-free meals",
              style: Theme.of(context).textTheme.labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeThumbColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilter[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              "Only contains Lactose-free meals",
              style: Theme.of(context).textTheme.labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeThumbColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilter[Filter.vegitarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegitarian, isChecked);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              "Only contains Vegetarian meals",
              style: Theme.of(context).textTheme.labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeThumbColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilter[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              "Only contains Vegan meals",
              style: Theme.of(context).textTheme.labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeThumbColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
