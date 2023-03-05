class Meal {
  late final String id;
  final String title;
  final List<String> imgUrls;
  final String description;
  final int preparationtime;
  final List<String> ingredients;
  final double price;
  final String categoryId;

  Meal({
    required this.id,
    required this.title,
    required this.imgUrls,
    required this.description,
    required this.preparationtime,
    required this.ingredients,
    required this.price,
    required this.categoryId,
  });

}

class Meals{
    
    final List<Meal> _mealsList = [
    Meal(id: 'm1', 
    title: 'Hamburger', 
    imgUrls: ['assets/images/fm/hamburger.png','assets/images/fm/hamburger2.jpg'], 
    description: 'Good Hamburger,delicious', 
    ingredients: ['meat','egg','bread'],
    preparationtime: 12, 
    price: 81, 
    categoryId: 'c1'),


        Meal(id: 'm3', 
    title: 'Somsa', 
    imgUrls: ['assets/images/fm/somsa.png','assets/images/fm/somsa2.png','assets/images/fm/somsa3.png',], 
    description: 'Good Somsa', 
    ingredients: ['gosht','tuxum','olma'],
    preparationtime: 12, 
    price: 11, 
    categoryId: 'c2'),

    Meal(id: 'm4', 
    title: 'Black meal', 
    imgUrls: ['assets/images/fm/france1.png'], 
    description: 'Good Meal', 
    ingredients: ['uzum','olma','banan'],
    preparationtime: 12, 
    price: 21, 
    categoryId: 'c3'),
         Meal(id: 'm5', 
    title: 'Oliviyez', 
    imgUrls: ['assets/images/fm/salat1.png'], 
    description: 'Good Salad', 
    ingredients: ['egg','mayonez'],
    preparationtime: 3, 
    price: 25, 
    categoryId: 'c4'),
        Meal(id: 'm2', 
    title: 'Tea', 
    imgUrls: ['assets/images/fm/choy.png'], 
    description: 'Good Tea', 
    ingredients: ['tea','water'],
    preparationtime: 12, 
    price: 41, 
    categoryId: 'c5'),
        Meal(id: 'm5', 
    title: 'Shake', 
    imgUrls: ['assets/images/fm/shake.png'], 
    description: 'Good Tea', 
    ingredients: ['tea','water'],
    preparationtime: 12, 
    price: 41, 
    categoryId: 'c5'),
    ];

    List<Meal> get mealList{
      return _mealsList;
    }
    
    final List<Meal> _favourites = [];

     List<Meal> get favourite{
      return _favourites;
    }

     void toggleLike(String mealId){
     final mealIndex =  _favourites.indexWhere((meal) => meal.id == mealId);
     if(mealIndex<0){
      _favourites.add(_mealsList.firstWhere((element) =>  element.id == mealId));
     }else{
      _favourites.removeWhere((element) => element.id == mealId);
     }
  }
      void addNewMeal(Meal meal){
        _mealsList.add(meal);
      }
        void removeMeal(String id){
        _mealsList.removeWhere((element) => element.id==id);
        _favourites.removeWhere((element) => element.id==id);
      }

}