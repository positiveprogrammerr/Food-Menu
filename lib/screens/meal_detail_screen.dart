import 'package:flutter/material.dart';
import 'package:food_menu/models/meal.dart';
import 'package:carousel_slider/carousel_slider.dart';


class MealDetailScreen extends StatefulWidget {
  final Meal meal;
  const MealDetailScreen(this.meal, {super.key});

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  int activeImageIndex = 0 ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.meal.title),
            ),
             body: SingleChildScrollView(
              child: Column(
                children: [
                  widget.meal.imgUrls.length>1?  CarouselSlider(
          options: CarouselOptions(
            initialPage: activeImageIndex,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                activeImageIndex = index;
              });
            },
            height: 300.0),
          items: widget.meal.imgUrls.map((image) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  width: MediaQuery.of(context).size.width,
                            child: image.startsWith('assets/')? Image.asset(image,fit: BoxFit.cover):Image.network(image,fit: BoxFit.cover),
                          );
                    }).toList(),
                  ): Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  width: MediaQuery.of(context).size.width,
                            child: Image.asset(widget.meal.imgUrls[0],fit: BoxFit.cover),
                          ),
                 widget.meal.imgUrls.length>1? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.meal.imgUrls.map((image) {
                        final currentIndex = widget.meal.imgUrls.indexOf(image);
                        return  Container(
                          margin: const EdgeInsets.all(8),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: currentIndex == activeImageIndex? 
                            Colors.black:Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        );
                        }
                        ).toList(),
                  ):const SizedBox(height: 3),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(left:14.0,right: 8,bottom: 8,top: 8),
                       child: Text("\$${widget.meal.price.toStringAsFixed(0)}",
                       style: const TextStyle(color: Colors.black,fontSize: 20),),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(15.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           const Text('Tarifi: ',style: TextStyle(fontWeight: FontWeight.bold),),
                           Text(widget.meal.description)
                           ],
                         )
                         ],
                       ),
                     ),
                     SizedBox(
                       height: 200,
                       child: Card(
                        margin: const EdgeInsets.all(15),
                         child: ListView.separated(
                           padding: const EdgeInsets.all(10),
                           itemBuilder: (ctx,index)                          
                         {
                           return Text(widget.meal.ingredients[index]);
                         }, separatorBuilder: (ctx,index){
                           return const Divider();
                         }, itemCount: widget.meal.ingredients.length)
                     
                         ),
                       ),
                     ]  )
                   ],
                 ) 
              ),
             );
  }
}
