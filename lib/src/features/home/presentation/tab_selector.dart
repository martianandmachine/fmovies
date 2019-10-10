import 'package:flutter/material.dart';
import 'package:fmovies/src/features/home/domain/app_tab.dart';

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
    return BottomNavigationBar(
      currentIndex: AppTab.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(AppTab.values[index]),
      items: AppTab.values.map((tab) {
        return BottomNavigationBarItem(
          icon: AppTabHelper.getIcon(tab),
          title: Text(
            AppTabHelper.getTitle(tab),
          ),
        );
      }).toList(),
    );
  }
}
