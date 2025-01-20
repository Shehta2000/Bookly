import 'package:flutter/material.dart';

class CustomListGenerated extends StatelessWidget {
  const CustomListGenerated({
    super.key,
    required List<Map<String, String>> onboardingData,
    required int currentPage,
  }) : _onboardingData = onboardingData, _currentPage = currentPage;

  final List<Map<String, String>> _onboardingData;
  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(
                      _onboardingData.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: _currentPage == index ? 12 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentPage == index
       ? Colors.blue
       : Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
    );
  }
}

