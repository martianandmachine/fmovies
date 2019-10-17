import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/core/widgets/animated_favorite_icon.dart';
import 'package:fmovies/src/features/home/domain/app_tab.dart';
import 'package:fmovies/src/features/home/domain/tab_bloc.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    @required this.activeTab,
    @required this.onTabSelected,
  });

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
    if (tab == AppTab.favorites) {
      if ((state as ChangeTabState).triggerAnimation != null) {
        return AnimatedFavoriteIcon();
      }
    }
    return AppTabHelper.getIcon(tab);
  }
}
