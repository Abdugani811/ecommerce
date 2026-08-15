import 'package:flutter/material.dart';
import 'package:splash_screen/presentation/ui/resourses/app_images.dart';
import 'package:splash_screen/presentation/ui/resourses/app_styles.dart';
import 'package:splash_screen/presentation/ui/widgets/w_stars.dart';

import '../resourses/app_colors.dart';

class WProductItem extends StatelessWidget {
  GestureTapCallback onTap;

  WProductItem({super.key, required this.onTap});

  num? get rating => null;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Color(0xFFF7F7F7)),
            child: Image.asset(AppImages.smartImg, width: 130),
          ),
          const SizedBox(height: 20),
          const WStars(mark: 4),
          const SizedBox(height: 8),
          Text("Smart Watches", style: AppStyles.getLabelStyle()),
          SizedBox(height: 6),
          Text("\$120.00", style: AppStyles.getPriceStyle()),
        ],
      ),
    );
  }
}
