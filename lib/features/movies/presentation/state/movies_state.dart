part of 'movies_bloc.dart';

sealed class MoviesState extends Equatable {
  const MoviesState();
}

final class MoviesInitial extends MoviesState {
  @override
  List<Object> get props => <Object>[];
}

final class MoviesLoadingState extends MoviesState {
  @override
  List<Object?> get props => <Object>[];
}

final class MoviesErrorState extends MoviesState {
  @override
  List<Object?> get props => <Object>[];
}

final class MoviesSuccessState extends MoviesState {
  final List<MovieModel> movieList;

  const MoviesSuccessState({required this.movieList});
  @override
  List<Object?> get props => <Object>[movieList];
}