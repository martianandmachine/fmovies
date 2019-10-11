import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/features/home/domain/app_tab.dart';
import 'package:fmovies/src/features/home/domain/tab_bloc.dart';
import 'package:fmovies/src/features/home/domain/tab_event.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_bloc.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_state.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTabState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: AppTab.values.indexOf(activeTab),
          onTap: (index) => onTabSelected(AppTab.values[index]),
          items: AppTab.values.map((tab) {
            return BottomNavigationBarItem(
              icon: _buildIcon(tab, state),
              title: Text(
                AppTabHelper.getTitle(tab),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  _buildIcon(AppTab tab, AppTabState state) {
    if (tab == AppTab.favorites &&
        (state as ChangeTabState).triggerAnimation != null) {
      print('tab is favorites and we should trigger animation');
    }
    return AppTabHelper.getIcon(tab);
  }
}
