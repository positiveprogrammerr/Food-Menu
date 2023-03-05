import 'package:flutter/material.dart';
import 'package:food_menu/models/meal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_menu/screens/tabs_screen.dart';
import 'package:food_menu/models/category_model.dart';
import 'package:food_menu/screens/add_new_screen.dart';
import 'package:food_menu/screens/products_screen.dart';
import 'package:food_menu/screens/categories_screen.dart';
import 'package:food_menu/screens/category_meals_screen.dart';


void main() {
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    final _categoryModel = Categories();

    final _mealsModel = Meals();

   void _toggleLike(String mealId){
      setState(() {
        _mealsModel.toggleLike(mealId);
      });
  }

  bool _isFavourite(String mealId){
     return _mealsModel.favourite.any((element) => element.id == mealId);  
     }
    
      void _addNewMeal(Meal meal){
        _mealsModel.addNewMeal(meal);
      }

    void _removeMeal(String id){
_mealsModel.removeMeal(id);
      }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
    debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        fontFamily: GoogleFonts.poppins().fontFamily
      ),
      initialRoute: '/',
      routes: {
        '/':(context) => TabsScreen(categoryList: _categoryModel.lists, mealList: _mealsModel.mealList,toggleLike:_toggleLike,isFavourite: _isFavourite,mealsModel:_mealsModel),
        '/category-screen':(context) => CategoriesScreen(_categoryModel.lists, _mealsModel.mealList,_toggleLike,_isFavourite),
        '/category-meals':(context) =>  const CategoryMealsScreen(),
        '/products':(context) =>  ProductsScreen(_mealsModel.mealList,_removeMeal),
        'add-new-product':(context) =>  AddNewProductScreen(_categoryModel.lists,_addNewMeal),
      },
    );
  }
}

