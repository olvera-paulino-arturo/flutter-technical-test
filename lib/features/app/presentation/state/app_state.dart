part of 'app_bloc.dart';

class AppState extends Equatable {
  final Locale locale;
  const AppState(this.locale);

  @override
  List<Object?> get props => <Object?>[locale];
}

final class AppInitial extends AppState {
  const AppInitial(super.locale);

}
