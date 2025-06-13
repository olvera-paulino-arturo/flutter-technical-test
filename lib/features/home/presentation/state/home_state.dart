part of 'home_bloc.dart';

final class HomeState extends Equatable {
  final HomeTab tab;
  final int index;

  const HomeState(this.tab, this.index);

  @override
  List<Object?> get props => <Object?>[tab, index];
}

final class HomeInitial extends HomeState {
  const HomeInitial(super.tab, super.index);
}

final class HomeLogout extends HomeState {
  const HomeLogout(super.tab, super.index);

}

