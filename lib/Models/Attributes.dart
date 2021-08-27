import 'category.dart';

class Attributes {
  List<Brand>? brand;
  List<Size>? size;
  List<Color>? color;
  List<Category>? categories;

  Attributes({this.brand, this.size, this.color, this.categories});

  factory Attributes.fromJson(Map<String, dynamic> json) {
    return Attributes(
      brand: json['brand'] != null
          ? (json['brand'] as List).map((i) => Brand.fromJson(i)).toList()
          : null,
      size: json['size'] != null
          ? (json['size'] as List).map((i) => Size.fromJson(i)).toList()
          : null,
      color: json['color'] != null
          ? (json['color'] as List).map((i) => Color.fromJson(i)).toList()
          : null,
      categories: json['categories'] != null
          ? (json['categories'] as List)
              .map((i) => Category.fromJson(i))
              .toList()
          : null,
    );
  }
}

class Color {
  int? count;
  String? description;
  int? id;
  // ignore: non_constant_identifier_names
  int? menu_order;
  String? name;
  String? slug;
  bool isSelected = false;

  // ignore: non_constant_identifier_names
  Color(
      {this.count,
      this.description,
      this.id,
      this.menu_order,
      this.name,
      this.slug});

  factory Color.fromJson(Map<String, dynamic> json) {
    return Color(
      count: json['count'],
      description: json['description'],
      id: json['id'],
      menu_order: json['menu_order'],
      name: json['name'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['description'] = this.description;
    data['id'] = this.id;
    data['menu_order'] = this.menu_order;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class Size {
  int? count;
  String? description;
  int? id;
  // ignore: non_constant_identifier_names
  int? menu_order;
  String? name;
  String? slug;
  bool isSelected = false;

  // ignore: non_constant_identifier_names
  Size(
      {this.count,
      this.description,
      this.id,
      this.menu_order,
      this.name,
      this.slug});

  factory Size.fromJson(Map<String, dynamic> json) {
    return Size(
      count: json['count'],
      description: json['description'],
      id: json['id'],
      menu_order: json['menu_order'],
      name: json['name'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['description'] = this.description;
    data['id'] = this.id;
    data['menu_order'] = this.menu_order;
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}

class Brand {
  String? name;
  String? slug;
  bool isSelected = false;

  Brand({this.name, this.slug});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      name: json['name'],
      slug: json['slug'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['slug'] = this.slug;
    return data;
  }
}
