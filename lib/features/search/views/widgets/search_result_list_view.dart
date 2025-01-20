import 'package:bookly_app/features/search/views/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return const Center(child: Text('Search for a book'));
        } else if (state is SearchSuccessState) {
          if (state.books.isEmpty) {
            return const Center(child: Text('No results found'));
          } else {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<SearchCubit>(context).fetchSearchBooks(
                  bookName: context.read<SearchCubit>().searchController.text,
                );
              },
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  final book = state.books[index];

                  return BestSellerListVewItem(
                    bookModel: book,
                  );
                },
              ),
            );
          }
        } else if (state is SearchFailureState) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is SearchLoadingState) {
          return const Center(child: CustomLoadingIndicator());
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
