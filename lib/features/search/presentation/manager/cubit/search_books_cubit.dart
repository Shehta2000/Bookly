import 'package:bookly_app/features/search/presentation/manager/cubit/search_books_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../home/data/models/book_model/book_model.dart';
import '../../../data/repos/search_repo.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitialState());

  final SearchRepo searchRepo;

  static SearchCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> fetchSearchBooks({required String bookName}) async {
    emit(SearchLoadingState());
    try {
      Either<Failure, List<BookModel>> result =
          await searchRepo.fetchSearchBooks(bookName: bookName);
      result.fold(
        (failure) => emit(SearchFailureState(failure.errMessage)),
        (books) => emit(SearchSuccessState(books)),
      );
    } catch (e) {
      emit(SearchFailureState(e.toString()));
    }
  }

  TextEditingController searchController = TextEditingController();
}
