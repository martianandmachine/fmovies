import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fmovies/src/features/home/domain/app_tab.dart';
import 'package:fmovies/src/features/home/domain/tab_event.dart';

class TabBloc extends Bloc<TabEvent, AppTabState> {
  @override
  AppTabState get initialState => ChangeTabState(AppTab.popular);

  @override
  Stream<AppTabState> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      yield ChangeTabState(event.tab);
    } else if (event is MovieSavedToFavorites) {
      final AppTab currentTab = (currentState as ChangeTabState).activeTab;
      yield ChangeTabState(currentTab, triggerAnimation: event.isMovieFavorite);
    }
  }
}
