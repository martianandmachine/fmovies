import 'package:flutter/material.dart';

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
    }
  }
}
