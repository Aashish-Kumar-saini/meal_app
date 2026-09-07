import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:transparent_image/transparent_image.dart';

class MealDetailScreen extends StatelessWidget{
const MealDetailScreen({super.key, required this.meal});

final Meal meal;

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(meal.title),),
      body: Column(children: [
        FadeInImage(placeholder: MemoryImage(kTransparentImage), image: NetworkImage(meal.imageUrl),
        height: 200,width: double.infinity,
        fit: .cover,)
      ],),
    );
  }

}