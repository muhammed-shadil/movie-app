import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/services/api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> upcomingMovies;

  @override
  void initState() {
    upcomingMovies = Api().getUpcomingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        title: Text("data"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("upcoming"),
            FutureBuilder(
              future: upcomingMovies,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final movies = snapshot.data!;
                return CarouselSlider.builder(
                    itemCount: movies.length,
                    itemBuilder: (context, index, movieIndex) {
                      final movie = movies[index];
                      return Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: Image.network(
                            "https://image.tmdb.org/t/p/original/${movie.backDropPath}",fit:BoxFit.fill,),
                      );
                    },
                    options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 1.6,
                        autoPlayInterval: const Duration(seconds: 3)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
