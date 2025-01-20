import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
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
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // خلفية السبلاش
          
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AssetsData.logo),
              const SizedBox(height: 16),
              SlidingText(slidingAnimation: slidingAnimation),
            ],
          ),
        ],
      ),
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
      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

      // تأخير عرض شاشة السبلاش
      await Future.delayed(const Duration(seconds: 2));

      // التنقل بناءً على حالة تسجيل الدخول
      if (isLoggedIn) {
        if (mounted) {
          GoRouter.of(context).replace(AppRouter.kHomeView);
        }
      } else {
        if (mounted) {
          GoRouter.of(context).replace(AppRouter.kLoginScreen);
        }
      }
    } catch (e) {
      debugPrint("Error loading preferences: $e"); // التعامل مع الأخطاء
    }
  }
}
