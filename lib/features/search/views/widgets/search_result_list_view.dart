import 'package:bookly_app/features/search/views/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/widgets/custom_error_widget.dart';
import '../../../home/presentation/views/widgets/bestseller_list_view_item.dart';
import '../../presentation/manager/cubit/search_books_cubit.dart';
import '../../presentation/manager/cubit/search_books_state.dart';

class SearchtListView extends StatelessWidget {
  const SearchtListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitialState) {
          // In the beginning, there is no loading (No Loading Indicator)
          return const Center(child: Text('Search for a book'));
        } else if (state is SearchSuccessState) {
          // Check if the books are null or empty
          if (state.books == null || state.books.isEmpty) {
            return const Center(child: Text('No results found'));
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                // Execute the search again when swiping down
                BlocProvider.of<SearchCubit>(context).fetchSearchBooks(
                  bookName: context.read<SearchCubit>().searchController.text,
                );
              },
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.books.length, // Number of books available
                itemBuilder: (context, index) {
                  // Check for potential null values in book properties
                  final book = state.books[index];
                  if (book == null) {
                    return const SizedBox(); // Avoid null book items
                  }

                  return InkWell(
                    onTap: () => GoRouter.of(context)
                        .pushNamed('/searchview', extra: book),
                    child: BestSellerListVewItem(
                      bookModel: book,
                    ),
                  );
                },
              ),
            );
          }
        } else if (state is SearchFailureState) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is SearchLoadingState) {
          // Show loading indicator only when searching
          return const Center(child: CustomLoadingIndicator());
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
