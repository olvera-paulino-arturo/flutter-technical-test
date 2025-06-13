import 'package:bloc/bloc.dart';
import 'package:contpaqi_technical_test/features/movies/domain/models/movie_language_request.dart';
import 'package:contpaqi_technical_test/features/movies/domain/models/movie_model.dart';
import 'package:contpaqi_technical_test/features/movies/domain/usecases/movies_usecase.dart';
import 'package:equatable/equatable.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesUseCase moviesUseCase;

  MoviesBloc({required this.moviesUseCase}) : super(MoviesInitial()) {
    on<MoviesEvent>((MoviesEvent event, Emitter<MoviesState> emit) {});

    on<OnGetMoviesEvent>((OnGetMoviesEvent event, Emitter<MoviesState> emit) async {
      emit(MoviesLoadingState());
      try {
        final List<MovieModel> result = await moviesUseCase.execute(MovieLanguageRequest(language: event.language));
        emit(MoviesSuccessState(movieList: result));
      } catch(e) {
        emit(MoviesErrorState());
      }
    });
  }
}
