import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) {
    // final _movieList = context.watch<MovieProvider>().loadMovies();
    final movies = Provider.of<MovieProvider>(context).loadMovies();

    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(movies[index]),
              subtitle: Text('Movie ${index + 1}'),
              trailing: Icon(Icons.arrow_forward),
              leading: CircleAvatar(
                child: Text(movies[index][0]),
              ),
            );
          },
        ),
      ),
    );
  }
}
