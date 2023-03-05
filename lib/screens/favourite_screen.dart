import 'package:flutter/material.dart';
import 'package:food_menu/models/meal.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_menu/screens/meal_detail_screen.dart';

class FavouriteScreen extends StatefulWidget {

  final Meals mealsmodel;
   const FavouriteScreen(
  this.mealsmodel, {super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
   
   void _toggleLike(String mealId){
      setState(() {
        widget.mealsmodel.toggleLike(mealId);
      });
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(content:const Text('Really?'),action: SnackBarAction(label: 'Cancel', onPressed: (){
        setState(() {
        widget.mealsmodel.toggleLike(mealId);
      });
      }),));
  }

  bool _isFavourite(String mealId){
     return widget.mealsmodel.favourite.any((element) => element.id == mealId);  
     }

  

  @override
  Widget build(BuildContext context) {
    return   widget.mealsmodel.favourite.isNotEmpty? ListView.builder(
        itemCount: widget.mealsmodel.favourite.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MealDetailScreen(widget.mealsmodel.favourite[index]),));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 13),
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
                        child: widget.mealsmodel.favourite[index].imgUrls[0].startsWith('assets/')? Image.asset(widget.mealsmodel.favourite[index].imgUrls[0],fit:BoxFit.cover)
                        :Image.network(widget.mealsmodel.favourite[index].imgUrls[0],fit:BoxFit.cover)
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
                          child: Text(widget.mealsmodel.favourite[index].title,style: 
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
                            setState(() {
                              _toggleLike(widget.mealsmodel.favourite[index].id);
                            });
                          }, 
                          icon:  Icon(
                          _isFavourite(widget.mealsmodel.favourite[index].id)? Icons.favorite_outlined:Icons.favorite_outline,
                            color: Colors.black54,),
                          ),
                           Text(widget.mealsmodel.favourite[index].preparationtime.toString()),
                           Text('${widget.mealsmodel.favourite[index].price} \$'),
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
      );
  }
}