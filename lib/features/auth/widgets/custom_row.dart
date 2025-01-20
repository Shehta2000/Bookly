import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/app_router.dart';
import '../../../core/utils/styles.dart';
import 'custom_text_button.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: Styles.textStyle16.copyWith(
            fontWeight: FontWeight.w900,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
         CustomTextButton(
         onPressed: () => GoRouter.of(context).push(AppRouter.kLoginScreen),
         text: 'Login',
       ),
      ],
    );
  }
}


