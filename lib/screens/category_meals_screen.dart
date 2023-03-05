import 'package:flutter/material.dart';
import 'package:food_menu/models/meal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_menu/screens/meal_detail_screen.dart';

class CategoryMealsScreen extends StatefulWidget {
  const CategoryMealsScreen({super.key});


  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
 

  @override
  Widget build(BuildContext context) {
    final categoryData = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    final title  = categoryData['categoryTitle'];
    final meals = categoryData['categorymeals'] as List<Meal>;
    final toggleLike = categoryData['toggle'];
    final isFavourite = categoryData['isfavo'];

    return Scaffold(
      appBar: AppBar(
        title:  Text(title),
      ),
      body: meals.isNotEmpty? ListView.builder(
        itemCount: meals.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MealDetailScreen(meals[index]),));
          },
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Material(
              borderRadius: BorderRadius.circular(25),
              elevation: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 250,
                        child: meals[index].imgUrls[0].startsWith('assets/')? Image.asset(meals[index].imgUrls[0],fit: BoxFit.cover)
                        :Image.network(meals[index].imgUrls[0],fit: BoxFit.cover),
                        ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.bottomRight,
                          padding: const EdgeInsets.all(10),
                          width: 150,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20))
                          ),
                          child: Text(meals[index].title,style: 
                          const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800
                            ),
                            ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: (){
                             setState(() {});
                             toggleLike(meals[index].id);
                           },
                          icon: Icon(
                        isFavourite( meals[index].id)
                        ?  Icons.favorite_outlined
                        : Icons.favorite_outline,
                            color: Colors.black54,),
                          ),
                           Text(meals[index].preparationtime.toString()),
                           Text('${meals[index].price} \$'),
                      ],
                    ),
                  )
                ],
              ),
            ),
                ),
          ),
        ),): Center(
        child: Text('There is no foods yet',style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        fontFamily: GoogleFonts.poppins().fontFamily),),
      )
    );
  }
}