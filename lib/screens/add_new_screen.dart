import 'package:flutter/material.dart';
import '../models/category_model.dart';
import 'package:food_menu/models/meal.dart';
import 'package:food_menu/widgets/customimage_input.dart';



class AddNewProductScreen extends StatefulWidget {
  final List<Categor> categoryList;
  final Function addNewMeal;

  const AddNewProductScreen(this.categoryList,this.addNewMeal, {super.key});
 

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  late   String categoryId = '';
  final _titleController = TextEditingController();
  final _descriptController = TextEditingController();
  final _ingredientController = TextEditingController();
  final _priceController = TextEditingController();
  final _preperationTimeController = TextEditingController();
  final _mainImageController = TextEditingController();
  final _firstImageController = TextEditingController();
  final _secondImageController = TextEditingController();
  final _thirdImageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    categoryId =widget.categoryList[0].id;
  }

  void _save(){
    final title = _titleController.text;
    final desc = _descriptController.text;
    final ingr = _ingredientController.text;
    final price = _priceController.text;
    final prep = _preperationTimeController.text;
    final image = _mainImageController.text;
    final fistimage = _firstImageController.text;
    final secondimage = _secondImageController.text;
    final thirdimage = _thirdImageController.text;

    List<String> ingredientList = ingr.split(',');

    if(title.isEmpty||desc.isEmpty||ingr.isEmpty||price.isEmpty||prep.isEmpty||image.isEmpty||fistimage.isEmpty||secondimage.isEmpty||thirdimage.isEmpty){
      return;
    }
   final meal =  Meal(id: UniqueKey().toString(), title: title, imgUrls: [image,fistimage,secondimage,thirdimage], description: desc, preparationtime: int.parse(prep), ingredients: ingredientList, price: double.parse(prep), categoryId: categoryId);
    widget.addNewMeal(meal);
    Navigator.of(context).pop(true);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('New Meal'),
        actions: [
          IconButton(onPressed: 
          (){
            _save();
          }, icon: const Icon(Icons.save))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
           padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DropdownButton(
                isExpanded: true ,  
                value: categoryId,
                onChanged: (value){
                setState(() {
                  categoryId = value as String;
                });
              },
                items: widget.categoryList.map((category) => DropdownMenuItem(
                value: category.id,
                child:Text(category.title),
              )).toList(), ),
              TextField(
                controller: _titleController,
                decoration:const InputDecoration(
                  labelText: 'Food name',

                ),
              ),
              TextField(
                controller: _descriptController,
                decoration:const InputDecoration(
                  labelText: 'Food Description',
                ),
                maxLines: 5,
              ),
              TextField(
                controller:_ingredientController,
                decoration:const InputDecoration(
                  labelText: 'Food ingredients(E.x egg,meat,apple,limon)',
                ),
              ),
              TextField(
                controller: _priceController,
                decoration:const InputDecoration(
                  labelText: 'Price',
                ),
               keyboardType: TextInputType.number,
              ),
               TextField(
                controller: _preperationTimeController,
                decoration:const InputDecoration(
                  labelText: 'Preparation time(minut)',
                ),
               keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              CustomImageInput('Enter main picture Url',_mainImageController),
               const SizedBox(height: 10),
              CustomImageInput('Enter 1 picture Url',_firstImageController),
               const SizedBox(height: 10),
              CustomImageInput( 'Enter 2 picture Url',_secondImageController),
               const SizedBox(height: 10),
              CustomImageInput('Enter 3 picture Url',_thirdImageController),
            ],
          ),
        ),
      ),
    );
  }
}