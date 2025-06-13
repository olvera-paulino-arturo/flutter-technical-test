import 'package:contpaqi_technical_test/core/l10n/app_localizations.dart';
import 'package:contpaqi_technical_test/core/router/app_pages.dart';
import 'package:contpaqi_technical_test/core/router/app_router.dart';
import 'package:contpaqi_technical_test/core/constants/asset_path.dart';
import 'package:contpaqi_technical_test/features/app/presentation/widgets/app_button.dart';
import 'package:contpaqi_technical_test/features/app/presentation/widgets/item_loading.dart';
import 'package:contpaqi_technical_test/features/app/presentation/widgets/segment_languange.dart';
import 'package:contpaqi_technical_test/features/auth/presentation/pages/auth_provider.dart';
import 'package:contpaqi_technical_test/features/auth/presentation/state/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations i18n = AppLocalizations.of(context)!;

    return AuthProvider(
      child: Scaffold(
        appBar: AppBar(title: Text(i18n.authPage)),
        body: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[SegmentLanguage()],
              ),

              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 16,
                  ),
                  child: const Image(image: AssetImage(AssetPath.appIcon)),
                ),
              ),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 18),
                child: Text(
                  i18n.authTitle,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              BlocConsumer<AuthBloc, AuthState>(
                builder: (BuildContext context, AuthState state) {
                  if (state.runtimeType == AuthInitial) {
                    context.read<AuthBloc>().add(OnCheckStoreLoginEvent());
                  }

                  return ConditionalSwitch.single(
                    context: context,
                    valueBuilder: (BuildContext context) => state.runtimeType,
                    caseBuilders: <Type, Widget Function(BuildContext context)>{
                      AuthLoadingState:
                          (BuildContext context) => const ItemLoading(),
                      AuthNotStorageState:
                          (BuildContext context) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: AppButton(
                          title: i18n.authButton,
                          onPress: () => context.read<AuthBloc>().add(const OnOAuthLoginEvent()),
                        ),
                      ),
                      AuthStorageState:
                          (BuildContext context) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: AppButton(
                          title: i18n.authButtonLog,
                          onPress:
                              () => context.read<AuthBloc>().add(
                            OnBiometricLoginEvent(
                              message: i18n.authBiometricMessage,
                            ),
                          ),
                        ),
                      ),
                    },
                  );
                },
                listener: (BuildContext context, AuthState state) {
                  if (state.runtimeType == AuthSuccessState) {
                    AppRouter.navigateWithReplace(context, AppPages.home);
                  }
                  else if (state.runtimeType == AuthNotProvideState) {
                    context.read<AuthBloc>().add(OnCheckStoreLoginEvent());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}