import 'package:food_ui/models/food.dart';

class Restaurant {
  final String? imageUrl;
  final String? name;
  final String? address;
  final int rating;
  final List<Food>? menu;

  Restaurant({
    this.imageUrl,
    this.name,
    this.address,
    this.rating = 0,
    this.menu,
  });
}
