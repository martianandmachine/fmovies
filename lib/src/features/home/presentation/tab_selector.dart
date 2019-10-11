import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/core/widgets/animated_favorite_icon.dart';
import 'package:fmovies/src/features/home/domain/app_tab.dart';
import 'package:fmovies/src/features/home/domain/tab_bloc.dart';

class TabSelector extends StatefulWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  _TabSelectorState createState() => _TabSelectorState();
}

class _TabSelectorState extends State<TabSelector>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    animation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.0, end: 1.3),
          weight: 25.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.3, end: 1.6),
          weight: 25.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.6, end: 1.3),
          weight: 25.0,
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.3, end: 1.0),
          weight: 25.0,
        ),
      ],
    ).chain(CurveTween(curve: Curves.bounceInOut)).animate(_animationController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reset();
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTabState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: AppTab.values.indexOf(widget.activeTab),
          onTap: (index) => widget.onTabSelected(AppTab.values[index]),
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
        _animationController.forward();

        return AnimatedFavoriteIcon(
          animation: animation,
          animationController: _animationController,
        );
      }
    }
    return AppTabHelper.getIcon(tab);
  }
}
