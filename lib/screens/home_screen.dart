import 'package:flutter/material.dart';
import 'package:food_ui/data/data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String _title = 'Food Delivery';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.account_circle),
          iconSize: 30.0,
          onPressed: () {},
        ),
        title: const Text(_title),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Cart (${currentUser.cart!.length})',
                style: TextStyle(color: Theme.of(context).colorScheme.onPrimary, fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                  borderSide: BorderSide(width: 0.8, color: Theme.of(context).colorScheme.primary),
                ),
                hintText: 'Search Food or Restaurants',
                prefixIcon: const Icon(Icons.search, size: 30.0,),
                suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.clear))
              ),
            ),
          ),
        ],
      ),
    );
  }
}
