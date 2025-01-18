import 'package:bookly_app/constans.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/app_router.dart';
import '../../../core/utils/assets.dart';

// Welcome Page
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        body: Container(   
          width: double.infinity,
          padding: const  EdgeInsets.symmetric(horizontal: 50),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 70 ,),
                 Image.asset(
                 
                  width: 300,
                  height: 300,
                  AssetsData.welcomeImage
                ),
                const  SizedBox(height: 10),
                 Center(
                  child: Text('Welcome to Endless Books!',
                  textAlign: TextAlign.left,
                   style:  Styles.textStyle30.copyWith(fontWeight: FontWeight.w900)),
                ),
                
               
                const SizedBox(height: 200),
                ElevatedButton(
                  
                  onPressed: () => GoRouter.of(context).push(AppRouter.kLoginScreen),
                  style: ElevatedButton.styleFrom(minimumSize: const   Size(double.infinity, 50), backgroundColor: Colors.white),
                  child:  Text('Login', style:  Styles.textStyle20.copyWith(color: kPrimaryColor),
                  
                  ),
                ),
                const SizedBox(height: 16),
                OutlinedButton(
                  onPressed: () => GoRouter.of(context).push(AppRouter.kRegisterScreen),
                  style:  OutlinedButton.styleFrom(minimumSize: const  Size(double.infinity, 50)),
                  child:   Text('Register',style: Styles.textStyle20.copyWith(color: Colors.white),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

