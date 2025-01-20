import 'package:bookly_app/features/onboarding/widgets/custom_elevatedbutton.dart';
import 'package:bookly_app/features/onboarding/widgets/custom_list_generated.dart';
import 'package:flutter/material.dart';

class CustomOnboardingStack extends StatelessWidget {
  const CustomOnboardingStack({
    super.key,
    required List<Map<String, String>> onboardingData,
    required int currentPage,
    required PageController pageController,
  })  : _onboardingData = onboardingData,
        _currentPage = currentPage,
        _pageController = pageController;

  final List<Map<String, String>> _onboardingData;
  final int _currentPage;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      alignment: Alignment.center,
      children: [
        Image.asset(
          _onboardingData[_currentPage]['image']!,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _onboardingData[_currentPage]['title']!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                _onboardingData[_currentPage]['subtitle']!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 189, 187, 187),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        CustomListGenerated(
          onboardingData: _onboardingData,
          currentPage: _currentPage,
        ),
        CustomElevatedButton(
          currentPage: _currentPage,
          onboardingData: _onboardingData,
          pageController: _pageController,
        ),
      ],
    );
  }
}
