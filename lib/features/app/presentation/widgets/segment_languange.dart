import 'package:contpaqi_technical_test/core/l10n/app_localizations.dart';
import 'package:contpaqi_technical_test/features/app/presentation/constants/language.dart';
import 'package:contpaqi_technical_test/features/app/presentation/helpers/language_helper.dart';
import 'package:contpaqi_technical_test/features/app/presentation/state/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SegmentLanguage extends StatelessWidget {
  const SegmentLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations i18n = AppLocalizations.of(context)!;
    return BlocBuilder<AppBloc, AppState>(builder: ( BuildContext context, AppState state) {

      return Container(
        margin: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          spacing: 5,
          children: <Widget>[
            Text(i18n.language),
            SegmentedButton<Language>(
              segments: LanguageHelper.generate(context),
              selected: <Language>{LanguageHelper.currentLanguage(state.locale)},
              onSelectionChanged: (Set<Language> value) {
                context.read<AppBloc>().add(OnChangeLocale(locale: LanguageHelper.languageParse(value.first)));
              },
            )
          ],
        ),
      );
    });
  }
}
