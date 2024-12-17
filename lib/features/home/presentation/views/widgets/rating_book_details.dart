import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';

class RatingDetailsBooks extends StatelessWidget {
  const RatingDetailsBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star,
          color: Color(0XFFFFDD4F),
          size: 26,
        ),
        const SizedBox(
          width: 3,
        ),
        const Text(
          '4.8',
          style: Styles.textStyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '(2520)',
          style: Styles.textStyle14.copyWith(color: const Color(0XFF707070)),
        )
      ],
    );
  }
}
