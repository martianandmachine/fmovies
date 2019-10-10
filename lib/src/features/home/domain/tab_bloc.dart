import 'package:fmovies/src/features/home/domain/app_tab.dart';
import 'package:fmovies/src/features/home/domain/tab_event.dart';
import 'package:bloc/bloc.dart';

class TabBloc extends Bloc<TabEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.popular;

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      yield event.tab;
    }
  }
}
