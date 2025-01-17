import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/login/views/login_screen.dart';
import 'package:bookly_app/features/login/views/register_screen.dart';
import 'package:bookly_app/features/onboarding/views/onboarding_screen.dart';
import 'package:bookly_app/features/search/views/search_view.dart';
import 'package:bookly_app/features/splash/presentation/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/models/book_model/book_model.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import '../../features/home/presentation/views/book_details_view.dart';
import '../../features/login/views/welcome_screen.dart';
import 'service_locator.dart';

abstract class AppRouter {
  //  يعني مش هينفع اعمله اكسيس في اي حتة تانية
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/BookDetailsView';
  static const kSearchView = '/searchView';
  static const kLoginScreen = '/LoginScreen';
  static const kOnboardingScreen = '/OnboardingScreen';
  static const kRegisterScreen = '/RegisterScreen';
  static const kWelcomeScreen = '/WelcomeScreen';


  static final GoRouter router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
     GoRoute(
      path: kOnboardingScreen,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
        path: kWelcomeScreen,
        builder: (context, state) => const WelcomeScreen (),
      ),
    GoRoute(
        path: kLoginScreen,
        builder: (context, state) => const LoginScreen (),
      ),
    
      GoRoute(
        path: kRegisterScreen,
        builder: (context, state) => const RegisterScreen (),
      ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
     GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
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
