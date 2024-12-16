import 'package:flutter/material.dart';
import 'Custom_Book_Details_App_Bar.dart';
import 'books_details_section.dart';
import 'similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const  CustomScrollView(
      slivers: [
      SliverFillRemaining(
           child: Padding(
      padding:  EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
           CustomBookDetailsAppBar(),
          BooksDetailsSection(),
           Expanded(child:  SizedBox(height: 50,)),
            SimilarBooksSection(),
            
         ],
      ),
    ),
      )
      ],
    );
  
  }
}
