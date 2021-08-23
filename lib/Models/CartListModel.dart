class CartListModel{
  int id;
  String name ;
  String category ;
  String image ;
  double price ;
  double discountPrice;
  int quantity ;
  DateTime orderedTime ;
  CartListModel({required this.id,required this.name, required this.category, required this.price, required this.orderedTime,required this.quantity,required this.discountPrice,required this.image});
}