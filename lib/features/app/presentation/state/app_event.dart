part of 'app_bloc.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();
}

class OnChangeLocale extends AppEvent {
  final Locale locale;
  const OnChangeLocale({required this.locale});

  @override
  List<Object?> get props => <Object?>[locale];

}
