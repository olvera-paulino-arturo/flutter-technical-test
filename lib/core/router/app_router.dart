import 'package:contpaqi_technical_test/core/router/app_pages.dart';
import 'package:contpaqi_technical_test/features/auth/presentation/pages/auth_page.dart';
import 'package:contpaqi_technical_test/features/home/presentation/pages/home_page.dart';
import 'package:contpaqi_technical_test/features/map/presentation/pages/map_page.dart';

import 'package:contpaqi_technical_test/features/movies/presentation/pages/movie_details_page.dart';
import 'package:flutter/material.dart' show BuildContext, Navigator, WidgetBuilder;

class AppRouter {
  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    AppPages.home.route: (BuildContext context) => const HomePage(),
    AppPages.auth.route: (BuildContext context) => const AuthPage(),
    AppPages.maps.route: (BuildContext context) => const MapPage(),
    AppPages.moviesDetail.route: (BuildContext context) => const MovieDetailsPage(),
  };


  static void navigateWithReplace(BuildContext context, AppPages route) {
    Navigator.pushReplacementNamed(context, route.route);
  }

  static void navigate(BuildContext context, AppPages route) {
    Navigator.pushNamed(context, route.route);
  }

  static void navigateParams<T>(BuildContext context, AppPages route, T params) {
    Navigator.pushNamed(context, route.route, arguments: params);
  }

}
