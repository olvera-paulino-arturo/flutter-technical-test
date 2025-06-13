import 'package:contpaqi_technical_test/core/l10n/app_localizations.dart';
import 'package:contpaqi_technical_test/core/constants/server_configuration.dart';
import 'package:contpaqi_technical_test/core/router/app_pages.dart';
import 'package:contpaqi_technical_test/core/router/app_router.dart';
import 'package:contpaqi_technical_test/features/app/presentation/theme/catalogs/app_colors.dart';
import 'package:contpaqi_technical_test/features/app/presentation/widgets/app_button.dart';
import 'package:contpaqi_technical_test/features/movies/data/models/movie.dart';
import 'package:contpaqi_technical_test/features/movies/domain/models/movie_model.dart';
import 'package:contpaqi_technical_test/features/movies/presentation/widgets/info_chip.dart';
import 'package:contpaqi_technical_test/features/movies/presentation/widgets/movie_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations i18n = AppLocalizations.of(context)!;

    final Object? args = ModalRoute
        .of(context)!
        .settings
        .arguments;

    return Conditional.single(
      context: context,
      conditionBuilder: (BuildContext context) => args is MovieModel,
      widgetBuilder: (BuildContext context) {
        final MovieModel movie = args as MovieModel;
        return Scaffold(
          appBar: AppBar(title: Text(i18n.movieDetailsPageTitle)),
          body: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 22,
                  children: <Widget>[
                    Image.network(
                      '${ServerConfiguration.imageURL}${movie.posterPath}',
                      height: 150, width: 85,),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        InfoChip(date: movie.releaseDate,
                          title: i18n.movieReleaseDateTitle,
                          color: Theme
                              .of(context)
                              .primaryColor,),
                        InfoChip(date: movie.originalLanguage,
                          title: i18n.movieOriginalLanguageTitle,
                          color: AppColors.lightSecondaryColor,)
                      ],
                    )
                  ],
                ),
                MovieItem(title: movie.title,
                  description: movie.overview,
                  isWrapped: false,),

                const Spacer(),

                Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: AppButton(title: i18n.buttonCinemaSearch,
                      iconData: Icons.place,
                      onPress: () {
                        AppRouter.navigate(context, AppPages.maps);
                      },))
              ],
            ),
          ),

        );
      },
      fallbackBuilder: (BuildContext context) {
        Navigator.pop(context);
        return Scaffold(
          body: Container(),
        );
      },
    );
  }
}