import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
                 
          Image.asset(AssetsData.logo),
          const SizedBox(height: 2,),
         const Text('Read free Books',
         textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w500),)

      ],
    );
  }
}