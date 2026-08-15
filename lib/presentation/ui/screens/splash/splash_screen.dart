import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:splash_screen/presentation/ui/resourses/app_colors.dart';
import 'package:splash_screen/presentation/ui/resourses/app_styles.dart';
import 'package:splash_screen/presentation/ui/screens/onboarding/onboarding_screen.dart';
import 'package:splash_screen/presentation/ui/widgets/w_brand_name.dart';
import '../../resourses/app_images.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    navigate();
  }

  Future<void> navigate() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SvgPicture.asset(AppImages.logoSvg, width: 140),
                SizedBox(height: 40),
                WBrandName()

              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _getDots(5),
            ),
          ],
        ),
      ),
    );
  }

  List<Container> _getDots(int n) => List.generate(n, (index) {
    double opacity = (n - index) / n;
    return Container(
      width: 12,
      height: 12,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(opacity),
        shape: BoxShape.circle,
      ),
    );
  });
}
