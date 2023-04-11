import 'package:flutter/cupertino.dart';

class ProductModel with ChangeNotifier {
  String id;
  String name;
  double price;
  String brand;
  String description;

  /// this will be list
  List<String> images;
  String category;
  int quantity;
  int sales;
  bool isPopular;
  String userId;

  ProductModel(
      {this.id = '',
      this.name = '',
      this.price = 0,
      this.brand = '',
      this.description = '',
      required this.images,
      this.category = '',
      this.quantity = 0,
      this.sales = 0,
      this.isPopular = false,
      this.userId = ''});
}
