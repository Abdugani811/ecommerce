import 'package:flutter/material.dart';
import '../resourses/app_colors.dart' show AppColors;
import '../resourses/app_styles.dart';

class WBrandName extends StatelessWidget {
  final double fontSize;

  const WBrandName({super.key, this.fontSize = 38});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "Swip",
        children: [
          TextSpan(
            text: "wide",
            style: AppStyles.getLogoTextStyle().copyWith(
              color: AppColors.black,
              fontSize: fontSize,
            ),
          ),
        ],
        style: AppStyles.getLogoTextStyle().copyWith(fontSize: fontSize),
      ),
    );
  }
}
