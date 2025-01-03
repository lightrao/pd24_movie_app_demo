import 'package:flutter/material.dart';
import 'package:pd24_movie_app_demo/components/movie_card.dart';
import 'package:pd24_movie_app_demo/providers/movie_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MovieProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // context.read<MovieProvider>().loadMovies(context);
    Provider.of<MovieProvider>(context, listen: false).loadMovies(context);
  }

  @override
  Widget build(BuildContext context) {
    // final movies = context.watch<MovieProvider>();
    final movieData = Provider.of<MovieProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: movieData.movieList.length,
          itemBuilder: (context, index) {
            final movie = movieData.movieList[index];

            return MovieCard(movie: movie);
            // return ListTile(
            //   title: Text(movie.title),
            //   subtitle: Text(movie.director),
            //   trailing: Icon(Icons.arrow_forward),
            //   leading: CircleAvatar(
            //     child: Text(movie.title[0]),
            //   ),
            // );
          },
        ),
      ),
    );
  }
}
