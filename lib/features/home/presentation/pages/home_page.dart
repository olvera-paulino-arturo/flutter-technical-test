import 'package:contpaqi_technical_test/core/router/app_pages.dart';
import 'package:contpaqi_technical_test/core/router/app_router.dart';
import 'package:contpaqi_technical_test/features/home/presentation/constants/home_tab.dart';
import 'package:contpaqi_technical_test/features/home/presentation/state/home_bloc.dart';
import 'package:contpaqi_technical_test/features/home/presentation/widgets/bottom_bar.dart';
import 'package:contpaqi_technical_test/features/movies/presentation/pages/movie_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc(),
      child: Scaffold(
        body: BlocConsumer<HomeBloc, HomeState>(
            builder: (BuildContext context, HomeState state) {
          return ConditionalSwitch.single<HomeTab>(
              context: context,
              valueBuilder: (BuildContext context)=> state.tab,
              caseBuilders: <HomeTab, Widget Function(BuildContext context)>{
                HomeTab.home: (BuildContext context) => const MoviePage()
              });
        }, listener: (BuildContext context, HomeState state) {
              if(state.runtimeType == HomeLogout) {
                AppRouter.navigateWithReplace(context, AppPages.auth);
              }
        },),
        bottomNavigationBar: BlocBuilder<HomeBloc, HomeState>(
          builder: (BuildContext context, HomeState state) {
            return BottomBar(currentIndex: state.index, onSelect: (int value) {
              context.read<HomeBloc>().add(OnChangeIndexTabEvent(index: value));
            },
            );
          },
        ),
      ),
    );
  }
}
