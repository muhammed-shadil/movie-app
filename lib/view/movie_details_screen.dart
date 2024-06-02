import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/model/movie_details_model.dart';
import 'package:movie_app/model/movie_model.dart';
import 'package:movie_app/services/api.dart';

class MovieDetailsScreen extends StatefulWidget {
  const MovieDetailsScreen({
    super.key,
    required this.wholedetails,
  });
  final Movie wholedetails;

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late Future<MovieDetails> moviesdetails;

  @override
  void initState() {
    print(widget.wholedetails.id);
    moviesdetails = Api().getMoviesdetails(widget.wholedetails.id);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: FutureBuilder(
            future: moviesdetails,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                print("yyyyyyyyyyyyyyyyyyyyyyyy");
                return const Center(child: CircularProgressIndicator());
              }
              final moviedetail = snapshot.data!;
              return SizedBox(
                // color: Colors.amber,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 300,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image.network(
                                "https://image.tmdb.org/t/p/original/${moviedetail.backDropPath}",
                                fit: BoxFit.fill,
                              ),
                            ),
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.8),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 30),
                        // color: Color.fromARGB(66, 224, 9, 9),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: moviedetail.genres.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color:
                                          const Color.fromARGB(255, 61, 61, 60),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.all(6),
                                    child: Text(moviedetail.genres[index]),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                moviedetail.title,
                                style: const TextStyle(
                                    fontFamily: "lato",
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.av_timer,
                                  size: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(moviedetail.runtime.toString()),
                                ),
                                const Text("minutes"),
                                const SizedBox(
                                  width: 40,
                                ),
                                const Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 232, 185, 46),
                                  size: 17,
                                ),
                                Text(moviedetail.voteAverage.toString())
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text("Release date"),
                            Text(moviedetail.releaseDate),
                            const SizedBox(
                              height: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Story line",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(
                              moviedetail.overview,
                              style: const TextStyle(height: 1.3, fontSize: 16),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "Budget",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(moviedetail.budget.toString()),
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                "Revenu",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ),
                            Text(moviedetail.revenue.toString()),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
