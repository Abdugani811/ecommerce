import 'package:flutter/material.dart';
import 'package:splash_screen/presentation/ui/resourses/app_colors.dart';
import 'package:splash_screen/presentation/ui/resourses/app_styles.dart';

class WButton extends StatelessWidget {
  final String text;
  final GestureTapCallback onTap;
  final double borderRadius;
  final Color color;

  const WButton({
    super.key,
    required this.text,
    required this.onTap,
    this.borderRadius = 0,
    this.color = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.all(16),
        child: Text(
          text,
          style: AppStyles.getLabelStyle().copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
