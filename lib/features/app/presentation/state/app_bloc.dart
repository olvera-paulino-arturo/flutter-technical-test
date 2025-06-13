import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final Locale locale;
  AppBloc(this.locale) : super(AppInitial(locale)) {
    on<AppEvent>((AppEvent event, Emitter<AppState> emit) {

    });

    on<OnChangeLocale>((OnChangeLocale event, Emitter<AppState> emit) {
      emit(AppState(event.locale));
    });

  }
}
