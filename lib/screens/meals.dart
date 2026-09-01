import 'package:flutter/material.dart';
import 'package:meals_app/main.dart';
import 'package:meals_app/models/meal.dart';

class MealsScreen extends StatelessWidget{
  MealsScreen({super.key, required this.meals, required this.title});

final List<Meal> meals ;
final String title;

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Column(
        children: [
          Expanded(
            child: meals.isEmpty? Text("No meal available right now") : ListView.builder(itemCount: meals.length,itemBuilder: (context, index)=> Card(
              child: Row(
                children: [
                  Container(width: 20, decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)), child: Text( "${index +1}")),
                  SizedBox(width: 20,),
              
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(meals[index].title),
                      Text(meals[index].isVegan? "vegan": meals[index].isVegetarian? "Veg": "non-veg")
                    ],
                  )
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }

}