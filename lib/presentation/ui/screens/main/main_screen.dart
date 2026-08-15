import 'package:flutter/material.dart';
import 'package:splash_screen/presentation/ui/screens/cart/cart_screen.dart';
import 'package:splash_screen/presentation/ui/screens/home/home_screen.dart';
import 'package:splash_screen/presentation/ui/screens/profile/profile_screen.dart';
import 'package:splash_screen/presentation/ui/screens/wishlist/wishlist_screen.dart';

import '../../resourses/app_colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: [
          HomeScreen(),
          WishlistScreen(),
          CartScreen(),
          ProfileScreen()],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor,
              spreadRadius: 3,
              blurRadius: 7,
            ),
          ],
        ),
        height: 94,

        child: TabBar(
          controller: tabController,
          indicatorColor: Colors.deepPurpleAccent,
          tabs: [
            Icon(Icons.home, size: 24),
            Icon(Icons.category, size: 24),
            Icon(Icons.shopping_cart, size: 24),
            Icon(Icons.home, size: 24),
          ],
        ),
      ),
    );
  }
}
