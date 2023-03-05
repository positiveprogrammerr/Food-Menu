import 'package:flutter/material.dart';
import 'package:food_menu/models/meal.dart';
import 'package:food_menu/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  final Categor category;
  final List<Meal> meals;
  final Function toggleLike;
    final Function isFavourite;
   const CategoryItem({
    Key? key,
  required this.category,
  required this.meals,required this.toggleLike,required this.isFavourite,
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      Navigator.of(context).pushNamed('/category-meals',arguments:{
        'categoryTitle':category.title,
        'categorymeals': meals,
        'toggle': toggleLike,
        'isfavo':isFavourite,
      });
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(category.imageUrl,
              fit: BoxFit.cover,
              ),
            ),
            Container(color: Colors.black.withOpacity(0.4),),
             Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(category.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800
              ),),
            )
          ],
        ),
      ),
    );
  }
}