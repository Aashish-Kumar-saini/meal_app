import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget{

const MealItemTrait({super.key, required this.icon, required this.label});

final String label;
final IconData icon;
@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size:  17,
        ),
        const SizedBox(width: 6),
        Text(label,style: TextStyle(color: Colors.white),)

      ],
    );
    
  }

}