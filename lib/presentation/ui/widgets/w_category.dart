import 'package:flutter/material.dart';
import 'package:splash_screen/presentation/ui/resourses/app_colors.dart';
import 'package:splash_screen/presentation/ui/resourses/app_styles.dart';
import '../resourses/app_images.dart';

class WCategory extends StatelessWidget {
  final String text;
  final String icon;

  const WCategory({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      margin: EdgeInsets.only(),
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.colorE5E5E5, width: 2),
              shape: BoxShape.circle,
            ),
            child: Image.asset(icon),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: AppStyles.getLabelStyle(),
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
