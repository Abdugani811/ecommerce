import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:splash_screen/presentation/ui/resourses/app_colors.dart';
import 'package:splash_screen/presentation/ui/resourses/app_images.dart';
import 'package:splash_screen/presentation/ui/resourses/app_styles.dart';
import 'package:splash_screen/presentation/ui/screens/home/category_data.dart';
import 'package:splash_screen/presentation/ui/screens/product/product_screen.dart';
import 'package:splash_screen/presentation/ui/widgets/w_brand_name.dart';
import 'package:splash_screen/presentation/ui/widgets/w_category.dart';
import 'package:splash_screen/presentation/ui/widgets/w_page_title.dart';
import 'package:splash_screen/presentation/ui/widgets/w_product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _getAppBar(),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImages.logoSvg, width: 80),
                  SizedBox(height: 10),
                  WBrandName(fontSize: 28),
                ],
              ),
            ),

            _getMenuItem(text: "Rewards", icon: Icons.card_giftcard),
            _getMenuItem(text: "Help", icon: Icons.help),
            _getMenuItem(text: "Contact Us", icon: Icons.contact_support),
            _getMenuItem(text: "Privacy Policy", icon: Icons.privacy_tip),
            _getMenuItem(text: "Logout", icon: Icons.logout),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _getSearchBox(),
            SizedBox(height: 34),
            const WPageTitle(text: "Shop by Category"),
            SizedBox(height: 22),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: List.generate(
                  categories.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                      right: categories.length - 1 != index ? 30.0 : 0,
                    ),
                    child: WCategory(
                      icon: categories[index].icon,
                      text: categories[index].text,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            const WPageTitle(text: "Newest Arrival"),
            SizedBox(height: 22),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 270,
                ),
                children: List.generate(
                  8,
                  (index) => WProductItem(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile _getMenuItem({required String text, required IconData icon}) =>
      ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.primaryColor,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(text, style: AppStyles.getLabelStyle()),
      );

  AppBar _getAppBar() => AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const WBrandName(fontSize: 24),
        CircleAvatar(
          backgroundImage: ExactAssetImage(AppImages.logoJpg),
          minRadius: 20,
        ),
      ],
    ),
  );

  Container _getSearchBox() => Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: AppColors.shadowColor,
          blurRadius: 40,
          spreadRadius: 1,
        ),
      ],
    ),
    child: TextField(
      controller: searchController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: Icon(Icons.search),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(90),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(90),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        hintText: "Search \"Smartphone\"",
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.lightGray,
          fontFamily: "BeVietnamPro",
        ),
        suffixIcon: Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primaryColor,
          ),
          child: Icon(Icons.qr_code_scanner, color: Colors.white),
        ),
      ),
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
        fontFamily: "BeVietnamPro",
      ),
      textInputAction: TextInputAction.search,
    ),
  );
}
