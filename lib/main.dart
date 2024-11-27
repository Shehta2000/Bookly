import 'package:bookly_app/features/splash/presentation/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Bookly());
}
class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
         debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
