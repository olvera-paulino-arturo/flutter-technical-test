import 'package:contpaqi_technical_test/core/l10n/app_localizations.dart';
import 'package:contpaqi_technical_test/features/app/presentation/theme/catalogs/app_colors.dart';
import 'package:contpaqi_technical_test/features/home/presentation/constants/home_tab.dart';
import 'package:contpaqi_technical_test/features/home/presentation/constants/tab_content.dart';
import 'package:flutter/material.dart';

class TabGenerator {
  static List<BottomNavigationBarItem> generate(BuildContext context) {
    final List<HomeTab> tabs = HomeTab.values.toList();
    return List<BottomNavigationBarItem>.generate(tabs.length, (int index) {
      final TabContent tabContent = _getInfo(context, tabs[index]);
      return BottomNavigationBarItem(
        icon: Icon(tabContent.icon, color: AppColors.lightPrimaryColor,),
        label: tabContent.title,
      );
    });
  }

  static TabContent _getInfo(BuildContext context, HomeTab tab) {
    final AppLocalizations i18n = AppLocalizations.of(context)!;
    switch (tab) {
      case HomeTab.home:
        return TabContent(icon: Icons.movie_creation_outlined, title: i18n.homeTab);
      case HomeTab.logout:
        return TabContent(icon: Icons.logout, title: i18n.logoutTab);
    }
  }
}
