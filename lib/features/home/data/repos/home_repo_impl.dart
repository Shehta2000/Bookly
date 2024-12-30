 import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/book_model/book_model.dart';
import 'home_repo.dart';

abstract class HomeRepoImpl implements HomeRepo{

 @override
  Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks();
   @override
     Future<Either<Failure,List<BookModel>>>fetchBestSellerBooks();


}