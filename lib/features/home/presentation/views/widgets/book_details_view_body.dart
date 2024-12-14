import 'package:flutter/material.dart';

import 'Custom_Book_Details_App_Bar.dart';
import 'custom_book_item.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return  Column(
      children: [
       const  CustomBookDetailsAppBar(),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*0.17),
          child: const CustomBookImage(),
        ),
      ],
    );
  }
}

