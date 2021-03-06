import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/core/di/di.dart';
import 'package:fmovies/src/features/cinemas/domain/cinemas_bloc.dart';
import 'package:fmovies/src/features/cinemas/presentation/cinemas_page.dart';
import 'package:fmovies/src/features/favorites/domain/favorite_movies_bloc.dart';
import 'package:fmovies/src/features/favorites/presentation/favorite_movies_page.dart';
import 'package:fmovies/src/features/home/domain/app_tab.dart';
import 'package:fmovies/src/features/home/domain/tab_bloc.dart';
import 'package:fmovies/src/features/home/domain/tab_event.dart';
import 'package:fmovies/src/features/home/presentation/tab_selector.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_bloc.dart';
import 'package:fmovies/src/features/popular/presentation/popular_movies_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TabBloc>(context);
    return BlocBuilder<TabBloc, AppTabState>(
      builder: (context, state) {
        final activeTab = (state as ChangeTabState).activeTab;

        if (activeTab == null) throw Exception('Active tab is null');

        return Scaffold(
          body: Center(
            child: _tabContent(activeTab),
          ),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) => bloc.dispatch(UpdateTab(tab)),
          ),
        );
      },
    );
  }

  _tabContent(AppTab activeTab) {
    switch (activeTab) {
      case AppTab.popular:
        return BlocProvider<PopularMoviesBloc>(
          builder: (context) => getIt<PopularMoviesBloc>(),
          child: PopularMoviesPage(),
        );
      case AppTab.favorites:
        return BlocProvider<FavoriteMoviesBloc>(
          builder: (context) => getIt<FavoriteMoviesBloc>(),
          child: FavoriteMoviePage(),
        );
      case AppTab.cinemas:
        return BlocProvider<CinemasBloc>(
          builder: (context) => getIt<CinemasBloc>(),
          child: CinemasPage(),
        );
    }
  }
}
