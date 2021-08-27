import 'dart:math';
import 'package:esouq/Models/CartListModel.dart';
import '../Config.dart';
import 'AddressListModel.dart';
import 'ChatMessagesModel.dart';
import 'FAQ.dart';
import 'MessageModel.dart';
import 'ProductModel.dart';
import 'ReviewModel.dart';
import 'category.dart';

const sender_id = 1;
const receiver_id = 2;

class AppData {
  /* static List<Product> productList = [
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
  ];*/

  static List<CartListModel> cartList = [
    CartListModel(
        id: 1,
        name: 'Nike Air Max 200',
        price: 240.00,
        discountPrice: 200.00,
        orderedTime: new DateTime.now(),
        quantity: 500,
        image: 'assets/introduction_animation/care_image.png',
        category: "Trending Now"),
    CartListModel(
        id: 2,
        name: 'Nike Air Max 400',
        price: 160.00,
        discountPrice: 140.00,
        orderedTime: new DateTime.now(),
        quantity: 80,
        image: 'assets/introduction_animation/care_image.png',
        category: "Trending Now"),
    CartListModel(
        id: 3,
        name: 'Nike Air Max 700',
        price: 90.00,
        discountPrice: 85.00,
        orderedTime: new DateTime.now(),
        quantity: 54,
        image: 'assets/introduction_animation/care_image.png',
        category: "Trending Now"),
    CartListModel(
        id: 4,
        name: 'Nike Air Max 700',
        price: 15.00,
        discountPrice: 10.00,
        orderedTime: new DateTime.now(),
        quantity: 60,
        image: 'assets/introduction_animation/care_image.png',
        category: "Trending Now")
  ];

  /*static List<Category> categories = [
    Category('assets/images/clothes.png', 'Women'),
    Category('assets/images/sneaker.png', 'Men'),
    Category('assets/images/bodysuit.png', 'Baby'),
    Category('assets/images/dress.png', 'Girls'),
    Category('assets/images/computer.png', 'Computers'),
    Category('assets/images/tent.png', 'Outsides'),
  ];*/

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

  List<ChatMessageModel> getChatData() {
    List<ChatMessageModel> list = [];

    ChatMessageModel c1 = ChatMessageModel();
    c1.senderName = 'William';
    c1.image = 'assets/user.png';
    c1.time = '1:43 AM';
    c1.msg = Config.LoremText;
    c1.unreadCount = Random().nextInt(20);
    list.add(c1);

    ChatMessageModel c2 = ChatMessageModel();
    c2.senderName = 'Benjamin';
    c2.image = 'assets/user.png';
    c2.time = '4:43 AM';
    c2.msg = Config.LoremText;
    c2.unreadCount = Random().nextInt(20);
    list.add(c2);

    ChatMessageModel c3 = ChatMessageModel();
    c3.senderName = 'Emma';
    c3.image = 'assets/user.png';
    c3.time = '7:03 PM';
    c3.msg = Config.LoremText;
    c3.unreadCount = Random().nextInt(20);
    list.add(c3);

    ChatMessageModel c4 = ChatMessageModel();
    c4.senderName = 'Isabella';
    c4.image = 'assets/user.png';
    c4.time = '2:43 PM';
    c4.msg = Config.LoremText;
    c4.unreadCount = Random().nextInt(20);
    list.add(c4);

    ChatMessageModel c5 = ChatMessageModel();
    c5.senderName = 'John Smith';
    c5.image = 'assets/user.png';
    c5.time = '2:43 PM';
    c5.msg = Config.LoremText;
    c5.unreadCount = Random().nextInt(20);
    list.add(c5);

    return list;
  }

