import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:meals_app/providers/meals_provider.dart';

enum Filter { gulteanFree, lactoseFree, vegitarian, vegan }

class FilterNotifer extends StateNotifier<Map<Filter, bool>> {
  FilterNotifer()
    : super({
        Filter.gulteanFree: false,
        Filter.lactoseFree: false,
        Filter.vegan: false,
        Filter.vegitarian: false,
      });

      void setFilter(Filter filter, bool isActive){
        state = {...state , filter : isActive};
      }
      void setMultipleFileter(Map<Filter,bool> activeFilters){
        state = activeFilters ;
      }
}

final filterProvider = StateNotifierProvider<FilterNotifer, Map<Filter, bool>>((ref) {
  return FilterNotifer();
});

final favoriteMealProvider = Provider((ref){
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filterProvider);

  return meals.where((meals){
      if(activeFilters[Filter.gulteanFree]! && !meals.isGlutenFree){
        return false;
      }
      if(activeFilters[Filter.lactoseFree]! && !meals.isLactoseFree){
        return false;
      }
      if(activeFilters[Filter.vegan]! && !meals.isVegan){
        return false;
      }
      if(activeFilters[Filter.vegitarian]! && !meals.isVegetarian){
        return false;
      }
      return true;
    }).toList();
});