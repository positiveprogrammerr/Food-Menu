import 'package:flutter/material.dart';
import 'package:food_menu/models/meal.dart';
import 'package:food_menu/widgets/main._drawer.dart';
import 'package:food_menu/models/category_model.dart';
import 'package:food_menu/screens/favourite_screen.dart';
import 'package:food_menu/screens/categories_screen.dart';


class TabsScreen extends StatefulWidget {
  final List<Categor> categoryList;
  final List<Meal> mealList;
  final Function toggleLike;
  final Function isFavourite;
  final Meals mealsModel;


  const TabsScreen({
    Key? key,
    required this.categoryList,
    required this.mealList,
    required this.toggleLike,
    required this.isFavourite,
    required this.mealsModel,
  }) : super(key: key);

  


  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   int _currentIndex = 0;

  void _changeTab(value){
    setState(() {
       _currentIndex = value;
    });
  }

   List<Map<String,dynamic>> _pages = [];

  @override
  void initState() {
   _pages =  [
    {
    'page': CategoriesScreen(widget.categoryList, widget.mealList,widget.toggleLike,widget.isFavourite),
    'title':'Foods Menu',
  },
  {
    'page': FavouriteScreen(widget.mealsModel),
    'title':'Favourite Menu',
  }
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(_pages[_currentIndex]['title']),
        ),
      body: _pages[_currentIndex]['page'],
      drawer: const MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: _changeTab,
        items:  const [
          BottomNavigationBarItem(
            label: 'More',
            icon:Icon(Icons.more_horiz
            )),
          BottomNavigationBarItem(
            label: 'Favourite',
            icon: Icon(Icons.favorite
            )),  
          
        ],
      ),
    );
  }
}
