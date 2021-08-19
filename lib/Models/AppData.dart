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
        ordered: 254,
        inStock: 500,
        description: "gdfgqddggqffd dfgsqdgfgfgqdfdfqdfdsqdf dfdsqfsdfdfdfq",
        image: 'assets/introduction_animation/care_image.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Nike Air Max 97',
        price: 220.00,
        isliked: false,
        ordered: 254,
        inStock: 500,
        description: "gdfgqddggqffd dfgsqdgfgfgqdfdfqdfdsqdf dfdsqfsdfdfdfq",
        image: 'assets/introduction_animation/introduction_animation.png',
        category: "Trending Now"),
  ];
  static List<Product> cartList = [
    Product(
        id: 1,
        name: 'Nike Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        ordered: 254,
        inStock: 500,
        description: "gdfgqddggqffd dfgsqdgfgfgqdfdfqdfdsqdf dfdsqfsdfdfdfq",
        image: 'assets/introduction_animation/introduction_image.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Nike Air Max 97',
        price: 190.00,
        isliked: false,
        ordered: 254,
        inStock: 500,
        description: "gdfgqddggqffd dfgsqdgfgfgqdfdfqdfdsqdf dfdsqfsdfdfdfq",
        image: 'assets/introduction_animation/mood_dairy_image.png',
        category: "Trending Now"),
    Product(
        id: 1,
        name: 'Nike Air Max 92607',
        price: 220.00,
        isliked: false,
        ordered: 254,
        inStock: 500,
        description: "gdfgqddggqffd dfgsqdgfgfgqdfdfqdfdsqdf dfdsqfsdfdfdfq",
        image: 'assets/introduction_animation/relax_image.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Nike Air Max 200',
        price: 240.00,
        isSelected: true,
        isliked: false,
        ordered: 254,
        inStock: 500,
        description: "gdfgqddggqffd dfgsqdgfgfgqdfdfqdfdsqdf dfdsqfsdfdfdfq",
        image: 'assets/introduction_animation/welcome.png',
        category: "Trending Now"),
    // Product(
    //     id:1,
    //     name: 'Nike Air Max 97',
    //     price: 190.00,
    //     isliked: false,
    //     image: 'assets/small_tilt_shoe_2.png',
    //     category: "Trending Now"),
  ];

  static List<Category> categories = [
    Category('assets/images/clothes.png', 'Women'),
    Category('assets/images/sneaker.png', 'Men'),
    Category('assets/images/bodysuit.png', 'Baby'),
    Category('assets/images/dress.png', 'Girls'),
    Category('assets/images/computer.png', 'Computers'),
    Category('assets/images/tent.png', 'Outsides'),
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
