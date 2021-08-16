import 'ProductModel.dart';
import 'category.dart';

class AppData {
  static List<Product> productList = [
    Product(
        id: 1,
        name: 'Nike Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image: 'assets/shooe_tilt_1.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Nike Air Max 97',
        price: 220.00,
        isliked: false,
        image: 'assets/shoe_tilt_2.png',
        category: "Trending Now"),
  ];
  static List<Product> cartList = [
    Product(
        id: 1,
        name: 'Nike Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image: 'assets/small_tilt_shoe_1.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Nike Air Max 97',
        price: 190.00,
        isliked: false,
        image: 'assets/small_tilt_shoe_2.png',
        category: "Trending Now"),
    Product(
        id: 1,
        name: 'Nike Air Max 92607',
        price: 220.00,
        isliked: false,
        image: 'assets/small_tilt_shoe_3.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Nike Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        image: 'assets/small_tilt_shoe_1.png',
        category: "Trending Now"),
    // Product(
    //     id:1,
    //     name: 'Nike Air Max 97',
    //     price: 190.00,
    //     isliked: false,
    //     image: 'assets/small_tilt_shoe_2.png',
    //     category: "Trending Now"),
  ];
  static List<Category> categoryList = [
    Category(
        id: 1,
        name: "Sneakers",
        image: 'assets/shoe_thumb_2.png',
        isSelected: true),
    Category(id: 2, name: "Jacket", image: 'assets/jacket.png'),
    Category(id: 3, name: "Watch", image: 'assets/watch.png'),
    Category(id: 4, name: "Watch", image: 'assets/watch.png'),
  ];
  static List<String> showThumbnailList = [
    "assets/shoe_thumb_5.png",
    "assets/shoe_thumb_1.png",
    "assets/shoe_thumb_4.png",
    "assets/shoe_thumb_3.png",
  ];

  final List<String> HomeSliderimages = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];


  static String description =
      "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
}
