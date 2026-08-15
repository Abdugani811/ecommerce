import 'package:flutter/material.dart';
import 'package:splash_screen/presentation/ui/resourses/app_styles.dart';
import 'package:splash_screen/presentation/ui/widgets/w_button.dart';

import '../../resourses/app_colors.dart';
import '../../widgets/w_stars.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  PageController controller = PageController(initialPage: 0);
  int page = 0;
  int currentColorIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [Icon(Icons.favorite_border, size: 24), SizedBox(width: 16)],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              SizedBox(
                height: 260,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        controller: controller,
                        onPageChanged: (int index) {
                          setState(() {
                            page = index;
                          });
                        },
                        physics: BouncingScrollPhysics(),
                        children: _getImages(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _getDots(5, page),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Laptop",
                        style: AppStyles.getLabelStyle().copyWith(fontSize: 20),
                        maxLines: 2,
                        overflow: TextOverflow.fade,
                      ),
                      SizedBox(height: 10),
                      const WStars(mark: 4),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$120.00",
                        style: AppStyles.getPriceStyle().copyWith(fontSize: 20),
                        overflow: TextOverflow.fade,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Available in stock",
                        style: AppStyles.getLabelStyle().copyWith(
                          fontSize: 16,
                          color: AppColors.success,
                        ),
                        overflow: TextOverflow.fade,
                      ),
                    ],
                  ),
                ],
              ),
              _getDivider(),
              Text(
                "Color Variant",
                style: AppStyles.getLabelStyle().copyWith(fontSize: 20),
                maxLines: 2,
                overflow: TextOverflow.fade,
              ),
              SizedBox(height: 20),
              Row(children: _getColorsWidget()),
              _getDivider(),
              ..._getChar(),
              SizedBox(height: 30),
              Text(
                "About this item",
                style: AppStyles.getLabelStyle().copyWith(fontSize: 20),
                maxLines: 2,
                overflow: TextOverflow.fade,
              ),
              SizedBox(height: 18),
              Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                style: AppStyles.getContentStyle(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(20),
        child: WButton(text: "Add to Cart", onTap: () {}),
      ),
    );
  }

  _getDivider() => Padding(
    padding: const EdgeInsets.only(top: 35, bottom: 30),
    child: Divider(color: AppColors.divider, thickness: 1),
  );

  _getChar() => List.generate(5, (index) => _getCharItem());

  _getCharItem() => Padding(
    padding: const EdgeInsets.only(bottom: 14),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Brand", style: AppStyles.getLabelStyle().copyWith(fontSize: 18)),
        SizedBox(width: 16),
        Text(
          "Noise",
          style: AppStyles.getLabelStyle().copyWith(
            fontSize: 18,
            color: Color(0xFFAAAAAA),
          ),
        ),
      ],
    ),
  );

  List<Color> colors = [
    Color(0xFF396036),
    Color(0xFFCDBD69),
    Color(0xFF3B250F),
    Color(0xFF69ABCE),
    Color(0xFFC0C0C0),
  ];

  List<Widget> _getColorsWidget() => List.generate(
    colors.length,
    (index) => GestureDetector(
      onTap: () {
        setState(() {
          currentColorIndex = index;
        });
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(
            color: index == currentColorIndex
                ? colors[index]
                : Colors.transparent,
            width: 2,
          ),
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(4),
        child: Container(
          decoration: BoxDecoration(
            color: colors[index],
            shape: BoxShape.circle,
          ),
        ),
      ),
    ),
  );

  List<Column> _getImages() => List.generate(
    5,
    (index) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.network(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8P3Nrxowz6ScQtrQxSPi2_SZnuuELIoYfPdoDt3jy3w&s=10",
          width: 260,
          height: 240,
        ),
      ],
    ),
  );

  List<Container> _getDots(int n, int activeIndex) => List.generate(n, (index) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: index == activeIndex
            ? AppColors.primaryColor
            : AppColors.primaryColor.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
    );
  });
}
