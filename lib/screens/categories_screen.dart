import 'package:flutter/material.dart';
import 'package:food_menu/models/meal.dart';
import 'package:food_menu/models/category_model.dart';
import 'package:food_menu/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Categor> _categories;
  final List<Meal> meal;
  final Function toggleLike;
    final Function isFavourite;

  const CategoriesScreen(this._categories,this.meal,this.toggleLike,this.isFavourite,{super.key});

  @override
  Widget build(BuildContext context) {
    return _categories.isNotEmpty? GridView(
        padding: const EdgeInsets.only(top: 20,left: 10,right: 10,bottom: 10),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          ),
          children: _categories.map((category) {
            final categoryMeals = meal.where((meal)=> meal.categoryId == category.id).toList();
            return CategoryItem(category: category, meals: categoryMeals,toggleLike: toggleLike,isFavourite:isFavourite);
              })
          .toList()): const Center(
            child: Text('No categories yet',style: TextStyle(fontSize: 16),),);
  }
}

