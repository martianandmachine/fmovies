import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    final curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeOut,
    );

    animation = Tween<double>(begin: 0, end: 2 * 3.14).animate(curvedAnimation)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reset();
        } else if (status == AnimationStatus.dismissed) {
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
        print('trigger animation');
        _animationController.forward();

        return RotatingTransition(
          angle: animation,
          child: AppTabHelper.getIcon(tab),
        );
      }
    }
    return AppTabHelper.getIcon(tab);
  }
}

class RotatingTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> angle;

  const RotatingTransition({this.angle, this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: angle,
      child: child,
      builder: (context, child) {
        return Transform.rotate(
          angle: angle.value,
          child: child,
        );
      },
    );
  }
}
