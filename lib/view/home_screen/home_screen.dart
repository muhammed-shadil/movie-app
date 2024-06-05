import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/controller/movie_provider.dart';
import 'package:movie_app/view/movie_Details_screen/movie_details_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        leading: const Icon(Icons.menu),
        title: const Text("CINEMA"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Text(
                "Upcoming Movies",
                style: TextStyle(fontSize: 18),
              ),
            ),
            if (movieProvider.isLoading)
              const SizedBox(
                height: 350,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            else if (movieProvider.errorMessage.isNotEmpty)
              const Center(
                child: Text(
                  "loading",
                  // movieProvider.errorMessage,
                  style: TextStyle(color: Colors.white),
                ),
              )
            else
              CarouselSlider.builder(
                itemCount: movieProvider.upcomingMovies.length,
                itemBuilder: (context, index, movieIndex) {
                  final movie = movieProvider.upcomingMovies[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MovieDetailsScreen(
                            wholedetails: movie,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.network(
                        "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey,
                            child: const Center(
                              child: Text(
                                'Image not available',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 350,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 15),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Popular Movies",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 185,
              child: movieProvider.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : movieProvider.errorMessage.isNotEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                          // Text(
                          //   "loading",
                          //   // movieProvider.errorMessage,
                          //   style: TextStyle(color: Colors.white),
                          // ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movieProvider.popularMovies.length,
                          itemBuilder: (BuildContext context, int index) {
                            final movie = movieProvider.popularMovies[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => MovieDetailsScreen(
                                      wholedetails: movie,
                                    ),
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: 110,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(8),
                                      width: 110,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                                          width: double.infinity,
                                          height: 120,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey,
                                              child: const Center(
                                                child: Text(
                                                  'Image not available',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Text(
                                      movie.title,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Top Rated Movies",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 200,
              child: movieProvider.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : movieProvider.errorMessage.isNotEmpty
                      ? const Center(
                          child: Text(
                            "loading",
                            // movieProvider.errorMessage,
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: movieProvider.topratedMovies.length,
                          itemBuilder: (BuildContext context, int index) {
                            final movie = movieProvider.topratedMovies[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => MovieDetailsScreen(
                                      wholedetails: movie,
                                    ),
                                  ),
                                );
                              },
                              child: SizedBox(
                                width: 110,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.all(8),
                                      width: 110,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                                          width: double.infinity,
                                          height: 120,
                                          fit: BoxFit.cover,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey,
                                              child: const Center(
                                                child: Text(
                                                  'Image not available',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    Text(
                                      movie.title,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
