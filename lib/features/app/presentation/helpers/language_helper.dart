import 'package:contpaqi_technical_test/core/l10n/app_localizations.dart';
import 'package:contpaqi_technical_test/features/app/presentation/constants/language.dart';
import 'package:flutter/material.dart';

class LanguageHelper {
  static List<ButtonSegment<Language>> generate(BuildContext context) {
    final List<Language> languages = Language.values;
    return List<ButtonSegment<Language>>.generate(languages.length, (int index) => _build(context, languages[index]));
  }

  static Language currentLanguage(Locale locale) {

    final List<String> codes = locale.languageCode.split('_');

    if(codes.isNotEmpty) {
      final String code = codes[0];
      final Language result = Language.values.firstWhere((Language language) => code == language.code);

      return result;
    } else {
      return Language.values.first;
    }
  }
  
  static Locale languageParse(Language language) {
    return Locale(language.code);
  }
  
  static ButtonSegment<Language> _build(BuildContext context, Language language) {
    final AppLocalizations i18n = AppLocalizations.of(context)!;
    switch(language) {
      case Language.spanish:
        return ButtonSegment<Language>(value: Language.spanish, label: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(i18n.spanishLabel, style: Theme.of(context).textTheme.labelMedium,),
        ));
        
      case Language.english:
        return ButtonSegment<Language>(value: Language.english, label: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(i18n.englishLabel, style: Theme.of(context).textTheme.labelMedium),
        ));
    }
    
  }
}