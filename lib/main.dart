import 'package:flutter/material.dart';
import 'package:splash_screen/presentation/ui/screens/main/main_screen.dart';
import 'package:splash_screen/presentation/ui/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ecommerce",
      home: SplashScreen(),
    );
  }
}
