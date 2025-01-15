// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_book_item.dart';

import '../../../../../constans.dart';
import '../../../../../core/utils/styles.dart';

class BestSellerListVewItem extends StatelessWidget {
  const BestSellerListVewItem({
    super.key,
    required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        bookModel.volumeInfo.imageLinks?.thumbnail ?? 'https://via.placeholder.com/150';
    final String title = bookModel.volumeInfo.title ?? 'No Title Available';
    final String author = (bookModel.volumeInfo.authors?.isNotEmpty ?? false)
        ? bookModel.volumeInfo.authors![0]
        : 'Unknown Author';
    final num rating = bookModel.volumeInfo.averageRating ?? 0;
    final int ratingsCount = bookModel.volumeInfo.ratingsCount ?? 0;

    return GestureDetector(
      onTap: () {
        // Ensure book details can handle null safely
        if (bookModel.volumeInfo.title == null || bookModel.volumeInfo.authors == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('This book has incomplete details')),
          );
        } else {
          GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
        }
      },
      child: SizedBox(
        height: 150,
        child: Row(
          children: [
            CustomBookImage(imageUrl: imageUrl),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20.copyWith(
                      fontFamily: kGTSectraFine,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    author,
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(flex: 2),
                      BookRating(
                        rating: rating.round(),
                        count: ratingsCount,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
