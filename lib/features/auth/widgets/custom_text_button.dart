// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../core/utils/styles.dart';
class CustomTextButton extends StatelessWidget {
   const CustomTextButton({
    super.key,
  required this.text,
  required this.onPressed});
   final String text;
  final  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Styles.textStyle16.copyWith(
          fontWeight: FontWeight.w900,
          color: Colors.white,
        ),
      ),
    );
  }
}
