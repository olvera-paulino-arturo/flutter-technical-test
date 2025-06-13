part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class OnChangeTabEvent extends HomeEvent {
  final HomeTab tab;

  const OnChangeTabEvent({required this.tab});

  @override
  List<Object?> get props => <Object?>[tab];

}

class OnChangeIndexTabEvent extends HomeEvent {
  final int index;

  const OnChangeIndexTabEvent({required this.index});

  @override
  List<Object?> get props => <Object?>[index];

}
