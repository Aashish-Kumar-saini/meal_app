
import 'package:flutter_riverpod/legacy.dart';
import 'package:meals_app/models/meal.dart';


class FavoriteMealNotifer extends StateNotifier<List<Meal>>{

  FavoriteMealNotifer():super([]);

  bool toggleFavoriteMealStatus(Meal meal){

    final isExist = state.contains(meal);

    if(isExist){
      state =  state.where((m)=> m.id != meal.id).toList();
      return false;
    }
    else{
      state = [...state , meal];
      return true;
    }

  }

}


final favoriteMealsProvider = StateNotifierProvider<FavoriteMealNotifer, List<Meal>>((ref){
  return FavoriteMealNotifer();
});

