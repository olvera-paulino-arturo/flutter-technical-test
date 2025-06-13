// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get moviePageTitle => 'Películas';

  @override
  String get movieDetailsPageTitle => 'Detalles de la pelicula';

  @override
  String get movieReleaseDateTitle => 'Fecha de estreno';

  @override
  String get movieOriginalLanguageTitle => 'Idioma original';

  @override
  String get buttonCinemaSearch => 'Encontrar cine';

  @override
  String get homeTab => 'Inicio';

  @override
  String get logoutTab => 'Salir';

  @override
  String get authPage => 'Login';

  @override
  String get authTitle => 'Incia Sesión';

  @override
  String get authButton => 'Ingresa con OAuth';

  @override
  String get authButtonLog => 'Ingresa con Biometría';

  @override
  String get authBiometricMessage => 'Por favor, autentíquese para iniciar sesión.';

  @override
  String get language => 'Idioma:';

  @override
  String get spanishLabel => 'Español';

  @override
  String get englishLabel => 'Inglés';
}
