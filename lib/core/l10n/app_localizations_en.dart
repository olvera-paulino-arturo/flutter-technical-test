// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get moviePageTitle => 'Movies';

  @override
  String get movieDetailsPageTitle => 'Movie Details';

  @override
  String get movieReleaseDateTitle => 'Release date';

  @override
  String get movieOriginalLanguageTitle => 'Original language';

  @override
  String get buttonCinemaSearch => 'Find cinema';

  @override
  String get homeTab => 'Home';

  @override
  String get logoutTab => 'Logout';

  @override
  String get authPage => 'Login';

  @override
  String get authTitle => 'Sign In';

  @override
  String get authButton => 'Enter with OAuth';

  @override
  String get authButtonLog => 'Enter with Biometric';

  @override
  String get authBiometricMessage => 'Please authenticate to sign in.';

  @override
  String get language => 'Language:';

  @override
  String get spanishLabel => 'Spanish';

  @override
  String get englishLabel => 'English';
}
