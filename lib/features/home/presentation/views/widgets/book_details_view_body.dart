import 'package:flutter/material.dart';

import 'Custom_Book_Details_App_Bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomBookDetailsAppBar(),
      ],
    );
  }
}

