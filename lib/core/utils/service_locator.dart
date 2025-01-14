import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/search/data/repos/search_repo.dart';
import 'package:bookly_app/features/search/data/repos/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'api_service.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
getIt.registerSingleton<ApiService>(ApiService(Dio(),),);

getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
  getIt.get<ApiService>()));
  getIt.registerSingleton<SearchRepo>(SearchRepoImpl(
  getIt.get<ApiService>()));

 
}

