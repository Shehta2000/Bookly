import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomUserButton extends StatelessWidget {
  const CustomUserButton({
    super.key, required this.text, required this.onPressed,
    
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        minimumSize: const Size(400, 60),
      ), child: Text(text,style: Styles.textStyle30.copyWith(color: Colors.black, fontWeight: FontWeight.w500,fontSize: 30),),
    );
  }
}