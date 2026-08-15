import 'package:flutter/material.dart';
import 'package:splash_screen/presentation/ui/resourses/app_styles.dart';
import 'package:splash_screen/presentation/ui/screens/login/login_screen.dart';
import 'package:splash_screen/presentation/ui/screens/onboarding/onboarding_data.dart';

import '../../resourses/app_colors.dart' show AppColors;

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController(initialPage: 0);
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SafeArea(child: SizedBox()),
          GestureDetector(
            onTap: () {
              if (page != onboardingData.length - 1) {
                setState(() {
                  page++;
                  controller.animateToPage(
                    page,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                });
              } else {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              }
            },
            child: Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.only(right: 30, top: 30),
              child: Text("Next", style: AppStyles.getTextActionStyle()),
            ),
          ),
          Expanded(
            child: PageView(
              controller: controller,
              onPageChanged: (int index) {
                setState(() {
                  page = index;
                });
              },
              physics: BouncingScrollPhysics(),
              children: List.generate(
                onboardingData.length,
                ((index) => _getPage(onboardingData[index])),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _getDots(onboardingData.length, page),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }

  _getPage(OnboardingData data) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(height: 84),
      Image.asset(data.image, width: 343),
      SizedBox(height: 60),
      Text(data.title, style: AppStyles.getOnboardingTitle()),
      SizedBox(height: 20),
      Text(
        data.subtitle,
        textAlign: TextAlign.center,
        style: AppStyles.getOnboardingSubTitle(),
      ),
    ],
  );

  List<Container> _getDots(int n, int activeIndex) => List.generate(n, (index) {
    return Container(
      width: 12,
      height: 12,
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
