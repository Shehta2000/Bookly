import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';  // Ensure the Failure class is properly imported

abstract class SearchRepo {
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({required String bookName});
}
