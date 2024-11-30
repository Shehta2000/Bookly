
import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar  extends StatelessWidget {
  const CustomAppBar ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 55),
      child: Row(
        children: [
        Image.asset(AssetsData.logo,height: 20),
         const Spacer(flex: 1,),
        IconButton(onPressed: (){}, icon: const Icon(FontAwesomeIcons.magnifyingGlass , size: 24,))
        ],
      
      ),
    );
  }
}