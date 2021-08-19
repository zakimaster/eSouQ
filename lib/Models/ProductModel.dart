class Product{
  int id;
  String name ;
  String category ;
  String image ;
  double price ;
  bool isliked ;
  String description ;
  bool isSelected ;
  int ordered ;
  int inStock ;
  Product({required this.id,required this.name, required this.category, required this.price, required this.isliked,required this.description,this.isSelected = false,required this.image,required this.ordered,required this.inStock});
}