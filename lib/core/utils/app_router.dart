import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/splash/presentation/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {  //  يعني مش هينفع اعمله اكسيس في اي حتة تانية 
 static const  kHomeView = '/homeView'; 
  static final  GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: ( context,  state) => const  SplashView(),
    ),
     GoRoute(
      path: kHomeView,
      builder: ( context,  state) => const  HomeView(),
    )
  ]
  );
      }
 