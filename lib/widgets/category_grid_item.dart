import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';

class CategoryGridItem extends StatelessWidget{

const CategoryGridItem({super.key, required this.category, required this.categoryTapped});
final Category category;
final void Function() categoryTapped;

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        onTap: categoryTapped ,
         
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
      child: Container(
          padding :EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(colors: 
              [
                  category.color.withAlpha(160),
                  category.color.withAlpha(220)
              ],
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight
              )
          ),
          child: Text(category.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
          ),),
      ),
    );
  }

}