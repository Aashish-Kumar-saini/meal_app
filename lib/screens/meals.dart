import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget{
  const MealsScreen({super.key, required this.meals, required this.title});

final List<Meal> meals ;
final String title;

@override
  Widget build(BuildContext context) {

    Widget content =   ListView.builder(itemCount: meals.length,itemBuilder: (context, index)=>MealItems(meal: meals[index]));
    
    
    //  Card(
    //     child: Row(
    //       children: [
    //         Container(width: 20, decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)), child: Text( "${index +1}")),
    //         SizedBox(width: 20,),
        
    //         Column(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             Text(meals[index].title, style:Theme.of(context).textTheme.bodyLarge!.copyWith(
    //               color: Theme.of(context).colorScheme.onSurface
    //           ) ,),
    //             Text(meals[index].isVegan? "vegan": meals[index].isVegetarian? "Veg": "non-veg", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
    //               color: Theme.of(context).colorScheme.onSurface
    //           ),)
    //           ],
    //         )
    //       ],
    //     ),
    //   ));

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
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: content
    );
  }

}