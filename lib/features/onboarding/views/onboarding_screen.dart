// ignore_for_file: use_build_context_synchronously

import 'package:bookly_app/constans.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/onboarding/widgets/custom_stack.dart';
import 'package:flutter/material.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      "title": "Discover Thousands of Books",
      "subtitle": "A vast library awaits you.",
      "image": AssetsData.onbarding1
    },
    {
      "title": "Read Anytime, Anywhere",
      "subtitle": "Enjoy reading on the go.",
      "image": AssetsData.onbarding2
    },
    {
      "title": "Books Just for You",
      "subtitle": " Tailored books for your taste .",
      "image": AssetsData.onbarding3
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) {
                  return CustomOnboardingStack(onboardingData: _onboardingData, currentPage: _currentPage, pageController: _pageController);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