  List<MessageModel> getChatMsgData() {
    List<MessageModel> list = [];

    MessageModel c1 = MessageModel();
    c1.Sender_id = sender_id;
    c1.Recevier_id = receiver_id;
    c1.msg = 'Helloo';
    c1.time = '1:43 AM';
    list.add(c1);

    MessageModel c2 = MessageModel();
    c2.Sender_id = sender_id;
    c2.Recevier_id = receiver_id;
    c2.msg = 'How are you? What are you doing?';
    c2.time = '1:45 AM';
    list.add(c2);

    MessageModel c3 = MessageModel();
    c3.Sender_id = receiver_id;
    c3.Recevier_id = sender_id;
    c3.msg = 'Helloo...';
    c3.time = '1:45 AM';
    list.add(c3);

    MessageModel c4 = MessageModel();
    c4.Sender_id = sender_id;
    c4.Recevier_id = receiver_id;
    c4.msg = 'I am good. Can you do something for me? I need your help.';
    c4.time = '1:45 AM';
    list.add(c4);

    MessageModel c5 = MessageModel();
    c5.Sender_id = sender_id;
    c5.Recevier_id = receiver_id;
    c5.msg = 'I am good. Can you do something for me? I need your help.';
    c5.time = '1:45 AM';
    list.add(c5);

    MessageModel c6 = MessageModel();
    c6.Sender_id = receiver_id;
    c6.Recevier_id = sender_id;
    c6.msg = 'I am good. Can you do something for me? I need your help.';
    c6.time = '1:45 AM';
    list.add(c6);

    MessageModel c7 = MessageModel();
    c7.Sender_id = sender_id;
    c7.Recevier_id = receiver_id;
    c7.msg = 'I am good. Can you do something for me? I need your help.';
    c7.time = '1:45 AM';
    list.add(c7);

    MessageModel c8 = MessageModel();
    c8.Sender_id = receiver_id;
    c8.Recevier_id = sender_id;
    c8.msg = 'I am good. Can you do something for me? I need your help.';
    c8.time = '1:45 AM';
    list.add(c8);

    MessageModel c9 = MessageModel();
    c9.Sender_id = sender_id;
    c9.Recevier_id = receiver_id;
    c9.msg = 'I am good. Can you do something for me? I need your help.';
    c9.time = '1:45 AM';
    list.add(c9);

    MessageModel c10 = MessageModel();
    c10.Sender_id = receiver_id;
    c10.Recevier_id = sender_id;
    c10.msg = 'I am good. Can you do something for me? I need your help.';
    c10.time = '1:45 AM';
    list.add(c10);

    MessageModel c11 = MessageModel();
    c11.Sender_id = receiver_id;
    c11.Recevier_id = sender_id;
    c11.msg = 'I am good. Can you do something for me? I need your help.';
    c11.time = '1:45 AM';
    list.add(c11);

    MessageModel c12 = MessageModel();
    c12.Sender_id = sender_id;
    c12.Recevier_id = receiver_id;
    c12.msg = 'I am good. Can you do something for me? I need your help.';
    c12.time = '1:45 AM';
    list.add(c12);

    MessageModel c13 = MessageModel();
    c13.Sender_id = sender_id;
    c13.Recevier_id = receiver_id;
    c13.msg = 'I am good. Can you do something for me? I need your help.';
    c13.time = '1:45 AM';
    list.add(c13);

    MessageModel c14 = MessageModel();
    c14.Sender_id = receiver_id;
    c14.Recevier_id = sender_id;
    c14.msg = 'I am good. Can you do something for me? I need your help.';
    c14.time = '1:45 AM';
    list.add(c14);

    MessageModel c15 = MessageModel();
    c15.Sender_id = sender_id;
    c15.Recevier_id = receiver_id;
    c15.msg = 'I am good. Can you do something for me? I need your help.';
    c15.time = '1:45 AM';
    list.add(c15);

    MessageModel c16 = MessageModel();
    c16.Sender_id = receiver_id;
    c16.Recevier_id = sender_id;
    c16.msg = 'I am good. Can you do something for me? I need your help.';
    c16.time = '1:45 AM';
    list.add(c16);

    MessageModel c17 = MessageModel();
    c17.Sender_id = sender_id;
    c17.Recevier_id = receiver_id;
    c17.msg = 'I am good. Can you do something for me? I need your help.';
    c17.time = '1:45 AM';
    list.add(c17);

    MessageModel c18 = MessageModel();
    c18.Sender_id = receiver_id;
    c18.Recevier_id = sender_id;
    c18.msg = 'I am good. Can you do something for me? I need your help.';
    c18.time = '1:45 AM';
    list.add(c18);

    return list;
  }

