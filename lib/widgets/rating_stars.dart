import 'package:flutter/cupertino.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  const RatingStars(this.rating, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    return Text(
      stars,
      style: const TextStyle(fontSize: 18.0),
    );
  }
}
