import 'package:bookly_app/constans.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/app_router.dart';
import '../../core/utils/assets.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
   
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return   SafeArea(
      child:  Scaffold(
        backgroundColor: kPrimaryColor,
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               SizedBox(
                height: height * 0.83,
                width: width * 1.2,
                
                child: Image.asset('assets/images/onboarding_image.png')),

           
                Row(
                  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Align(
                     alignment: Alignment.bottomCenter,
                     child: ElevatedButton(
                      
                               onPressed: () {
                                 GoRouter.of(context).push(AppRouter.kHomeView);
                               },
                               style: ElevatedButton.styleFrom(
                                 backgroundColor: Colors.white,
                                 padding:  const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                               ),
                               child: Row(
                                 
                                 mainAxisSize: MainAxisSize.min, // جعل الزر بحجم المحتوى فقط
                                 children: [
                                   Text(
                                     
                                     "Explore Free Books",
                                     style: Styles.textStyle18.copyWith(color: kPrimaryColor),
                                   ),
                                   const  SizedBox(width: 10), // مساحة بين النص والأيقونة
                                   const Icon(Icons.arrow_forward, size: 25, color: kPrimaryColor),
                                 ],
                                 
                               ),
                               
                             ),
                   ),
                    
                ])
              
            ],
            
          ),
        ),
        
        );
    
  }
}