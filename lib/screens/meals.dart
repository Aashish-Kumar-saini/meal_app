import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_detail_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget{
  const MealsScreen({super.key, required this.meals,  this.title, required this.onToggleFavorite});

final List<Meal> meals ;
final String? title;
final void Function(Meal meal) onToggleFavorite;
void onSelectMeal(BuildContext contx, Meal meal){

  Navigator.of(contx).push(MaterialPageRoute(builder: (context)=> MealDetailScreen(meal: meal, onToggleFavorite: onToggleFavorite,)));
}

@override
  Widget build(BuildContext context) {

    Widget content =   ListView.builder(itemCount: meals.length,itemBuilder: (context, index)=>MealItems(meal: meals[index], onSelectMeal:(){
 onSelectMeal(context, meals[index]);
    } ,));
    

      if(meals.isEmpty){

        content = Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Uh oh ... Nothing here", style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color:  Colors.white
              ),),
              SizedBox(height: 16,),
              Text("Try selecting a different category", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
              ))
            ],
          ),
        );

      }

      if(title == null){
        return content;
      }
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(title!),),
      body: content
    );
  }

}