import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'books_action.dart';
import 'custom_book_item.dart';
import 'rating_book_details.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child:  CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(height: 45),
         Text(
          textAlign: TextAlign.center,
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text( bookModel.volumeInfo.authors![0],style: Styles.textStyle18.copyWith(
                  fontWeight: FontWeight.w500, fontStyle: FontStyle.italic)),
             ),
        
        const SizedBox(
          height: 16,
        ),
         RatingDetailsBooks(
          bookModel: bookModel,
        ),
        const SizedBox(
          height: 37,
        ),
         BooksAction(
          bookModel: bookModel,
        ),
      ],
    );
  }
}
