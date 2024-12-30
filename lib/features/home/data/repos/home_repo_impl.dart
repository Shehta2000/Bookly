import 'package:bookly_app/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../models/book_model/book_model.dart';
import 'home_repo.dart';

abstract class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endpoint: '/volumes?Filtering=free-ebooks&Sorting=newest&q=subject:programming');

      List<BookModel> books = [];
      for (var item in data['items'] ?? []) {
        books.add(BookModel.fromJson(item));
      }
      return right(books); // Move the return statement outside the loop
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() {
    // Leave this unimplemented if it's intended to remain so.
    throw UnimplementedError();
  }
}
