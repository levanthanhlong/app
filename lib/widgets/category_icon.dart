import 'package:app/model/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  final Category category;

  const CategoryIcon({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(color: Colors.grey[600]!, blurStyle: BlurStyle.outer)
            ], color: Colors.white, shape: BoxShape.circle),
            child: Center(child: Icon(category.categoryIcon)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            textAlign: TextAlign.center,
            category.categoryTitle,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