  String getMonth(int month) {
    if (month == 1) return 'January';
    if (month == 2) return 'February';
    if (month == 3) return 'March';
    if (month == 4) return 'April';
    if (month == 5) return 'May';
    if (month == 6) return 'Jun';
    if (month == 7) return 'July';
    if (month == 8) return 'August';
    if (month == 9) return 'September';
    if (month == 10) return 'October';
    if (month == 11) return 'November';
    if (month == 12) return 'December';
    return '';
  }

  /* List<AddressListModel> getAddressList() {
    List<AddressListModel> list = [];

    AddressListModel a1 = AddressListModel();
    a1.name = "Smith Jones";
    a1.type = "Home";
    a1.addressLine1 = '381, Shirley St. Munster, New York';
    a1.addressLine2 = 'United States - 10005';
    a1.phoneNo = '+913972847376';
    list.add(a1);

    AddressListModel a2 = AddressListModel();
    a2.name = "Micheal Doe";
    a2.type = "Office";
    a2.addressLine1 = '4046  Fleming Street, Montgomery';
    a2.addressLine2 = 'Alabama 36109';
    a2.phoneNo = '334-318-6649';
    list.add(a2);

    return list;
  }*/

  /* List<ReviewModel> getReviewList() {
    List<ReviewModel> list = [];

    ReviewModel r1 = ReviewModel();
    r1.name = "John smith";
    r1.comment = Config.LoremText;
    r1.ratting = 2.0;
    list.add(r1);
    ReviewModel r2 = ReviewModel();
    r2.name = "Lora";
    r2.comment = Config.LoremText;
    r2.ratting = 4.0;
    list.add(r2);
    ReviewModel r3 = ReviewModel();
    r3.name = "Isabella";
    r3.comment = Config.LoremText;
    r3.ratting = 5.0;
    list.add(r3);
    ReviewModel r4 = ReviewModel();
    r4.name = "Emma";
    r4.comment = Config.LoremText;
    r4.ratting = 3.0;
    list.add(r4);
    ReviewModel r5 = ReviewModel();
    r5.name = "John";
    r5.comment = Config.LoremText;
    r5.ratting = 5.0;
    list.add(r5);
    ReviewModel r6 = ReviewModel();
    r6.name = "Nora";
    r6.comment = Config.LoremText;
    r6.ratting = 3.0;
    list.add(r6);
    ReviewModel r7 = ReviewModel();
    r7.name = "Nora";
    r7.comment = Config.LoremText;
    r7.ratting = 3.0;
    list.add(r7);
    ReviewModel r8 = ReviewModel();
    r8.name = "John";
    r8.comment = Config.LoremText;
    r8.ratting = 5.0;
    list.add(r8);

    return list;
  }*/

  List<FAQ> getFaq() {
    List<FAQ> list = [];
    list.add(FAQ(
        title: "How to delete conitnue watching",
        subTitle:
            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ",
        isExpanded: false));
    list.add(FAQ(
        title: "How to delete conitnue watching",
        subTitle:
            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ",
        isExpanded: false));
    list.add(FAQ(
        title: "How to delete conitnue watching",
        subTitle:
            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ",
        isExpanded: false));
    list.add(FAQ(
        title: "How to delete conitnue watching",
        subTitle:
            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ",
        isExpanded: false));
    list.add(FAQ(
        title: "How to delete conitnue watching",
        subTitle:
            "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. ",
        isExpanded: false));

    return list;
  }

  static String description =
      "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
}
