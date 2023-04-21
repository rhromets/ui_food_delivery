import 'package:flutter/material.dart';
import '../models/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant? restaurant;
  const RestaurantScreen({Key? key, this.restaurant}) : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(

    );
  }
}
