import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/search/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/models/book_model/book_model.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import '../../features/home/presentation/views/book_details_view.dart';
import 'service_locator.dart';

abstract class AppRouter {
  //  يعني مش هينفع اعمله اكسيس في اي حتة تانية
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/BookDetailsView';
  static const kSearchView = '/searchView';

  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
     GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kBookDetailsView,
      builder: (context, state) => BlocProvider(
        create: (context) => SimilarBooksCubit(
          getIt.get<HomeRepoImpl>(),
        ),
        child: BookDetailsView(
          bookModel: state.extra as BookModel,
        ),
      ),
    )
  ]);
}
