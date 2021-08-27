import 'dart:convert';

import 'package:esouq/Models/AddressListModel.dart';
import 'package:esouq/Models/Attributes.dart';
import 'package:esouq/Models/OrderModel.dart';
import 'package:esouq/Models/ProductModel.dart';
import 'package:esouq/Models/category.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

Future<String> loadContentAsset(String path) async {
  return await rootBundle.loadString(path);
}

Future<List<Category>> loadCategory() async {
  String jsonString = await loadContentAsset('assets/data/category.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => Category.fromJson(i)).toList();
}

Future<List<Product>> loadProducts() async {
  String jsonString = await loadContentAsset('assets/data/products.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => Product.fromJson(i)).toList();
}

Future<List<Product>> loadCartProducts() async {
  String jsonString = await loadContentAsset('assets/data/cart_products.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => Product.fromJson(i)).toList();
}

Future<Attributes> loadAttributes() async {
  String jsonString = await loadContentAsset('assets/data/attributes.json');
  final jsonResponse = json.decode(jsonString);
  return Attributes.fromJson(jsonResponse);
}

Future<List<AddressModel>> loadAddresses() async {
  String jsonString = await loadContentAsset('assets/data/address.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => AddressModel.fromJson(i)).toList();
}

Future<List<Order>> loadOrders() async {
  String jsonString = await loadContentAsset('assets/data/orders.json');
  final jsonResponse = json.decode(jsonString);
  return (jsonResponse as List).map((i) => Order.fromJson(i)).toList();
}

Future<List<String>> loadBanners() async {
  List<Product> products = await loadProducts();
  List<String> banner = [];

  products.forEach((product) {
    if (product.images!.isNotEmpty) {
      banner.add("images/shophop/img/products" + product.images![0].src!);
    }
  });
  return banner;
}

extension StringExtension on String? {
  String? toCurrencyFormat({var format = '\$'}) {
    return format + this;
  }

  String formatDateTime() {
    if (this == null || this!.isEmpty || this == "null") {
      return "NA";
    } else {
      return DateFormat("HH:mm dd MMM yyyy", "en_US")
          .format(DateFormat("yyyy-MM-dd HH:mm:ss.0", "en_US").parse(this!));
    }
  }

  String formatDate() {
    if (this == null || this!.isEmpty || this == "null") {
      return "NA";
    } else {
      return DateFormat("dd MMM yyyy", "en_US")
          .format(DateFormat("yyyy-MM-dd", "en_US").parse(this!));
    }
  }
}
