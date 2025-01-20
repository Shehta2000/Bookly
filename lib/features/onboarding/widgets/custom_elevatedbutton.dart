// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constans.dart';
import '../../../core/utils/app_router.dart';
import '../../../core/utils/styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required int currentPage,
    required List<Map<String, String>> onboardingData,
    required PageController pageController,
  }) : _currentPage = currentPage, _onboardingData = onboardingData, _pageController = pageController;

  final int _currentPage;
  final List<Map<String, String>> _onboardingData;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 50,
      child: ElevatedButton(
        
        onPressed: () async {
          if (_currentPage == _onboardingData.length - 1) {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setBool('onboarding_completed', true);
            GoRouter.of(context).replace(AppRouter.kWelcomeScreen);
          } else {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 50),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          _currentPage == _onboardingData.length - 1
              ? "Get Started"
              : "Next",
          style: Styles.textStyle18.copyWith(color: kPrimaryColor),
        ),
      ),
    );
  }
}
