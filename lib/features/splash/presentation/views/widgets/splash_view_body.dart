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

      // التحقق من حالة التسجيل (isLoggedIn)
      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      // التحقق من حالة Onboarding (onboarding_completed)
      bool isOnboardingCompleted = prefs.getBool('onboarding_completed') ?? false;

      // تأخير عرض شاشة السبلاش
      await Future.delayed(const Duration(seconds: 2));

      // تحديد الشاشة التي سيذهب إليها المستخدم بناءً على حالته
      if (!isOnboardingCompleted) {
        // إذا لم يتم الانتهاء من Onboarding، يتم توجيه المستخدم إلى شاشة Onboarding
        if (mounted) {
          GoRouter.of(context).replace(AppRouter.kOnboardingScreen);
        }
      } else {
        // إذا كانت Onboarding مكتملة، يتم التوجيه إلى شاشة تسجيل الدخول أو الصفحة الرئيسية
        if (isLoggedIn) {
          // إذا كان قد سجل الدخول بنجاح، يذهب إلى الصفحة الرئيسية
          if (mounted) {
            GoRouter.of(context).replace(AppRouter.kHomeView);
          }
        } else {
          // إذا لم يكن قد سجل الدخول، يذهب إلى شاشة تسجيل الدخول
          if (mounted) {
            GoRouter.of(context).replace(AppRouter.kLoginScreen);
          }
        }
      }
    } catch (e) {
      debugPrint("Error loading preferences: $e"); // التعامل مع الأخطاء
    }
  }
}
