import 'package:flutter/material.dart';

import '../resourses/app_colors.dart';

class WStars extends StatelessWidget {
  final int mark;

  const WStars({super.key, required this.mark});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) => Icon(
          Icons.star,
          size: 16,
          color: index < mark - 1
              ? AppColors.reviewEnabledColor
              : AppColors.reviewDisabledColor,
        ),
      ),
    );
  }
}
