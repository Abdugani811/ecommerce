import 'package:flutter/material.dart';
import 'package:splash_screen/presentation/ui/resourses/app_styles.dart';

import '../../widgets/w_product_item.dart';
import '../product/product_screen.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text("Wishlist Screen", style: AppStyles.getLabelStyle()),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 1),
          child: Container(height: 1, color: Color(0xFFDEDEDE)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 16,
            mainAxisExtent: 270,
          ),
          children: List.generate(
            8,
            (index) => Stack(
              children: [
                WProductItem(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ProductScreen()),
                    );
                  },
                ),
                Positioned(
                  right: 16,
                  top: 12,
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.favorite, color: Colors.red, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
