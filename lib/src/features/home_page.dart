import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/core/di/di.dart';
import 'package:fmovies/src/features/favorites/domain/favorite_movies_bloc.dart';
import 'package:fmovies/src/features/favorites/presentation/favorite_movies_page.dart';
import 'package:fmovies/src/features/popular/domain/popular_movies_bloc.dart';
import 'package:fmovies/src/features/popular/presentation/popular_movies_page.dart';
import 'package:fmovies/src/features/cinemas/domain/cinemas_bloc.dart';
import 'package:fmovies/src/features/cinemas/presentation/cinemas_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final widgetOptions = [
    BlocProvider<PopularMoviesBloc>(
      builder: (context) => getIt<PopularMoviesBloc>(),
      child: PopularMoviesPage(),
    ),
    BlocProvider<FavoriteMoviesBloc>(
      builder: (context) => getIt<FavoriteMoviesBloc>(),
      child: FavoriteMoviePage(),
    ),
    BlocProvider<CinemasBloc>(
      builder: (context) => getIt<CinemasBloc>(),
      child: CinemasPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 11,
        selectedFontSize: 13,
        unselectedIconTheme: IconThemeData(
          size: 20
        ),
        selectedIconTheme: IconThemeData(
            size: 30,
        ),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            title: Text('Popular'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favorites'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            title: Text('Cinemas'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
