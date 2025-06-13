import 'dart:io';

import 'package:contpaqi_technical_test/core/helper/theme_selector.dart';
import 'package:contpaqi_technical_test/core/l10n/app_localizations.dart';
import 'package:contpaqi_technical_test/core/router/app_pages.dart';
import 'package:contpaqi_technical_test/core/router/app_router.dart';
import 'package:contpaqi_technical_test/features/app/presentation/state/app_bloc.dart';
import 'package:contpaqi_technical_test/features/map/presentation/pages/map_page.dart';
import 'package:contpaqi_technical_test/features/movies/data/repositories/movies_repository.dart';
import 'package:contpaqi_technical_test/features/movies/domain/usecases/movies_usecase.dart';
import 'package:contpaqi_technical_test/features/movies/presentation/state/movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppBloc>(
          create:
              (BuildContext context) => AppBloc(Locale(Platform.localeName)),
        ),
        BlocProvider<MoviesBloc>(
          create:
              (BuildContext context) => MoviesBloc(
                moviesUseCase: MoviesUseCase(repository: MoviesRepository()),
              ),
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (BuildContext context, AppState state) {
          return MaterialApp(
            title: 'Contpaqi Technical Test',
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: ThemeSelector.getTheme(context),
            routes: AppRouter.routes,
            locale: state.locale,
            initialRoute: AppPages.auth.route,
          );
        },
      ),
    );
  }
}
