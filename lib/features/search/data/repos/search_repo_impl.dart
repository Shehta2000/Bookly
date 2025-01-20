import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // For compute

import '../../../../core/errors/failure.dart';
import '../repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({required String bookName}) async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?Filtering=free-ebooks&q=$bookName',
      );

      // Ensure data['items'] is a List<dynamic>
      if (data['items'] is List) {
        List<BookModel> books = await compute(parseBooks, List<dynamic>.from(data['items']));
        return right(books);
      } else {
        return left(ServerFailure("Unexpected data format"));
      }
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

// Helper function to parse books (runs in a separate isolate)
List<BookModel> parseBooks(List<dynamic> items) {
  return items.map((item) => BookModel.fromJson(item)).toList();
}
