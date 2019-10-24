import 'package:fmovies/src/features/home/domain/app_tab.dart';

abstract class TabEvent {
  TabEvent();
}

class UpdateTab extends TabEvent {
  final AppTab tab;

  UpdateTab(this.tab);
}

class MovieSavedToFavorites extends TabEvent {
  final bool isMovieFavorite;

  MovieSavedToFavorites(this.isMovieFavorite);
}
