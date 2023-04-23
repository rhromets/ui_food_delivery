import 'package:flutter/material.dart';
import 'package:food_ui/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Delivery App UI';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
          colorScheme: ColorScheme(
            background: Colors.grey.shade50,
            brightness: Brightness.light,
            primary: Colors.deepOrangeAccent,
            secondary: Colors.green.shade700,
            error: Colors.black45,
            onBackground: Colors.green,
            onError: Colors.cyan,
            onPrimary: Colors.white,
            onSecondary: Colors.grey.shade200,
            surface: Colors.black38,
            onSurface: Colors.deepPurpleAccent
          ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
            color: Colors.black87
          ) ,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
