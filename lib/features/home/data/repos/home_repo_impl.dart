import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart'; // Required for compute

import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';

import '../../../../core/utils/api_service.dart';
import '../models/book_model/book_model.dart';

// Helper function for parsing books outside the class
List<BookModel> parseBooksFromData(Map<String, dynamic> data) {
  List<BookModel> books = [];
  if (data.containsKey('items') && data['items'] is List) {
    for (var item in data['items']) {
      try {
        books.add(BookModel.fromJson(item));
      } catch (e) {
        debugPrint('Error parsing book: $e');
      }
    }
  }
  return books;
}

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science');
      if (!data.containsKey('items')) {
        return left(ServerFailure('No items found in the response'));
      }

      // Ensure data is passed as Map<String, dynamic>
      Map<String, dynamic> dataMap = Map<String, dynamic>.from(data);
      List<BookModel> books = await compute(parseBooksFromData, dataMap);

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endPoint: 'volumes?Filtering=free-ebooks&q=subject:Programming');
      if (!data.containsKey('items')) {
        return left(ServerFailure('No items found in the response'));
      }

      Map<String, dynamic> dataMap = Map<String, dynamic>.from(data);
      List<BookModel> books = await compute(parseBooksFromData, dataMap);

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:$category');
      if (!data.containsKey('items')) {
        return left(ServerFailure('No items found in the response'));
      }

      Map<String, dynamic> dataMap = Map<String, dynamic>.from(data);
      List<BookModel> books = await compute(parseBooksFromData, dataMap);

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
