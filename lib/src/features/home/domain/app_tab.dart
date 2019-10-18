import 'package:flutter/material.dart';

class AppTabState {
  AppTabState();
}

class ChangeTabState extends AppTabState {
  final AppTab activeTab;
  final bool triggerAnimation;

  ChangeTabState(this.activeTab, {this.triggerAnimation});
}

enum AppTab { popular, favorites, cinemas }

class AppTabHelper {
  static Icon getIcon(AppTab appTab) {
    switch (appTab) {
      case AppTab.popular:
        return Icon(Icons.movie);
      case AppTab.favorites:
        return Icon(Icons.favorite);
      case AppTab.cinemas:
        return Icon(Icons.place);
      default:
        throw Exception('Invalid tab icon');
    }
  }

  static String getTitle(AppTab appTab) {
    switch (appTab) {
      case AppTab.popular:
        return 'Popular';
      case AppTab.favorites:
        return 'Favorites';
      case AppTab.cinemas:
        return 'Cinemas';
      default:
        throw Exception('Invalid tab title');
    }
  }
}
