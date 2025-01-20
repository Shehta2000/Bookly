import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sliding_text.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({super.key});

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

     _navigateToNextScreen();
  }

  @override
  void dispose() {
    super.dispose();


    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 4,
        ),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);

    animationController.forward();
  }
  
  

Future<void> _navigateToNextScreen() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isOnboardingCompleted = prefs.getBool('onboarding_completed');

    // Simulate a delay for the splash screen
    await Future.delayed(const Duration(seconds: 2));

    if (isOnboardingCompleted == null || !isOnboardingCompleted) {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).replace(AppRouter.kOnboardingScreen);
    } else {
      // ignore: use_build_context_synchronously
      GoRouter.of(context).replace(AppRouter.kHomeView);
    }
  } catch (e) {
    // ignore: avoid_print
    print("Error loading preferences: $e"); // Handle errors
  }
}

}
