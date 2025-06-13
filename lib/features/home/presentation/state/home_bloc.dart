import 'package:bloc/bloc.dart';
import 'package:contpaqi_technical_test/core/helper/secutity_storage.dart';
import 'package:contpaqi_technical_test/features/home/presentation/constants/home_tab.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitial(HomeTab.home,0)) {

    on<OnChangeTabEvent>((OnChangeTabEvent event, Emitter<HomeState> emit){
      final int index = HomeTab.values.indexWhere((HomeTab tab) => tab == event.tab);
      emit(HomeState(event.tab, index ));
    });

    on<OnChangeIndexTabEvent> ((OnChangeIndexTabEvent event, Emitter<HomeState> emit) {
      final HomeTab tab = HomeTab.values[event.index];

      if(tab == HomeTab.logout) {
        final SecurityStorage securityStorage = SecurityStorage();
        securityStorage.cleanAll();
        emit(const HomeLogout(HomeTab.home, 0));
      } else {
        emit(HomeState(tab, event.index));
      }

    });
  }
}
