import 'package:flutter/material.dart';
import 'package:splash_screen/presentation/ui/resourses/app_styles.dart';

class WPageTitle extends StatelessWidget {
  final String text;

  const WPageTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
        style: AppStyles.getLabelStyle().copyWith(fontSize: 18)
    );
  }
}
