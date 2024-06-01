import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/services/api.dart';
import 'package:movie_app/view/movie_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> upcomingMovies;
  late Future<List<Movie>> popularMovies;
  late Future<List<Movie>> topratedMovies;

  @override
  void initState() {
    upcomingMovies = Api().getUpcomingMovies();
    popularMovies = Api().getPopularMovies();
    topratedMovies = Api().getTopratedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
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
                          "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                          fit: BoxFit.fill,
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
                      autoPlay: false,
                      autoPlayInterval: const Duration(seconds: 4),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      scrollDirection: Axis.horizontal,
                    ));
              },
            ),
            // Container(color: Colors.amber,width: 110,height: 50,)

            Padding(
              padding: const EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  "Popular Movies",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),

            Container(
              height: 180,
              // color: const Color.fromARGB(255, 80, 79, 76),
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final movies = snapshot.data!;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      final movie = movies[index];
                      return Container(
                        width: 110,
                        child: Column(
                          children: [
                            Container(
                              // color: Colors.amber,
                              margin: const EdgeInsets.all(8),

                              //  MediaQuery.of(context).size.height*0.1,
                              width: 110,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                                  width: double.infinity,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              //  MediaQuery.of(context).size.width*0.1,
                            ),
                            Text(
                              movie.title,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                future: popularMovies,
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
              // color: const Color.fromARGB(255, 80, 79, 76),
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final movies = snapshot.data!;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (BuildContext context, int index) {
                      final movie = movies[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => MovieDetailsScreen(
                                        wholedetails: movie,
                                      )));
                        },
                        child: SizedBox(
                          width: 110,
                          child: Column(
                            children: [
                              Container(
                                // color: Colors.amber,
                                margin: const EdgeInsets.all(8),

                                //  MediaQuery.of(context).size.height*0.1,
                                width: 110,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/original/${movie.backDropPath}",
                                    width: double.infinity,
                                    height: 120,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                //  MediaQuery.of(context).size.width*0.1,
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
                  );
                },
                future: topratedMovies,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
