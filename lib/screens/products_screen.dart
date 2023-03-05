import '../models/meal.dart';
import 'package:flutter/material.dart';
import 'package:food_menu/widgets/main._drawer.dart';


class ProductsScreen extends StatefulWidget {
  final List<Meal> meals;
    final Function removeMeal;
  const ProductsScreen(this.meals,this.removeMeal,{super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mahsulotlar'),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, 'add-new-product').then((value) {
            if(value!=null){
                setState(() {
                  
                });
            }});
          }, icon: const Icon(Icons.add)),
        ],
      ),
      drawer: const MainDrawer(),
      body: ListView.builder(
        itemCount: widget.meals.length,
        itemBuilder: (context, index) {
       return Card(
         child: ListTile(
            leading: CircleAvatar(
             backgroundImage:widget.meals[index].imgUrls[0].startsWith('assets/')? AssetImage(widget.meals[index].imgUrls[0]):
             NetworkImage(widget.meals[index].imgUrls[0]) as ImageProvider,
            ),
            title:  Text(widget.meals[index].title),
            subtitle: Text('\$${widget.meals[index].price}'),
            trailing: IconButton(
              onPressed: (){
               setState(() {
                  widget.removeMeal(widget.meals[index].id);
               });
              },
              icon: const Icon(Icons.delete,size: 20,),
            ),
          ),
       );
      },),
    );
  }
}