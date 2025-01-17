import 'package:bookly_app/constans.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/app_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

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
      "image": "assets/images/Image_onboarding_1.png"
    },
    {
      "title": "Read Anytime, Anywhere",
      "subtitle": "Enjoy reading on the go.",
      "image": "assets/images/Onbarding 2.png"
    },
    {
      "title": "Books Just for You",
      "subtitle": " Tailored books for your taste .",
      "image": "assets/images/onbarding 3.png"
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
                  return Stack(
                    fit: StackFit.expand,
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        
                        _onboardingData[index]['image']!,
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
                              
                              _onboardingData[index]['title']!,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              _onboardingData[index]['subtitle']!,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 189, 187, 187),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                     const  SizedBox(height: 10),
                       Positioned(
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
                       ),
            
            Positioned(
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
            ),
                    ],
                  );
                },
              ),
            ),
           
          
          ],
        ),
      ),
    );
  }
}
