class Categor {
  
  final String id;
  final String title;
  final String imageUrl;

  Categor({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  
}

class Categories{
  // ignore: prefer_final_fields
  List<Categor> _list = [
    Categor(id: 'c1', title: 'Fast Food', imageUrl: 'assets/images/fast.png'),
    Categor(id: 'c2', title: 'National meals', imageUrl: 'assets/images/milliy.png'),
    Categor(id: 'c3', title: 'France Meals', imageUrl: 'assets/images/france.png'),
    Categor(id: 'c4', title: 'Salads', imageUrl: 'assets/images/salatlar.png'),
    Categor(id: 'c5', title: 'Drinks', imageUrl: 'assets/images/drinks.png'),
  ];

List<Categor> get lists{
  return _list;
}


}