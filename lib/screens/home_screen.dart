import 'package:flutter/material.dart';
import 'package:food_ui/data/data.dart' as data;
import 'package:food_ui/models/restaurant.dart';
import 'package:food_ui/screens/cart_screen.dart';
import 'package:food_ui/screens/restaurant_screen.dart';
import 'package:food_ui/widgets/recent_orders.dart';
import 'package:food_ui/widgets/rating_stars.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String _title = 'Food Delivery';

  Widget buildRestaurants() {
    List<Widget>? restaurantList = [];
    for (Restaurant restaurant in data.restaurants) {
      restaurantList.add(
        GestureDetector(
          onTap: () => {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RestaurantScreen(restaurant: restaurant),
              ),
            ),
          },
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                  width: 1.0, color: Theme.of(context).colorScheme.onSecondary),
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Hero(
                    tag: restaurant.imageUrl.toString(),
                    child: Image(
                      height: 130.0,
                      width: 130.0,
                      fit: BoxFit.cover,
                      image: AssetImage(restaurant.imageUrl.toString()),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        restaurant.name.toString(),
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      RatingStars(restaurant.rating),
                      const SizedBox(height: 4.0),
                      Text(
                        restaurant.address.toString(),
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4.0),
                      const Text(
                        '0.2 miles away',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Column(
      children: restaurantList,
    );
  }

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
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CartScreen(),
                ),
              ),
              child: Text(
                'Cart (${data.currentUser.cart!.length})',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 18.0),
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
                    borderSide: BorderSide(
                      width: 0.8,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  hintText: 'Search Food or Restaurants',
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30.0,
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.clear))),
            ),
          ),
          const RecentOrders(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Nearby Restaurants',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              buildRestaurants(),
            ],
          ),
        ],
      ),
    );
  }
}
