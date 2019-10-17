import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/core/widgets/animated_favorite_icon.dart';
import 'package:fmovies/src/features/home/domain/app_tab.dart';
import 'package:fmovies/src/features/home/domain/tab_bloc.dart';

class TabSelector extends StatefulWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    @required this.activeTab,
    @required this.onTabSelected,
  });

  @override
  _TabSelectorState createState() => _TabSelectorState();
}

class _TabSelectorState extends State<TabSelector>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TabBloc, AppTabState>(
      listener: (context, state) {
        if ((state as ChangeTabState).triggerAnimation != null) {
          _animationController.forward();
        }
      },
      child: BlocBuilder<TabBloc, AppTabState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: AppTab.values.indexOf(widget.activeTab),
            onTap: (index) => widget.onTabSelected(AppTab.values[index]),
            items: AppTab.values.map((tab) {
              return BottomNavigationBarItem(
                icon: tab == AppTab.favorites
                    ? AnimatedFavoriteIcon(_animationController)
                    : AppTabHelper.getIcon(tab),
                title: Text(
                  AppTabHelper.getTitle(tab),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
