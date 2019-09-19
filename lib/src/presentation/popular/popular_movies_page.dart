import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fmovies/src/domain/popular/popular_movies_bloc.dart';
import 'package:fmovies/src/domain/popular/popular_movies_event.dart';
import 'package:fmovies/src/domain/popular/popular_movies_state.dart';

class PopularMoviesPage extends StatefulWidget {
  @override
  _PopularMoviesState createState() => _PopularMoviesState();
}

class _PopularMoviesState extends State<PopularMoviesPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PopularMoviesBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Popular movies"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
              builder: (context, state) {
                if (state is PopularMoviesLoading) {
                  return CircularProgressIndicator();
                }
                if (state is PopularMoviesLoaded) {
                  return Text('Finished loading');
                }
                return Text('Something went wrong');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.dispatch(FetchPopularMovies()),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
