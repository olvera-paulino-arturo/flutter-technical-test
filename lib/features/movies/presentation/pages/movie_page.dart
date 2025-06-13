import 'package:contpaqi_technical_test/core/l10n/app_localizations.dart';
import 'package:contpaqi_technical_test/core/router/app_pages.dart';
import 'package:contpaqi_technical_test/core/router/app_router.dart';
import 'package:contpaqi_technical_test/features/app/presentation/constants/load_state_status.dart';
import 'package:contpaqi_technical_test/features/app/presentation/state/app_bloc.dart';
import 'package:contpaqi_technical_test/features/app/presentation/widgets/card_container.dart';
import 'package:contpaqi_technical_test/features/movies/presentation/state/movies_bloc.dart';
import 'package:contpaqi_technical_test/features/movies/presentation/widgets/movie_item.dart';
import 'package:contpaqi_technical_test/features/movies/presentation/widgets/movies_state_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  Future<void> onLoad(BuildContext context) async {
    final Locale currentLocale = context.read<AppBloc>().locale;
    context.read<MoviesBloc>().add(OnGetMoviesEvent(language: currentLocale.languageCode));
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations i18n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(i18n.moviePageTitle)),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: RefreshIndicator(
          onRefresh: () => onLoad(context),
          child: BlocConsumer<MoviesBloc, MoviesState>(
            builder: (BuildContext context, MoviesState state) {
              if (state is MoviesInitial) {
                onLoad(context);
              }
              return ConditionalSwitch.single(
                context: context,
                valueBuilder: (BuildContext context) => state.runtimeType,
                caseBuilders: <Type, Widget Function(BuildContext context)>{
                  MoviesSuccessState: (BuildContext context) {
                    final MoviesSuccessState successModel =
                        state as MoviesSuccessState;
                    return ListView.builder(
                      scrollDirection: Axis.vertical,

                      itemCount: successModel.movieList.length,
                      itemBuilder:
                          (BuildContext context, int index) => CardContainer(
                            onAction: () {
                              AppRouter.navigateParams(context, AppPages.moviesDetail, successModel.movieList[index]);
                            },
                            child: MovieItem(
                              title: successModel.movieList[index].title,
                              description:
                              successModel.movieList[index].overview,
                              isWrapped: true,
                            ),
                          ),
                    );
                  },
                  MoviesLoadingState:
                      (BuildContext context) => const MoviesStateIndicator(
                        status: LoadStateStatus.loading,
                      ),
                  MoviesErrorState:
                      (BuildContext context) => MoviesStateIndicator(
                        status: LoadStateStatus.error,
                        onRefresh: () => onLoad(context),
                      ),
                },
              );
            },
            listener: (BuildContext context, MoviesState state) {},
          ),
        ),
      ),
    );
  }
}
