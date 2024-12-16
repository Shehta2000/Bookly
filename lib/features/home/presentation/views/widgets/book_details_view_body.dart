import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'Custom_Book_Details_App_Bar.dart';
import 'books_action.dart';
import 'custom_book_item.dart';
import 'rating_book_details.dart';
import 'similar_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return  CustomScrollView(
      slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
           child:Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          const CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.2),
            child: const CustomBookImage(),
          ),
          const SizedBox(height: 45),
          const Text(
            'The Jungle Book',
            style: Styles.textStyle30,
          ),
          const SizedBox(height: 6),
          Opacity(
            opacity: 0.7,
            child: Text('Rudyard Kipling',
                style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)),
          ),
          const SizedBox(
            height: 16,
          ),
             const RatingDetailsBooks(),
             const SizedBox(height: 37,),
              const BooksAction(),
             const Expanded(child:  SizedBox(height: 50,)),
               Align(
                alignment: Alignment.centerLeft,
                 child: Text('You can also like', style: Styles.textStyle14.copyWith(
                  fontWeight: FontWeight.w600
                 ),),
               ),
               const SizedBox(height: 16,),
              const  SimilarBooksListView()
                                 ],
      ),
    ),
      )
      ],
    );
  
  }
}

