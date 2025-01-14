import 'package:equatable/equatable.dart';

import '../../../../home/data/models/book_model/book_model.dart';

abstract class SearchState extends Equatable{
  const SearchState();
  @override
  List<Object?> get props =>[];
}

class SearchInitialState extends SearchState{}

class SearchLoadingState extends SearchState{
  
}

class SearchFailureState extends SearchState{
  final String errMessage;

  const SearchFailureState(this.errMessage);
}
class SearchSuccessState extends SearchState{
  final List<BookModel> books;

  const SearchSuccessState(this.books);

  get bookName => null;
}