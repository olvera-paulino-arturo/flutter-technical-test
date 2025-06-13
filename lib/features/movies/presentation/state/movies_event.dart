part of 'movies_bloc.dart';

sealed class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class OnGetMoviesEvent extends MoviesEvent {
  final String language;

  const OnGetMoviesEvent({required this.language});
  @override
  List<Object?> get props => <Object?>[language];
}

class OnSelectMovieEvent extends MoviesEvent {
  @override
  List<Object?> get props => <Object?>[];
}